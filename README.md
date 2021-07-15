# preferencias_usuario

Ejemplo de como guardar las preferencias del usuario.

## Getting Started

Guardar las preferencias de usario con Shared_Preferences.
```
SharedPreferences prefs = await SharedPreferences.getInstance();
```

- Explicación:

- Creamos una Clase Singleton para gestionar el SharedPreferences llamda : 
``` PreferentsUser ```
- Nuestra clase:
```
class PreferentsUser {
  // Singleton
  static final PreferentsUser _instancia = new PreferentsUser._internal();
  factory PreferentsUser() {
    return _instancia;
  }
  PreferentsUser._internal();

  // Instancia del SharedPreferences cuando las vaya a utilizar (late
  late SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del Genero
  int get genero {
    return _prefs.getInt('genero') ?? 1; // Si es nulo (??) regresa 1
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

// GET y SET del color secundario
  bool get colorSecundario {
    return _prefs.getBool('colorSecundario') ??
        false; // Si es nulo (??) regresa false
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  // GET y SET del nombre
  String get nombreUsuario {
    return _prefs.getString('nombreUsuario') ??
        ''; // Si es nulo (??) regresa ''
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }
}

```

- Importante inicializar en lo más alto de la App para que no nos regrese un null :

```
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferentsUser();
  await prefs.initPrefs();

  runApp(MyApp());
}
```
- Luego inicializamos el Singleton en la página a utilizar
``` final prefs = new PreferentsUser(); ```
- ...y ya podemos llegar a los datos:
``` Text('Género: ${prefs.genero}'), ```

- Cuando cargamos la página ....
- le pasamos el _nombre al controlador _textController
- y cargamos las preferencias guardadas en el dispositivo.

```
@override
  void initState() {
    super.initState();
    
    _textController = new TextEditingController(text: prefs.nombreUsuario);
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
  }
```

