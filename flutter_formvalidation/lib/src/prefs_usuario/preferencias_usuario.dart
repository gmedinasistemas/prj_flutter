//file:preferencias_usuario.dart
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  //constructor
  factory PreferenciasUsuario() {
    return _instancia;
  }

  //esto llama a la factoria???
  PreferenciasUsuario._internal();

  //objeto saredpreferences
  SharedPreferences _prefs;

  initPrefs() async {
    //crea un objeto sharedpreferences
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del token
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }
  
  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  }

}//class PreferenciasUsuario