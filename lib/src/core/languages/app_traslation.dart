import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'welcome': 'Welcome to',
      'login': 'Login',
      'register_prompt': 'Don\'t have an account? Register here',
      'register': 'Register',
      'name': 'Full Name',
      'email': 'Email',
      'nick': 'User Name',
      'passworld': 'Passworld',
      'passworldConfirm': 'Passworld Confirm',
      'confirm': 'Confirm',
      'settings': 'Settings',
      'return to the beginning': 'Return to the Beginning',
      'recover password': 'Recover Password',
    },

    'es_ES': {
      'welcome': 'Bienvenido a',
      'login': 'Iniciar sesión',
      'register_prompt': '¿No tienes cuenta? Regístrate aquí',
      'register': 'Registro',
      'name': 'Nombre Completo',
      'email': 'Correo',
      'nick': 'Nombre de Usuario',
      'passworld': 'Contraseña',
      'passworldConfirm': 'Confirmar Contraseña',
      'confirm': 'Confirmar',
      'settings': 'Ajustes',
      'return to the beginning': 'Volver al Inicio',
      'recover password': 'Recuper Contraseña',
    },
  };
}
