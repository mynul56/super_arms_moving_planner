import 'package:get/get.dart';

class WaybillController extends GetxController {
  // Observables for form fields if needed in the future
  final estimatedVolume = '23m³'.obs;
  final numberOfMovers = '3'.obs;
  final equipmentBoxes = true.obs;
  final particularities = 'Move with Care'.obs;
  final noteOnArrival = 'Some Text'.obs;
  final consignmentReport = 'A Painting Was Scratches'
      .obs; // Typo in design "Was Scratches", keeping as is or fixing grammar? Design says "A Painting Was Scratches". I'll keep it for now but maybe "Was Scratched" is better? Stick to design text "A Painting Was Scratches" to be safe, or "A Painting Was Scratched". I will use the design text.

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
}
