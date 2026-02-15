import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum OrderStatus { onMove, delivered }

enum ServiceType { regularMoves, movingPlanner, concierge, moveWithoutTruck }

enum InstallmentStatus { paid, pending }

class Installment {
  final int number;
  final double amount;
  final InstallmentStatus status;
  final DateTime? paidDate;
  final DateTime dueDate;

  Installment({
    required this.number,
    required this.amount,
    required this.status,
    required this.dueDate,
    this.paidDate,
  });
}

class Order {
  final String id;
  final String orderNumber;
  final String serviceName;
  final ServiceType serviceType;
  final double price;
  final OrderStatus status;
  final DateTime orderDate;

  Order({
    required this.id,
    required this.orderNumber,
    required this.serviceName,
    required this.serviceType,
    required this.price,
    required this.status,
    required this.orderDate,
  });
}

class InstallmentController extends GetxController {
  // Selected filter
  final selectedFilter = 'All Moves'.obs;

  // All orders
  final allOrders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    final now = DateTime.now();

    allOrders.value = [
      Order(
        id: '1',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.regularMoves,
        price: 400.00,
        status: OrderStatus.onMove,
        orderDate: now.subtract(const Duration(days: 2)),
      ),
      Order(
        id: '2',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.movingPlanner,
        price: 400.00,
        status: OrderStatus.delivered,
        orderDate: now.subtract(const Duration(days: 5)),
      ),
      Order(
        id: '3',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.concierge,
        price: 400.00,
        status: OrderStatus.delivered,
        orderDate: now.subtract(const Duration(days: 7)),
      ),
      Order(
        id: '4',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.regularMoves,
        price: 400.00,
        status: OrderStatus.delivered,
        orderDate: now.subtract(const Duration(days: 10)),
      ),
      Order(
        id: '5',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.movingPlanner,
        price: 400.00,
        status: OrderStatus.onMove,
        orderDate: now.subtract(const Duration(days: 1)),
      ),
      Order(
        id: '6',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.moveWithoutTruck,
        price: 400.00,
        status: OrderStatus.onMove,
        orderDate: now,
      ),
      Order(
        id: '7',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.moveWithoutTruck,
        price: 400.00,
        status: OrderStatus.delivered,
        orderDate: now.subtract(const Duration(days: 3)),
      ),
      Order(
        id: '8',
        orderNumber: '124769746ZX',
        serviceName: 'Paris Movers',
        serviceType: ServiceType.concierge,
        price: 400.00,
        status: OrderStatus.onMove,
        orderDate: now.subtract(const Duration(days: 1)),
      ),
    ];
  }

  // Get count for each service type
  int getServiceTypeCount(ServiceType type) {
    return allOrders.where((order) => order.serviceType == type).length;
  }

  // Get filtered orders based on selected tab
  List<Order> get filteredOrders {
    if (selectedFilter.value == 'All Moves') {
      return allOrders.toList();
    } else if (selectedFilter.value == 'On Move') {
      return allOrders
          .where((order) => order.status == OrderStatus.onMove)
          .toList();
    } else {
      return allOrders
          .where((order) => order.status == OrderStatus.delivered)
          .toList();
    }
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  Color getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.onMove:
        return const Color(0xFF00BCD4); // Cyan
      case OrderStatus.delivered:
        return const Color(0xFF4CAF50); // Green
    }
  }

  String getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.onMove:
        return 'On Move';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  String getServiceTypeName(ServiceType type) {
    switch (type) {
      case ServiceType.regularMoves:
        return 'Regular Moves';
      case ServiceType.movingPlanner:
        return 'Moving Planner';
      case ServiceType.concierge:
        return 'Concierge';
      case ServiceType.moveWithoutTruck:
        return 'Move Without Truck';
    }
  }

  Color getServiceTypeColor(ServiceType type) {
    switch (type) {
      case ServiceType.regularMoves:
        return const Color(0xFFFFD4E5); // Pink
      case ServiceType.movingPlanner:
        return const Color(0xFFD4F4DD); // Light Green
      case ServiceType.concierge:
        return const Color(0xFFFFF4DC); // Beige
      case ServiceType.moveWithoutTruck:
        return const Color(0xFFE5DCFF); // Light Purple
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
