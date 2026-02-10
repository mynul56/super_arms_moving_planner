import 'package:get/get.dart';

import '../controllers/submission_complete_controller.dart';

class SubmissionCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmissionCompleteController>(() => SubmissionCompleteController());
  }
}
