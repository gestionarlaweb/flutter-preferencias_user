import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/screens/home_page.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferents_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferentsUser();
  await prefs.initPrefs();

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
