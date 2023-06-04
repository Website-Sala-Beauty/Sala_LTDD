// ignore_for_file: use_build_context_synchronously

import 'package:bill_app/pages/login-page-salanail.dart';
import 'package:bill_app/pages/register-page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final _firebase = FirebaseAuth.instance;

class ForgotPassword extends StatefulWidget {
  static const String routerName = '/forgot-pass';

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController userNameController = TextEditingController();

  bool isCheckUserName = false;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  Future<bool> checkEmailExists(String email) async {
    try {
      List<String> signInMethods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  sendMail() async {
    // Xác thực email
    isLoading = false;
    bool isEmailValid =
        await validateCredentials(userNameController.text.toLowerCase());
    if (isEmailValid) {
      // Kiểm tra xem email có tồn tại trong cơ sở dữ liệu hay không
      bool isEmailExists = await checkEmailExists(userNameController.text);
      if (isEmailExists) {
        _firebase.sendPasswordResetEmail(email: userNameController.text);
        isLoading = true;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: const Text(
                  'Một email xác thực đã được gửi đến địa chỉ email của bạn. Vui lòng kiểm tra email và làm theo hướng dẫn để đặt lại mật khẩu.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, LoginPageNail.routerName);
                  },
                  child: const Text('Đóng'),
                ),
              ],
            );
          },
        );
      } else {
        // Hiển thị thông báo
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thông báo'),
              content: const Text(
                  'Địa chỉ email không tồn tại trong cơ sở dữ liệu. Vui lòng kiểm tra lại.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Đóng'),
                ),
              ],
            );
          },
        );
        isLoading = true;
      }
    } else {
      // Hiển thị thông báo
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text(
                'Địa chỉ email không tồn tại. Vui lòng kiểm tra lại.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Đóng'),
              ),
            ],
          );
        },
      );
      isLoading = true;
    }
  }

  Future<bool> validateCredentials(String email) async {
    String url =
        'https://api.hunter.io/v2/email-verifier?email=$email&api_key=1d9d1db36a1c0d90a7c3de73af46a7279f75f523';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data']['result'] == 'deliverable';
    } else {
      throw Exception('Failed to check email validity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // SingleChildScrollView(
        //     child:
        Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_nen.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                //child: Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              color: Colors.white,
                              width: 330,
                              padding: const EdgeInsets.only(
                                  top: 50, left: 20, right: 20, bottom: 10),
                              child: IntrinsicHeight(
                                child: Form(
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: userNameController,
                                        onChanged: (value) => setState(() {
                                          if (value.isEmpty) {
                                            isCheckUserName = true;
                                          } else {
                                            isCheckUserName = false;
                                          }
                                        }),
                                        decoration: const InputDecoration(
                                          labelText: 'Email',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Visibility(
                                            visible: isCheckUserName,
                                            child: const Text(
                                              "Email không được để trống",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          TextButton(
                                              onPressed: () async {
                                                String email =
                                                    userNameController.text;

                                                if (userNameController
                                                    .text.isNotEmpty) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });

                                                  try {
                                                    sendMail();
                                                  } catch (e) {
                                                    isLoading = true;
                                                    // Snack bar thông báo lỗi
                                                    // Gửi mail thất bại
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      content: Text(
                                                          "Gửi mail thất bại"),
                                                    ));
                                                  }
                                                } else {
                                                  isCheckUserName =
                                                      email.isEmpty;
                                                }
                                                isLoading = true;
                                              },

                                              // ignore: sort_child_properties_last
                                              child: isLoading
                                                  ? const Text(
                                                      "Gửi mã xác nhận",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  : const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 252, 188, 215),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    RegisterPage.routerName);
                                              },
                                              child: const Text("Đăng ký")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    LoginPageNail.routerName);
                                              },
                                              child: const Text("Đăng nhập")),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -60,
                              child: Container(
                                padding: const EdgeInsets.only(
                                  left: 105,
                                  // top: 10,
                                ),
                                child: Image.asset(
                                  'assets/images/login_logo.png',
                                  fit: BoxFit.contain,
                                  width: 120,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

            // ),
          ],
        ),
      ),
    );
  }
}

bool checkNull(String email, String password) {
  if (email.isEmpty || password.isEmpty) {
    return false;
  }
  return true;
}
