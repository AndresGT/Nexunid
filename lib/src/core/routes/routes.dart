import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/auth/views/auth_view.dart';
import 'package:nexunid/src/ui/features/splash/bindings/splsh_bindings.dart';
import 'package:nexunid/src/ui/features/splash/views/splash_view.dart';

class Routes {
  static const String splash = '/splash';
  static const String auth = '/auth';

  static List<GetPage> appRoutes() {
    return [
      GetPage(name: splash, page: () => SplashView(), binding: SplshBindings()),
      GetPage(name: auth, page: ()=> AuthView(),)
    ];
  }
}
