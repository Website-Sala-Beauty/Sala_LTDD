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
  bool isCheckPasswordConfirm = false;
  bool isCheckEmail = false;
  bool passwordText = true;
  bool passwordTextConfirm = true;
  bool isLoading = true;

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
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
                                        TextField(
                                          obscureText: passwordText,
                                          controller: passwordController,
                                          textInputAction: TextInputAction.done,
                                          onEditingComplete: () {
                                            // String userName =
                                            //     userNameController.text;
                                            // String password =
                                            //     passwordController.text;
                                            // checkLogin(userName, password);
                                          },
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
                                        // CustomTextFiled(
                                        //   controller: passwordController,
                                        //   text: "Mật khẩu",
                                        //   obscureText: true,
                                        // ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Mật khẩu phải chứa ít nhất 6 kí tự.",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 10, 10, 10)),
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
                                        TextField(
                                          obscureText: passwordTextConfirm,
                                          controller: confirmPasswordController,
                                          textInputAction: TextInputAction.done,
                                          onEditingComplete: () {
                                            // String userName =
                                            //     userNameController.text;
                                            // String password =
                                            //     passwordController.text;
                                            // checkLogin(userName, password);
                                          },
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
                                        // CustomTextFiled(
                                        //   controller: confirmPasswordController,
                                        //   text: "Xác nhận mật khẩu ",
                                        //   obscureText: true,
                                        // ),
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
                                                    String phone =
                                                        phoneNumberController
                                                            .text;
                                                    String name =
                                                        userNameController.text;
                                                    String pass =
                                                        passwordController.text;
                                                    String email =
                                                        emailController.text;
                                                    String password =
                                                        passwordController.text;
                                                    String passConfirm =
                                                        confirmPasswordController
                                                            .text;

                                                    if (_formKey.currentState!
                                                            .validate() &&
                                                        checkNull(phone, name,
                                                            pass, email)) {
                                                      // Hàm check mail có đúng định dạng hay không

                                                      if (checkPassword(
                                                          password,
                                                          passConfirm)) {
                                                        isCheckPasswordConfirm =
                                                            true;
                                                        if (checkEmail(email)) {
                                                          try {
                                                            final userCredentials =
                                                                await _firebase.createUserWithEmailAndPassword(
                                                                    email:
                                                                        emailController
                                                                            .text,
                                                                    password:
                                                                        passwordController
                                                                            .text);
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
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    'Đăng kí thành công'),
                                                              ),
                                                            );
                                                            Navigator.pushNamed(
                                                                context,
                                                                LoginPageNail
                                                                    .routerName);
                                                          } on FirebaseAuthException catch (e) {
                                                            if (e.code ==
                                                                'weak-password') {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(
                                                                      "Mật khẩu phải chứa ít nhất 6 kí tự."),
                                                                ),
                                                              );

                                                              // print(
                                                              //     'The password provided is too weak.');
                                                            } else if (e.code ==
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
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  "Email không đúng định dạng."),
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          const SnackBar(
                                                            content: Text(
                                                                "Mật khẩu không khớp."),
                                                          ),
                                                        );
                                                      }

                                                      // kiểm tra các điều kiện nhập vào có đúng hay không vd:
                                                    } else {
                                                      setState(() {
                                                        isLoading = true;
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

bool checkNull(String phone, String name, String pass, String email) {
  if (phone.isEmpty || name.isEmpty || pass.isEmpty || email.isEmpty) {
    return false;
  }
  return true;
}
