import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/splash/splash_view.dart';

class AppRoutes {
  static const String splash = '/splash';

  static List<GetPage> appRoutes() {
    return [GetPage(name: splash, page: () => const SplashView())];
  }
}
