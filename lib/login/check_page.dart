import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safevet/login/login_page.dart';
import 'package:safevet/main.dart';
import 'package:safevet/pages/home_page.dart';
import 'package:safevet/tabs_page.dart';

class CheckPage extends StatelessWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHome();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
