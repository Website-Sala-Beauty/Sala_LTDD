// ignore_for_file: file_names

import 'package:bill_app/pages/resources/app-color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/login-page-salanail.dart';

class MasterPage extends StatelessWidget {
  final String? title;
  final bool? isBack;
  // tham số truyền vào là nội dung của body  là file CustomBottomAppBar
  final Widget? body;
  const MasterPage({
    super.key,
    this.body,
    this.title, this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 238, 240),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon( isBack ?? true ? Icons.arrow_back_ios : null,
                size: 30.0, color: AppColor.white)),
        title: Text(title ?? 'Sala Nail',
            style: const TextStyle(fontSize: 25, fontFamily: 'RobotoMono')),
        backgroundColor: const Color.fromARGB(181, 254, 124, 163),
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
                onPressed: () {},
              ),
              IconButton(
                iconSize: MediaQuery.of(context).size.height / 30,
                //padding: const EdgeInsets.only(right: 28.0),
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 243, 180, 201),
                ),
                onPressed: () {},
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
                  Icons.logout_outlined,
                  color: Color.fromARGB(255, 243, 180, 201),
                ),
                onPressed: () async {
                  // hiện thông báo xác nhận đăng xuất
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
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.remove('user');
                              Route route = MaterialPageRoute(
                                builder: (context) => const LoginPageNail(),
                              );
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                context,
                                route,
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Text('Đăng xuất'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
      body: body,
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
