// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'login-page-salanail.dart';

final _firebase = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  static const routerName = '/register-page';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isCheckPhoneNumber = false;
  bool isCheckName = false;
  bool isCheckPassword = false;
  bool isCheckPasswordConfirm = false;
  bool isCheckEmail = false;
  bool passwordText = true;
  bool passwordTextConfirm = true;
  bool isLoading = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
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
    return Container(
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 10),
                  child: IntrinsicHeight(
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
                                  width: 350,
                                  // height: 500,
                                  padding: const EdgeInsets.only(
                                      top: 70, left: 20, right: 20, bottom: 10),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        // CustomTextFiled(
                                        //   controller: userNameController,
                                        //   text: "Họ & Tên ",
                                        //   textInputType: TextInputType.name,
                                        // ),
                                        TextField(
                                          controller: userNameController,
                                          onChanged: (value) => setState(() {
                                            if (value.isEmpty) {
                                              isCheckName = true;
                                            } else {
                                              isCheckName = false;
                                            }
                                          }),
                                          decoration: const InputDecoration(
                                            labelText: 'Họ và tên',
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
                                              visible: isCheckName,
                                              child: const Text(
                                                "Họ và Tên không được để trống",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          controller: emailController,
                                          onChanged: (value) => setState(() {
                                            if (value.contains('@') &&
                                                value.contains('.')) {
                                              isCheckEmail = false;
                                            } else {
                                              isCheckEmail = true;
                                            }
                                          }),
                                          textInputAction: TextInputAction.done,
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
                                              visible: isCheckEmail,
                                              child: const Text(
                                                "Email không đúng định dạng",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextField(
                                          obscureText: passwordText,
                                          controller: passwordController,
                                          onChanged: (value) => setState(() {
                                            if (value.length < 6) {
                                              isCheckPassword = true;
                                            } else {
                                              isCheckPassword = false;
                                            }
                                          }),
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                passwordText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: const Color.fromARGB(
                                                    255, 93, 166, 173),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  passwordText = !passwordText;
                                                });
                                              },
                                            ),
                                            labelText: 'Password',
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
                                              visible: isCheckPassword,
                                              child: const Text(
                                                "Mật khẩu chứa ít nhất 6 kí tự",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),

                                        TextField(
                                          obscureText: passwordTextConfirm,
                                          controller: confirmPasswordController,
                                          onChanged: (value) => setState(() {
                                            if (value !=
                                                passwordController.text) {
                                              isCheckPasswordConfirm = true;
                                            } else {
                                              isCheckPasswordConfirm = false;
                                            }
                                            // isCheckPasswordConfirm = false;
                                          }),
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                passwordTextConfirm
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: const Color.fromARGB(
                                                    255, 93, 166, 173),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  passwordTextConfirm =
                                                      !passwordTextConfirm;
                                                });
                                              },
                                            ),
                                            labelText: 'Xác nhận mật khẩu',
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Visibility(
                                              visible: isCheckPasswordConfirm,
                                              child: const Text(
                                                "Mật khẩu không khớp",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                  onPressed: () async {
                                                    String name =
                                                        userNameController.text;
                                                    String pass =
                                                        passwordController.text;
                                                    String email =
                                                        emailController.text;
                                                    String password =
                                                        passwordController.text;

                                                    if (checkNull(name)) {
                                                      setState(() {
                                                        isLoading = false;
                                                      });
                                                      //       true;
                                                      bool isEmailValid =
                                                          await validateCredentials(
                                                              email
                                                                  .toLowerCase());
                                                      if (isEmailValid) {
                                                        try {
                                                          final userCredentials =
                                                              await _firebase
                                                                  .createUserWithEmailAndPassword(
                                                                      email:
                                                                          email,
                                                                      password:
                                                                          password);
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'tb_User')
                                                              .doc(
                                                                  userCredentials
                                                                      .user!
                                                                      .uid)
                                                              .set({
                                                            'id':
                                                                userCredentials
                                                                    .user!.uid,
                                                            'name': name,
                                                            //'email': email,
                                                            /// 'password': password,
                                                            'image':
                                                                userNameController
                                                                    .text[0]
                                                                    .toUpperCase(),
                                                          });
                                                          // Đưa email sang  trang login

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  'Đăng kí thành công'),
                                                            ),
                                                          );
                                                          // Đưa email sang  trang login bằng cách dùng Navigator và pushNamed để đưa qua trang login
                                                          Navigator.pushNamed(
                                                              context,
                                                              LoginPageNail
                                                                  .routerName);
                                                        } on FirebaseAuthException catch (e) {
                                                          // Email không tồn tại
                                                          if (e.code ==
                                                              'user-not-found') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    "Email không tồn tại."),
                                                              ),
                                                            );
                                                          }
                                                          if (e.code ==
                                                              'email-already-in-use') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    "Email đã tồn tại."),
                                                              ),
                                                            );
                                                          }
                                                          setState(() {
                                                            isLoading = true;
                                                          });
                                                        } catch (e) {
                                                          print(e);
                                                        }
                                                      } else {
                                                        setState(() {
                                                          isLoading = true;
                                                        });
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Thông báo'),
                                                              content: const Text(
                                                                  'Địa chỉ email không tồn tại. Vui lòng kiểm tra lại.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                          'Đóng'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    }

                                                    // kiểm tra các điều kiện nhập vào có đúng hay không vd:
                                                    else {
                                                      setState(() {
                                                        isLoading = true;
                                                        isCheckName =
                                                            userNameController
                                                                .text.isEmpty;
                                                        isCheckPassword =
                                                            passwordController
                                                                .text.isEmpty;
                                                        isCheckEmail =
                                                            emailController
                                                                .text.isEmpty;
                                                      });
                                                    }
                                                    // Tại sao setState lại không chạy được ở đây nhỉ ? Vì

                                                    isLoading = true;
                                                  },

                                                  // ignore: sort_child_properties_last
                                                  child: isLoading
                                                      ? const Text(
                                                          'Đăng kí',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      : const CircularProgressIndicator(),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 252, 188, 215),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        //const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      LoginPageNail.routerName);
                                                },
                                                child: const Text("Đăng nhập"))
                                          ],
                                        )
                                      ],
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
              ),
            )

            //  )
          ],
        ),
      ),
    );
  }
}

bool checkEmail(String email) {
  if (!email.contains('@gmail.com')) {
    return false;
  }
  return true;
}

bool checkPassword(String pass, String passConfirm) {
  if (pass != passConfirm) {
    return false;
  }
  return true;
}

bool checkNull(String name) {
  if (name.isEmpty) {
    return false;
  }
  return true;
}
