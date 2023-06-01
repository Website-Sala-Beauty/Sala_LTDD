import 'package:bill_app/components/item-home.dart';
import 'package:flutter/material.dart';

import '../components/carousel-home.dart';
import '../components/master-page.dart';
import '../components/service-home.dart';

class HomePage extends StatefulWidget {
    static const routerName = '/home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MasterPage(
      title: 'Home Page',
      isBack: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.1,
          child: Column(
            children: const [
              CarouseHome(),
              itemHome(),
              serviceHome(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types


