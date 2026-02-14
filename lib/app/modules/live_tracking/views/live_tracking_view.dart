import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/live_tracking_controller.dart';

class LiveTrackingView extends GetView<LiveTrackingController> {
  const LiveTrackingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LiveTrackingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LiveTrackingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
