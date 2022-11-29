import 'package:crud_en_flutter/login_page.dart';
import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //modificacion del login page
      title: 'Material App',
      home: LoginPage(), 
    );
  }
}

