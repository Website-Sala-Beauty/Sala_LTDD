import 'package:bill_app/components/message-buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  void setupPushNitifications() async {
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    fcm.subscribeToTopic('chat'); //
    // final token = await fcm.getToken();
    // print(token);
  }

  //  hàm lấy thông tin  từ bảng tb_User
  @override
  void initState() {
    super.initState();
    setupPushNitifications();
  }

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('tb_Chat')
            .orderBy('createdAt', descending: true)
            .snapshots(), // lấy dữ liệu từ bảng tb_Chat theo thứ tự giảm dần của thời gian
        builder: (context, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            // nếu không có dữ liệu hoặc dữ liệu rỗng
            return const Center(
              child: Text('Không có dữ liệu'),
            );
          }
          if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Có lỗi xảy ra'),
            );
          }
          final loadMessage = chatSnapshots.data!.docs;
          return ListView.builder(
              padding: const EdgeInsets.only(bottom: 50, left: 12, right: 12),
              itemCount: loadMessage.length,
              reverse: true,
              itemBuilder: (context, index) {
                final chatMessage = loadMessage[index].data();
                final nextChatMessage = index + 1 < loadMessage.length
                    ? loadMessage[index + 1].data()
                    : null; // lấy tin nhắn tiếp theo
                final curentMessage = chatMessage[
                    'userId']; // lấy tin nhắn hiện tại của người dùng hiện tại đang đăng nhập vào hệ thống
                final nextMessage =
                    nextChatMessage != null ? nextChatMessage['userId'] : null;
                final nextUserIsSame = nextMessage ==
                    curentMessage; // kiểm tra xem tin nhắn tiếp theo có phải của cùng 1 người không
                if (nextUserIsSame) {
                  // lấy ảnh từ tb_User

                  return MessageBubble.next(
                    //  username: chatMessage['name'],
                    message: chatMessage['text'],
                    isMe: auth!.uid == curentMessage,
                  );
                } else {
                  return MessageBubble.first(
                    username: chatMessage['name'],
                    message: chatMessage['text'],
                    // lấy ảnh từ tb_User

                    userImage: chatMessage['name'][0].toString().toUpperCase(),
                    isMe: auth!.uid == curentMessage,
                  );
                }
              }
              //Container(
              //       padding: const EdgeInsets.all(8),
              //       child: Text(loadMessage[index]['text']),
              ); //     ));
        });
    // return const Center(
    //   child: Text('Chat Page'),
    // );
  }
}
