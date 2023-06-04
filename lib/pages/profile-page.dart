import 'package:bill_app/components/master-page.dart';
import 'package:flutter/material.dart';

import '../components/profile-custom.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MasterPage(
      body: ProfileCustom(),
    );
  }
}
