import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drink_shop_flutter/db/order/order_service.dart';
import 'package:drink_shop_flutter/models/order/order_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  StreamSubscription<QuerySnapshot>? historySubscription;
  RxList orderList = <OrderModel>[].obs;
  final OrderService orderService = OrderService();
  
  @override
  void onReady() {
    queryHistory();
  }

  Future<void> createOrder({required OrderModel order}) async {
    await orderService.createOrder(order: order);
  }

  void queryHistory() {
    historySubscription =
        orderService.queryHistoryOrder().listen((QuerySnapshot snapshot) {
      List<OrderModel> orders = snapshot.docs.map((DocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return OrderModel.fromMap(data);
      }).toList();
      orderList.assignAll(orders);
    });
  }
}
