import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'welcome': 'Welcome to Nexunid',
      'login': 'Sign In',
      'register_prompt': 'Don\'t have an account? Sign up here',
      'register': 'Sign Up',
      'name': 'Full Name',
      'email': 'Email',
      'nick': 'Username',
      'passworld': 'Password',
      'passworldConfirm': 'Confirm Password',
      'confirm': 'Confirm',
      'settings': 'Settings',
      'return to the beginning': 'Return to the Beginning',
      'recover password': 'Recover Password',
    },

    'es_ES': {
      'welcome': 'Bienvenido a Nexunid',
      'login': 'Iniciar sesión',
      'register_prompt': '¿No tienes cuenta? Regístrate aquí',
      'register': 'Registrarse',
      'name': 'Nombre completo',
      'email': 'Correo',
      'nick': 'Nombre de usuario',
      'passworld': 'Contraseña',
      'passworldConfirm': 'Confirmar contraseña',
      'confirm': 'Confirmar',
      'settings': 'Ajustes',
      'return to the beginning': 'Volver al inicio',
      'recover password': 'Recuperar contraseña',
    },
  };
}
