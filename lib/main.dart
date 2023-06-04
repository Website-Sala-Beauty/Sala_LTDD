import 'package:bill_app/pages/forgot-pass.dart';
import 'package:bill_app/pages/profile-page.dart';
import 'package:bill_app/pages/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'pages/ablum-sanpham.dart';
import 'pages/bill-screen.dart';
import 'pages/cart-page.dart';
import 'pages/home-screen.dart';
import 'pages/login-page-salanail.dart';
import 'pages/register-page.dart';
import 'pages/resources/coming-soon.dart';
import 'pages/statistics-screen.dart';
import 'provider/Products_provider.dart';
import 'firebase_options.dart';

void main() async {
//  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // Khóa xoay màn hình
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sala Beauty',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TimerPage(),
          // home: Details_Page(),
          routes: {
            '/register-page': (context) => const RegisterPage(),
            '/login-page': (context) => const LoginPageNail(),
            '/splash': (context) => const TimerPage(),
            '/home-page': (context) => const HomePage(),
            '/bill-page': (context) => const BillPage(),
            '/album-page': (context) => AblumSanPhamPage(),
            '/cart-page': (context) => const CartPage(),
            '/statistics-page': (context) => const StatisticsPage(),
            '/coming-soon': (context) => const ComingSoonPage(),
            '/forgot-pass': (context) => const ForgotPassword(),
          }
          // routes: {
          //   DetailProductPage.routerName: (context) =>  DetailProductPage()
          // }
          ),
    );
  }
}
