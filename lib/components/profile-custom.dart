// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:bill_app/pages/login-page-salanail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCustom extends StatefulWidget {
  const ProfileCustom({super.key});

  @override
  State<ProfileCustom> createState() => _ProfileCustomState();
}

class _ProfileCustomState extends State<ProfileCustom> {
  File? _lickImageFile;
  bool? isLoading = false;
  bool? isButton = false;
  @override
  void initState() {
    super.initState();
    getAnh();
  }

  void pickImage() async {
    final pickImage = await ImagePicker().pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        maxWidth: 150,
        maxHeight: 150);
    if (pickImage == null) return;
    // setState(() {
    _lickImageFile = File(pickImage.path);
    isButton = true;
    setState(() {});
    // });
  }

  void getAnh() async {
    _lickImageFile = (await FirebaseStorage.instance
        .ref()
        .child('tb_User')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .getDownloadURL()) as File?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3D1DC),
        title: const Text(
          "SALA NAILS & BEAUTY",
          style:
              TextStyle(color: Color(0xFF893F3F), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        titleSpacing: 0.0,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            // const SizedBox(height: 30),
            Row(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Thêm máy ảnh bên góc  CircleAvatar

                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey,
                            // nểu rỗng file thì hiện ảnh mặc định  'assets/images/avt.jpg' ở đây là ảnh mặc định
                            foregroundImage: _lickImageFile != null
                                ? FileImage(_lickImageFile as File)
                                : const AssetImage(
                                        'assets/images/login_logo.png')
                                    as ImageProvider,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            iconSize: 27,
                            onPressed: () {
                              pickImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Color.fromARGB(255, 158, 158, 158),
                            ),
                          ),
                        ),
                      ]),
                      // if (isLoading ?? false) const CircularProgressIndicator(),
                      if (isLoading!)
                        Visibility(
                            visible: isLoading!,
                            child: const CircularProgressIndicator()),
                      if (!isLoading!)
                        Visibility(
                          visible: isButton!,
                          child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isButton = false;

                                  isLoading = true;
                                  if (isLoading!) {
                                    const Positioned(
                                        top: 0,
                                        child: CircularProgressIndicator());
                                  }
                                });
                                final user = FirebaseAuth.instance.currentUser;
                                // update ảnh lên firebase cho tb_user
                                final update = await FirebaseFirestore.instance
                                    .collection('tb_User')
                                    .doc(user!.uid)
                                    .update({
                                  'image': _lickImageFile!.path,
                                });

                                // load lại ảnh từ firebase về cho ứng dụng
                                final data = await FirebaseFirestore.instance
                                    .collection('tb_User')
                                    .doc(user.uid)
                                    .get();
                                final imageURL = data['image'];

                                _lickImageFile = File(imageURL);
                                getAnh();
                                setState(() {
                                  isLoading = false;
                                  isButton = false;
                                });

                                // var storageRef = FirebaseStorage.instance
                                //     .ref()
                                //     .child('image')
                                //     .child('image$count.jpg');

                                print("Đã lưu");
                                // storageRef.putFile(_lickImageFile!);
                                // isLoading = false;
                                // setState(() {});
                                // final imageURL =
                                //     await storageRef.getDownloadURL();
                              },
                              child: const Text('Lưu ảnh')),
                        ),
                    ],
                  ),
                ),
                // const  Expanded(
                //     child: Positioned(
                //       child: CircleAvatar(
                //         radius: 45.0,
                //         backgroundImage: AssetImage('assets/images/avatar.jpg'),
                //       ),
                //     ),
                //   ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const Text(
                        ' Bích Lài',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'MajoraBold',
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        child: const Text(
                          'View and edit profile',
                          style: TextStyle(color: Colors.grey, height: 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 5,
                  child: Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 33,
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/logoma.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Kho Voucher',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            const Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 5.0,
            ),
            // const SizedBox(height: 7),
            Row(
              children: [
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/logo_danhgia.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Đánh giá của tôi',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            const Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),
            Row(
              children: [
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/logo_thietlap.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Thiết lập tài khoản',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            const Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),

            Row(
              children: [
                Column(
                  children: const [
                    Image(
                      image: AssetImage('assets/images/ogo_trogiup.JPG'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Trợ giúp',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            // fontFamily: 'Majoraw500',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 7),
            const Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Đăng xuất'),
                      content: const Text('Bạn có muốn đăng xuất không?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Hủy'),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Đăng xuất với firebase
                            await FirebaseAuth.instance.signOut();
                            // Chuyển về trang đăng nhập
                            Navigator.pushNamedAndRemoveUntil(context,
                                LoginPageNail.routerName, (route) => false);

                            // Đăng xuất
                          },
                          child: const Text('Đăng xuất'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Column(
                    children: const [
                      Image(
                        image: AssetImage('assets/images/logo_dangxuat.JPG'),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Đăng xuất',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              // fontFamily: 'Majoraw500',
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 7),
            const Divider(
              color: Color.fromARGB(255, 218, 218, 218),
              thickness: 1.0,
              indent: 0.0,
              endIndent: 10.0,
            ),
            // const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
