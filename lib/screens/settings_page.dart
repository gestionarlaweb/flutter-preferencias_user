import 'package:flutter/material.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuestes'),
      ),
      drawer: MenuWidget(),
      body: Center(child: Text('Ajustes Page')),
    );
  }
}
