import 'package:get/get.dart';
import 'chat_conversation_controller.dart';
import '../views/chat_conversation_view.dart';

class ChatController extends GetxController {
  // Mock chat history data
  final List<Map<String, dynamic>> chatHistory = [
    {
      'name': 'AL Muntakim',
      'orderId': '124769746ZX',
      'price': '450',
      'moveType': 'Moving Planner',
      'from': 'Paris',
      'to': 'Paris',
    },
    {
      'name': 'AL Muntakim',
      'orderId': '124769746ZX',
      'price': '450',
      'moveType': 'Move',
      'from': 'Paris',
      'to': 'Paris',
    },
    {
      'name': 'AL Muntakim',
      'orderId': '124769746ZX',
      'price': '450',
      'moveType': 'Concierge',
      'from': 'Paris',
      'to': 'Paris',
    },
    {
      'name': 'AL Muntakim',
      'orderId': '124769746ZX',
      'price': '700',
      'moveType': 'Truckfree',
      'from': 'Paris',
      'to': 'Paris',
    },
  ];

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

  void openChat(String orderId, String name) {
    // Navigate to chat conversation
    Get.to(
      () => const ChatConversationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChatConversationController>(
          () => ChatConversationController(
            participantName: name,
            orderId: orderId,
          ),
        );
      }),
    );
  }
}
