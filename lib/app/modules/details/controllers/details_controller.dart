import 'package:get/get.dart';

class DetailsController extends GetxController {
  //TODO: Implement DetailsController

  final selectedParkingTab = 'Pickup Point'.obs;

  void selectParkingTab(String tab) {
    selectedParkingTab.value = tab;
  }
}
