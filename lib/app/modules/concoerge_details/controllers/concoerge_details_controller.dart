import 'package:get/get.dart';
import 'package:super_arms_moving_planner/app/utils/waybill_pdf_generator.dart';

class ConciergeDetailsController extends GetxController {
  final selectedMainTab = 0.obs;
  final consignmentNote = 'Move Carefully'.obs;
  final selectedParkingTab = 'Pickup Point'.obs;

  void selectMainTab(int index) {
    selectedMainTab.value = index;
  }

  void updateConsignmentNote(String note) {
    consignmentNote.value = note;
  }

  void selectParkingTab(String tab) {
    selectedParkingTab.value = tab;
  }

  Future<void> downloadWaybill() async {
    await WaybillPdfGenerator.generatePdf();
  }
}
