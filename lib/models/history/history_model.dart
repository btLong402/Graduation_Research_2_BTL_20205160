// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class HistoryModel {
  final String customerId;
  final List<String> listOrder;
  HistoryModel({
    required this.customerId,
    required this.listOrder,
  });

  HistoryModel copyWith({
    String? customerId,
    List<String>? listOrder,
  }) {
    return HistoryModel(
      customerId: customerId ?? this.customerId,
      listOrder: listOrder ?? this.listOrder,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerId': customerId,
      'listOrder': listOrder,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      customerId: map['customerId'] as String,
      listOrder: List<String>.from((map['listOrder'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HistoryModel(customerId: $customerId, listOrder: $listOrder)';

  @override
  bool operator ==(covariant HistoryModel other) {
    if (identical(this, other)) return true;

    return other.customerId == customerId &&
        listEquals(other.listOrder, listOrder);
  }

  @override
  int get hashCode => customerId.hashCode ^ listOrder.hashCode;
}
