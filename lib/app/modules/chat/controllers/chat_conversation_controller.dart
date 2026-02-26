import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatConversationController extends GetxController {
  late final TextEditingController messageController;
  late final ScrollController scrollController;
  
  // Chat participant info
  final String participantName;
  final String orderId;
  
  ChatConversationController({
    this.participantName = 'AL Muntakim',
    this.orderId = '124769746ZX',
  });

  // Mock messages
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'I saw Your Post. I can do The move For you.\nIf You Want I Can Send You An Offer.',
      'isSent': true,
      'timestamp': '10:30 AM',
    },
    {
      'text': 'Send a Custom Offer For 3 Installment.',
      'isSent': false,
      'timestamp': '10:32 AM',
    },
    {
      'text': 'I will Send You The Offer Right Away.',
      'isSent': true,
      'timestamp': '10:33 AM',
    },
    {
      'text': 'Thank You',
      'isSent': false,
      'timestamp': '10:35 AM',
    },
    {
      'text': 'Please Read And Pay The Installment.',
      'isSent': true,
      'timestamp': '10:40 AM',
    },
    {
      'text': 'Thank You',
      'isSent': false,
      'timestamp': '10:42 AM',
    },
    {
      'text': 'Please Read And Pay The Installment.',
      'isSent': true,
      'timestamp': '11:00 AM',
    },
    {
      'text': 'Thank You',
      'isSent': false,
      'timestamp': '11:05 AM',
    },
  ];

  final hasUrgentRequest = true.obs;

  @override
  void onInit() {
    super.onInit();
    messageController = TextEditingController();
    scrollController = ScrollController();
  }

  @override
  void onReady() {
    super.onReady();
    // Scroll to bottom when ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;
    
    // TODO: Send message to backend
    Get.snackbar(
      'Message Sent',
      messageController.text,
      snackPosition: SnackPosition.BOTTOM,
    );
    
    messageController.clear();
  }

  void handleUrgentRequest() {
    // TODO: Handle urgent assistance request
    Get.snackbar(
      'Urgent Request'.tr,
      'Handling urgent assistance request'.tr,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
