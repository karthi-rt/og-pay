import 'package:get/get.dart';
import 'package:ogpay/core/services/api_services.dart';
import 'package:ogpay/core/services/preference_services.dart';

/**
 * Created by karthi_rt on 09-01-2026.
 */

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PreferenceServices());
    Get.put(ApiServices());
  }

}