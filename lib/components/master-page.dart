// ignore_for_file: file_names, use_build_context_synchronously

import 'package:bill_app/pages/home-screen.dart';
import 'package:bill_app/pages/message-page.dart';
import 'package:bill_app/pages/resources/app-color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login-page-salanail.dart';
import '../pages/profile-page.dart';
import 'profile-custom.dart';

class MasterPage extends StatefulWidget {
  final String? title;
  final bool? isBack;
  // tham số truyền vào là nội dung của body  là file CustomBottomAppBar
  final Widget? body;
  const MasterPage({
    super.key,
    this.body,
    this.title,
    this.isBack,
  });

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  // Load ảnh từ tb_User đổ vào biến
  String? _image;
  void getAnh() async {
    _image = await FirebaseStorage.instance
        .ref()
        .child('tb_User')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 238, 240),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3D1DC),
        title: Text(
          widget.title ?? 'Sala Nail',
          style: const TextStyle(
              color: Color(0xFF893F3F), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        titleSpacing: 0.0,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), //
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 14,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              IconButton(
                iconSize: MediaQuery.of(context).size.height / 30,
                //padding: const EdgeInsets.only(left: 28.0),
                icon: const Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 243, 180, 201),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              IconButton(
                iconSize: MediaQuery.of(context).size.height / 30,
                //padding: const EdgeInsets.only(right: 28.0),
                icon: const Icon(
                  Icons.message,
                  color: Color.fromARGB(255, 243, 180, 201),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MesagePage(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 20.0),
              IconButton(
                iconSize: MediaQuery.of(context).size.height / 30,
                //padding: const EdgeInsets.only(left: 28.0),
                icon: const Icon(
                  Icons.notifications,
                  color: Color.fromARGB(255, 243, 180, 201),
                ),
                onPressed: () {},
              ),
              IconButton(
                  iconSize: MediaQuery.of(context).size.height / 30,
                  //padding: const EdgeInsets.only(right: 28.0),
                  icon: const Icon(
                    Icons.people,
                    color: Color.fromARGB(255, 243, 180, 201),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileCustom(),
                      ),
                    );
                    // hiện thông báo xác nhận đăng xuất
                  }),
              const SizedBox(),
            ],
          ),
        ),
      ),
      body: widget.body,
      // không bị đẩy khi hiển thị bàn phím
      resizeToAvoidBottomInset: false,

      floatingActionButton: SizedBox(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.height / 14,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Image.asset('assets/images/login_logo.png'),
          ),
        ),
      ),
    );
  }
}
