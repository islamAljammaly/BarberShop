import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String id;
  String name;
  DateTime addedTime;

  Customer({required this.id, required this.name, required this.addedTime});

  factory Customer.fromFirestore(Map<String, dynamic> data) {
    return Customer(
      id: data['id'],
      name: data['name'],
      addedTime: (data['addedTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'addedTime': addedTime,
    };
  }
}