import 'package:get/get.dart';

class LoadingController extends GetxController {
  var isLoading = false.obs;

  void setLoader(bool value) {
    isLoading.value = value;
  }
}
