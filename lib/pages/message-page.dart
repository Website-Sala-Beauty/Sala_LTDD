import 'package:bill_app/components/chat-page.dart';
import 'package:bill_app/components/new-chat.dart';
import 'package:bill_app/pages/resources/app-color.dart';
import 'package:flutter/material.dart';

class MesagePage extends StatelessWidget {
  static const routerName = '/chat';
  const MesagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 238, 240),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                size: 30.0, color: AppColor.white)),
        title: const Text('Message',
            style: TextStyle(fontSize: 25, fontFamily: 'RobotoMono')),
        backgroundColor: const Color.fromARGB(181, 254, 124, 163),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: ChatPage()),
            NewChat(),
          ],
        ),
      ),
    );
  }
}
