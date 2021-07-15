import 'package:shared_preferences/shared_preferences.dart';

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
