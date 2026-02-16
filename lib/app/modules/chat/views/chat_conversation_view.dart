import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/app_pages.dart';
import '../controllers/chat_conversation_controller.dart';

class ChatConversationView extends GetView<ChatConversationController> {
  const ChatConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildParticipantInfo(),
            Expanded(
              child: _buildMessagesList(),
            ),
            Obx(() => controller.hasUrgentRequest.value
                ? _buildUrgentRequestCard()
                : const SizedBox.shrink()),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x19EFB94C),
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFEFB84B),
                size: 20,
              ),
            ),
          ),
          Text(
            'CHAT',
            style: GoogleFonts.poppins(
              color: const Color(0xFFEFB84B),
              fontSize: 26,
              fontWeight: FontWeight.w600,
              height: 1.40,
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0x19EFB94C),
                borderRadius: BorderRadius.circular(200),
              ),
              child: const Icon(
                Icons.notifications_none,
                color: Color(0xFFEFB84B),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: const Color(0xFF495057),
          ),
        ),
        
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE0E0E0),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Color(0xFF757575),
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            controller.participantName,
            style: GoogleFonts.poppins(
              color: const Color(0xFF212529),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      controller: controller.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      itemCount: controller.messages.length,
      itemBuilder: (context, index) {
        final message = controller.messages[index];
        return _buildMessageBubble(
          message['text'],
          message['isSent'],
        );
      },
    );
  }

  Widget _buildMessageBubble(String text, bool isSent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            isSent ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isSent) ...[
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFFE0E0E0),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF757575),
                size: 18,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isSent
                    ? const Color(0xFFEFB84B)
                    : const Color(0x19EFB94C),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: isSent ? Colors.white : const Color(0xFF212529),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
          ),
          if (!isSent) ...[
            const SizedBox(width: 8),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFFE0E0E0),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Color(0xFF757575),
                size: 18,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildUrgentRequestCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0x3FBCBCBC),
            blurRadius: 20,
            offset: const Offset(4, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Text(
              'Client Send A Request',
              style: GoogleFonts.poppins(
                color: const Color(0xFF212529),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.50,
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => controller.handleUrgentRequest(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF38B000),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Requested Urgent Assistance',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0x19888888),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: controller.messageController,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF212529),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: 'Type here',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xFF495057),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                onSubmitted: (_) => controller.sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => controller.sendMessage(),
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFFFDD99),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
