import 'package:flutter/material.dart';
import 'package:preferencias_usuario/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
