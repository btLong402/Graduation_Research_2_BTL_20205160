import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drink_shop_flutter/models/order/order_line_model.dart';
import 'package:drink_shop_flutter/models/order/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderService {
  final CollectionReference orderRef =
      FirebaseFirestore.instance.collection('Orders');
  final CollectionReference orderLineRef =
      FirebaseFirestore.instance.collection('OrderLines');
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  Stream<QuerySnapshot> queryOrderNow() {
    return orderRef
        .where('customerId', isEqualTo: uid)
        .where('status', isEqualTo: 0)
        .where('status', isEqualTo: 1)
        .orderBy('createAt', descending: true)
        .snapshots();
  }

  Stream<QuerySnapshot> queryHistoryOrder() {
    return orderRef
        .where('customerId', isEqualTo: uid)
        .where('status', isEqualTo: 2)
        .where('status', isEqualTo: 3)
        .orderBy('createAt', descending: true)
        .snapshots();
  }

  Future createOrder({required OrderModel order}) async {
    return await orderRef.doc(order.orderId).set({
      'orderId': order.orderId,
      'customerId': order.customerId,
      'description': order.description,
      'createAt': order.createAt.millisecondsSinceEpoch,
      'address': order.address,
      'status': order.status.index,
      'isPaid': order.isPaid,
      'total': order.total
    });
  }

  Future createOrderLine({required OrderLineModel orderLine, required String orderId}) async {
    return await orderLineRef.doc(orderLine.orderLineId).set({
      'orderLineId': orderLine.orderLineId,
      'orderId': orderId,
      'productId': orderLine.productId,
      'listTopping': orderLine.listTopping,
      'sizeId': orderLine.sizeId,
      'quantity': orderLine.quantity,
      'subTotal': orderLine.subTotal,
    });
  }
}
