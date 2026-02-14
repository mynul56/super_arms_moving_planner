import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var selectedCountry = 'United State'.obs;
  final countries = [
    'United State',
    'United Kingdom',
    'Canada',
    'Australia',
    'Germany',
    'France',
    'India',
    'Japan',
  ].obs;

  void increment() => count.value++;
}
