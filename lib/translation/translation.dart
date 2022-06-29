import 'package:get/get.dart';
import 'langs/ar.dart';
import 'langs/en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
