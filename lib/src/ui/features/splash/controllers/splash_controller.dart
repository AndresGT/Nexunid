// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class SplashController extends GetxController {
  final _storage = GetStorage('private');

  @override
  void onInit() {
    super.onInit();
    splashRoutes();
  }

  Future<void> splashRoutes() async {
    print('Iniciando controlador splash...');

    // Delay opcional para mostrar el splash
    await Future.delayed(const Duration(seconds: 2));

    final token = _storage.read('token');

    if (token == null || token.isEmpty) {
      print('Token no encontrado. Redirigiendo al login...');
      Get.offAllNamed('/auth');
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(''), // URL de validación de token
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('Token válido. Redirigiendo a home...');
        Get.offAllNamed('/home');
      } else {
        print('Token inválido o expirado. Redirigiendo al login...');
        Get.offAllNamed('/auth');
      }
    } catch (e) {
      print('Error al validar token: $e');
      Get.offAllNamed('/auth');
    }
  }
}
