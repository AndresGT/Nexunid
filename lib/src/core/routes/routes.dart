import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/auth/views/auth_login_view.dart';
import 'package:nexunid/src/ui/features/auth/views/auth_register_view.dart';
import 'package:nexunid/src/ui/features/auth/views/auth_view.dart';
import 'package:nexunid/src/ui/features/layout/bindings/layout_binding.dart';
import 'package:nexunid/src/ui/features/layout/views/layout_view.dart';
import 'package:nexunid/src/ui/features/splash/bindings/splsh_bindings.dart';
import 'package:nexunid/src/ui/features/splash/views/splash_view.dart';

class Routes {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';

  static List<GetPage> appRoutes() {
    return [
      GetPage(name: splash, page: () => SplashView(), binding: SplshBindings()),
      GetPage(name: auth, page: () => AuthView()),
      GetPage(name: login, page: () => AuthLoginView()),
      GetPage(name: register, page: () => AuthRegisterView()),
      GetPage(name: home, page: () => HomeView(), binding: LayoutBinding()),
    ];
  }
}
