import 'package:flutter/material.dart';
import 'package:preferencias_usuario/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _colorSecundario = false;
  int? _genero = 1;
  String _nombre = 'David';
  TextEditingController? _textController;

  @override
  void initState() {
    // Al inicializar pasale el _nombre al controlador _textController
    _textController = new TextEditingController(text: _nombre);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajuestes'),
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
                _colorSecundario = value;
                setState(() {});
              },
            ),
            RadioListTile(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: (value) {
                _genero = value as int?;
                setState(() {
                  print(value);
                });
              },
            ),
            RadioListTile(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: (value) {
                _genero = value as int?;
                setState(() {
                  print(value);
                });
              },
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
                  onChanged: (value) {},
                ),
              ),
            )
          ],
        ));
  }
}
