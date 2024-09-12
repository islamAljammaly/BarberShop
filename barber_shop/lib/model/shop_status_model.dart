import 'package:cloud_firestore/cloud_firestore.dart';

class ShopStatus {
  bool isOpen;
  DateTime updatedTime;

  ShopStatus({required this.isOpen, required this.updatedTime});

  factory ShopStatus.fromFirestore(Map<String, dynamic> data) {
    return ShopStatus(
      isOpen: data['isOpen'],
      updatedTime: (data['updatedTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'isOpen': isOpen,
      'updatedTime': updatedTime,
    };
  }
}