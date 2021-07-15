import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/shared_prefs/preferents_user.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Llamada al Singleton
  final prefs = new PreferentsUser();

  bool? _colorSecundario;
  int? _genero;

  TextEditingController? _textController;

  @override
  void initState() {
    super.initState();
    // Al inicializar pasale el _nombre al controlador _textController
    // y cargar las preferencias
    _textController = new TextEditingController(text: prefs.nombreUsuario);
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
  }

// Refactorizado
  _setSelectedRadio(int? value) {
    setState(() {
      prefs.genero = value ?? 1; // Si es ?? nulo pasale el valor 1
      _genero = value;
    });
  }

  _setColorSecundario(bool value) {
    return setState(() {
      _colorSecundario = value;
      prefs.colorSecundario = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          // Color
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.green,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: [
            Container(
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario!, // false, true
              title: Text('Color secundario'),
              onChanged: (value) {
                _setColorSecundario(value);
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre de la persona',
                  ),
                  onChanged: (value) {
                    prefs.nombreUsuario = value;
                  },
                ),
              ),
            )
          ],
        ));
  }
}
