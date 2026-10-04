import 'package:get/get.dart';

import 'en_us.dart';
import 'es_es.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'es_ES': esES};
}
