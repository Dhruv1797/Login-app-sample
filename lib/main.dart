import 'package:flutter/material.dart';
import 'package:project_1/Login_screen.dart';
import 'package:project_1/content.dart';
import 'package:project_1/sign_up.dart';
import 'intro_page.dart';
import 'sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: intropage(),
      routes: {
        intropage.routeName: (ctx) => intropage(),
        signup.routeName: (ctx) => signup(),
        Login.routeName: (ctx) => Login(),
        content.routeName: (ctx) => content(),
      },
    );
  }
}
