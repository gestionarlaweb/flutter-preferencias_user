import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferents_user.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  // Llamada al Singleton
  final prefs = new PreferentsUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias usaurio'),
        // Color
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.green,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario ${prefs.colorSecundario}'),
          Divider(),
          Text('Género: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombreUsuario}'),
          Divider(),
        ],
      ),
    );
  }
}
