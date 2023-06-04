import 'package:bill_app/pages/resources/app-color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewChat extends StatefulWidget {
  const NewChat({super.key});

  @override
  State<NewChat> createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  TextEditingController newChatcontroller = TextEditingController();
  bool _showSendIcon = false;
  // @override
  // void initState() {
  //   super.initState();
  //   // FocusScope.of(context).unfocus();
  // }

  @override
  void dispose() {
    newChatcontroller.dispose();
    super.dispose();
  }

  void removeAllChat() {
    // Xóa tất cả bản ghi trong bảng tb_Chat
    // xóa tất cả bản ghi trong bảng tb_Chat khi người dùng vào màn hình chat
    FirebaseFirestore.instance.collection('tb_Chat').get().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  void _submit() async {
    final enteredMessage = newChatcontroller.text;
    if (enteredMessage.isEmpty) {
      return;
    }
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('tb_User')
        .doc(user!.uid)
        .get();
    FirebaseFirestore.instance.collection('tb_Chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(), // lấy thời gian hiện tại gồm cả ngày và giờ
      'userId': user.uid,
      'name': userData.data()!['name'], // là
    });
    newChatcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 14, right: 15),
      child: Row(children: [
        Expanded(
            flex: 20,
            child: TextField(
              controller: newChatcontroller,
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  _showSendIcon = value.isNotEmpty;
                });
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  hintText: 'Nhập tin nhắn',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 3, 177, 208)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
            )),
        Visibility(
          visible: _showSendIcon,
          child: Expanded(
            flex: 2,
            child: IconButton(
                onPressed: _submit,
                icon: const Icon(
                  Icons.send,
                  color: Color.fromARGB(255, 3, 177, 208),
                )),
          ),
        )
      ]),
    );
  }
}
