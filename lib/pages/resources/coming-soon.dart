import 'package:bill_app/components/master-page.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  static const routerName = '/coming-soon';
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MasterPage(
      title: 'Coming Soon',
      body: Center(
        child: Text("COMING SOON"),
      ),
    );
  }
}
