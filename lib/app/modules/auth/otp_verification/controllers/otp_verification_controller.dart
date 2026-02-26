import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class OtpVerificationController extends GetxController {
  final List<TextEditingController> otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> otpFocusNodes = List.generate(4, (_) => FocusNode());

  final timerText = '00:30 Seconds'.obs;
  Timer? _timer;
  int _remainingSeconds = 30;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.onClose();
  }

  void _startTimer() {
    _remainingSeconds = 30;
    _updateTimerText();
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        _updateTimerText();
      } else {
        timer.cancel();
      }
    });
  }

  void _updateTimerText() {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    timerText.value =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')} Seconds';
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      // Move to next field
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      // Move to previous field
      otpFocusNodes[index - 1].requestFocus();
    }
  }

  void verifyOtp() {
    final otp = otpControllers.map((c) => c.text).join();

    if (otp.length != 4) {
      Get.snackbar(
        'Error'.tr,
        'Please enter the complete OTP'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // TODO: Implement OTP verification logic
    // Navigate to reset password screen after successful verification
    Get.toNamed(Routes.RESET_PASSWORD);
  }

  void resendOtp() {
    if (_remainingSeconds == 0) {
      // TODO: Implement resend OTP logic
      Get.snackbar(
        'Success'.tr,
        'OTP has been resent to your email'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
      _startTimer();
    }
  }
}
