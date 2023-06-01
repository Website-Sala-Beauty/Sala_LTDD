// ignore_for_file: use_build_context_synchronously

import 'package:bill_app/pages/resources/app-color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import '../components/custom-text-file-form.dart';
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
  bool isCheckPasswordConfirm = true;
  bool isCheckEmail = false;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool checkConfirmPassword(String password, String confirmPassword) {
  if (password != confirmPassword) {
    return false;
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
                                        CustomTextFiled(
                                          controller: phoneNumberController,
                                          text: "Số điện thoại",
                                          textInputType: TextInputType.phone,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Visibility(
                                              visible: isCheckPhoneNumber,
                                              child: const Text(
                                                "SDT không được để trống",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFiled(
                                          controller: userNameController,
                                          text: "Họ & Tên ",
                                          textInputType: TextInputType.name,
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
                                        CustomTextFiled(
                                          controller: emailController,
                                          text: "Email",
                                          textInputType:
                                              TextInputType.emailAddress,
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
                                                "Email không được để trống",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFiled(
                                          controller: passwordController,
                                          text: "Mật khẩu ",
                                          obscureText: true,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Mật khẩu phải chứa ít nhất 6 kí tự.",
                                              style: TextStyle(
                                                  color: AppColor.red),
                                            ),
                                          ],
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
                                                "Mật khẩu không được để trống",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFiled(
                                          controller: confirmPasswordController,
                                          text: "Xác nhận mật khẩu ",
                                          obscureText: true,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Visibility(
                                              visible: !isCheckPasswordConfirm ,
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
                                                    if (phoneNumberController
                                                            .text.isEmpty ||
                                                        userNameController
                                                            .text.isEmpty ||
                                                        passwordController
                                                            .text.isEmpty ||
                                                        emailController
                                                            .text.isEmpty) {
                                                      setState(() {
                                                        isCheckPhoneNumber =
                                                            phoneNumberController
                                                                .text.isEmpty;
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
                                                    } else {
                                                      //check mail
                                                      if (!emailController.text
                                                          .contains('@')) {
                                                        setState(() {
                                                          isCheckPhoneNumber =
                                                              phoneNumberController
                                                                  .text.isEmpty;
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
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                'Email không hợp lệ!'),
                                                          ),
                                                        );
                                                        // check password
                                                      } else {
                                                        try {
                                                          //firebase auth
                                                          final userCredentials =
                                                              await _firebase.createUserWithEmailAndPassword(
                                                                  email:
                                                                      emailController
                                                                          .text,
                                                                  password:
                                                                      passwordController
                                                                          .text
                                                                          .trim());
                                                          // userCredentials.user!.uid  user tại sao lỗi

                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'tb_User')
                                                              .doc(
                                                                  userCredentials
                                                                      .user!
                                                                      .uid)
                                                              .set({
                                                            'name':
                                                                userNameController
                                                                    .text,
                                                            'email':
                                                                emailController
                                                                    .text,
                                                            'phone':
                                                                phoneNumberController
                                                                    .text,
                                                            'password':
                                                                passwordController
                                                                    .text,
                                                            'image':
                                                                userNameController
                                                                    .text[0]
                                                                    .toUpperCase(),
                                                          });

                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const LoginPageNail()));
                                                        } on FirebaseAuthException catch (err) {
                                                          if (err.code ==
                                                              'weak-password') {
                                                            print(
                                                                'Mật khẩu phải chứa ít nhất 6 kí tự.');
                                                          } else if (err.code ==
                                                              'email-already-in-use') {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    'Email đã tồn tại!'),
                                                              ),
                                                            );
                                                          }
                                                          // firebase store
                                                        } catch (err) {
                                                          print(err);
                                                        }
                                                      }
                                                    }
                                                  },

                                                  // ignore: sort_child_properties_last
                                                  child: const Text(
                                                    "ĐĂNG KÝ",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 252, 188, 215),
                                                  )),
                                            ),
                                            // TextButton(
                                            //     onPressed: () {},
                                            //     // ignore: sort_child_properties_last
                                            //     child: const Text(
                                            //       "ĐĂNG KÝ",
                                            //       style: TextStyle(color: Colors.white),
                                            //     ),
                                            //     style: TextButton.styleFrom(
                                            //       backgroundColor: const Color.fromARGB(
                                            //           255, 252, 188, 215),
                                            //     )),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
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


