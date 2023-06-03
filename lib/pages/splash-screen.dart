// ignore: file_names
// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  static const routerName = '/splash';

  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkLoginStatus();
    });
  }

  void checkLoginStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> slide = [
      'assets/images/login_logo.png',
      'assets/images/login_logo.png',
    ];
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              // margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(
                slide[index],
                fit: BoxFit.contain,
              ),
            );
          },
          options: CarouselOptions(
            // height: 150.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn, // tốc độ chạy
            pauseAutoPlayOnTouch: true, // khi chạm vào thì dừng
            aspectRatio: 1.0,
            enlargeCenterPage: true, // phóng to ảnh giữa
            viewportFraction: 1.0, // chiều rộng của ảnh trong slide (1 là full)
          ),
        ),
        // child: Image.asset('assets/images/login_logo.png'),
      ),
    ));
  }
}
