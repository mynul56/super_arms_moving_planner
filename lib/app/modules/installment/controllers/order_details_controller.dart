import 'package:get/get.dart';
import 'installment_controller.dart';

class OrderDetailsController extends GetxController {
  late Order order;
  final installments = <Installment>[].obs;

  int get totalInstallments => installments.length;
  int get paidInstallmentsCount =>
      installments.where((i) => i.status == InstallmentStatus.paid).length;
  double get paymentProgress =>
      totalInstallments > 0 ? paidInstallmentsCount / totalInstallments : 0.0;

  @override
  void onInit() {
    super.onInit();
    // Get order from navigation arguments
    order = Get.arguments as Order;
    _loadInstallments();
  }

  void _loadInstallments() {
    // Create 3 installments based on the order price
    final installmentAmount = order.price / 3;
    final now = DateTime.now();

    installments.value = [
      Installment(
        number: 1,
        amount: installmentAmount,
        status: InstallmentStatus.paid,
        dueDate: now.subtract(const Duration(days: 60)),
        paidDate: now.subtract(const Duration(days: 30)),
      ),
      Installment(
        number: 2,
        amount: installmentAmount,
        status: InstallmentStatus.paid,
        dueDate: now.subtract(const Duration(days: 30)),
        paidDate: now.subtract(const Duration(days: 15)),
      ),
      Installment(
        number: 3,
        amount: installmentAmount,
        status: InstallmentStatus.pending,
        dueDate: now.add(const Duration(days: 30)),
        paidDate: null,
      ),
    ];
  }
}
