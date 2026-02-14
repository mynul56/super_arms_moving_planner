import 'package:get/get.dart';
import 'package:super_arms_moving_planner/app/utils/waybill_pdf_generator.dart';

class MoveWithoutTruckDetailsController extends GetxController {
  final selectedParkingTab = 'Pickup Point'.obs;
  final selectedMainTab = 0.obs;
  final consignmentNote = 'Move Carefully'.obs;

  void selectParkingTab(String tab) {
    selectedParkingTab.value = tab;
  }

  void selectMainTab(int index) {
    selectedMainTab.value = index;
  }

  void updateConsignmentNote(String note) {
    consignmentNote.value = note;
  }

  Future<void> downloadWaybill() async {
    await WaybillPdfGenerator.generatePdf();
  }
}
