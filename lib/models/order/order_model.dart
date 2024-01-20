// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drink_shop_flutter/utils/constant.dart';

class OrderModel {
  final String orderId;
  final String customerId;
  final String? description;
  final DateTime createAt;
  final Status status;
  final bool isPaid;
  final int total;
  final String address;
  OrderModel({
    required this.orderId,
    required this.customerId,
    this.description,
    required this.createAt,
    required this.status,
    required this.isPaid,
    required this.total,
    required this.address,
  });

  OrderModel copyWith({
    String? orderId,
    String? customerId,
    String? description,
    DateTime? createAt,
    Status? status,
    bool? isPaid,
    int? total,
    String? address,
  }) {
    return OrderModel(
      orderId: orderId ?? this.orderId,
      customerId: customerId ?? this.customerId,
      description: description ?? this.description,
      createAt: createAt ?? this.createAt,
      status: status ?? this.status,
      isPaid: isPaid ?? this.isPaid,
      total: total ?? this.total,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'customerId': customerId,
      'description': description,
      'createAt': createAt.millisecondsSinceEpoch,
      'status': status.index,
      'isPaid': isPaid,
      'total': total,
      'address': address,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'] as String,
      customerId: map['customerId'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      createAt: DateTime.fromMillisecondsSinceEpoch(map['createAt'] as int),
      status: Status.values[map['status']],
      isPaid: map['isPaid'] as bool,
      total: map['total'] as int,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(orderId: $orderId, customerId: $customerId, description: $description, createAt: $createAt, status: $status, isPaid: $isPaid, total: $total, address: $address)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.customerId == customerId &&
        other.description == description &&
        other.createAt == createAt &&
        other.status == status &&
        other.isPaid == isPaid &&
        other.total == total &&
        other.address == address;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        customerId.hashCode ^
        description.hashCode ^
        createAt.hashCode ^
        status.hashCode ^
        isPaid.hashCode ^
        total.hashCode ^
        address.hashCode;
  }
}
