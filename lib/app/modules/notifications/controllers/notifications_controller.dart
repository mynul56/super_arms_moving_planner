import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final isSettingsOpen = false.obs;
  final areNotificationsEnabled = true.obs;

  final notifications = <Map<String, dynamic>>[
    {
      'type': 'today',
      'title': 'Order ID: 124769746ZX is delivered',
      'time': '7h',
      'isRead': false,
    },
    {
      'type': 'today',
      'title': 'Order ID: 124769746ZX reached location',
      'time': '7h',
      'isRead': false,
    },
    {
      'type': 'today',
      'title': 'Al Muntaqim rated your service 4 out of 5 stars.',
      'time': '7h',
      'isRead': false,
    },
    {
      'type': 'today',
      'title': 'Trnx Id XXXXXXXX is paid to your bank account',
      'time': '7h',
      'isRead': false,
    },
    {
      'type': 'today',
      'title': 'Order ID XXXXXXX’s service amount is added to your wallet',
      'time': '7h',
      'isRead': false,
    },
    {
      'type': 'yesterday',
      'title': 'Order ID: 124769746ZX is delivered',
      'time': '7h',
      'isRead': true,
    },
    {
      'type': 'yesterday',
      'title': 'Al Muntaqim rated your service 4 out of 5 stars.',
      'time': '7h',
      'isRead': true,
    },
    {
      'type': 'yesterday',
      'title': 'Trnx Id XXXXXXXX is paid to your bank account',
      'time': '7h',
      'isRead': true,
    },
    {
      'type': 'yesterday',
      'title': 'Order ID XXXXXXX’s service amount is added to your wallet',
      'time': '7h',
      'isRead': true,
    },
  ].obs;

  void toggleSettings() {
    isSettingsOpen.value = !isSettingsOpen.value;
  }

  void toggleNotifications(bool value) {
    areNotificationsEnabled.value = value;
  }
}
