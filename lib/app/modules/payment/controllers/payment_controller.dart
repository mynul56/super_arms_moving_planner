import 'package:get/get.dart';
import '../views/payment_dialogs.dart';

class PaymentController extends GetxController {
  final selectedFilter = 'All'.obs;

  // Dummy data for transactions
  final transactions = <Map<String, dynamic>>[
    {
      'id': 'TRX-987654321',
      'status': 'Paid',
      'amount': '€485',
      'date': '2023-10-25',
    },
    {
      'id': 'TRX-123456789',
      'status': 'Pending',
      'amount': '€485',
      'date': '2023-10-26',
    },
    {
      'id': 'TRX-456789123',
      'status': 'Clearable Consignment',
      'amount': '€485',
      'date': '2023-10-27',
    },
    {
      'id': 'TRX-789123456',
      'status': 'Paid',
      'amount': '€1200',
      'date': '2023-10-24',
    },
    {
      'id': 'TRX-321654987',
      'status': 'Pending',
      'amount': '€350',
      'date': '2023-10-28',
    },
  ].obs;

  List<Map<String, dynamic>> get filteredTransactions {
    if (selectedFilter.value == 'All') {
      return transactions;
    }
    return transactions
        .where((t) => t['status'] == selectedFilter.value)
        .toList();
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }

  void requestPayment() {
    Get.dialog(const PaymentConfirmationDialog(), barrierDismissible: false);
  }

  void confirmPayment() {
    Get.back(); // Close confirmation dialog
    // Simulate API call or processing
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.dialog(const PaymentSuccessDialog(), barrierDismissible: false);
    });
  }
}
