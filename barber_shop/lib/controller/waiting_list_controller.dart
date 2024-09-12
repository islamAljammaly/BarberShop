import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/customer_model.dart';


class WaitingListController extends GetxController {
  var waitingList = <Customer>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWaitingList();
  }

  void fetchWaitingList() {
    FirebaseFirestore.instance.collection('waiting_list')
        .orderBy('addedTime', descending: false)
        .snapshots()
        .listen((snapshot) {
      waitingList.value = snapshot.docs
          .map((doc) => Customer.fromFirestore(doc.data()))
          .toList();
    });
  }

  Future<void> addCustomer(String name) async {
    var customer = Customer(id: DateTime.now().toString(), name: name, addedTime: DateTime.now());
    await FirebaseFirestore.instance.collection('waiting_list').add(customer.toFirestore());
  }

  Future<void> removeCustomer(String id) async {
    var doc = await FirebaseFirestore.instance.collection('waiting_list')
        .where('id', isEqualTo: id)
        .get();
    if (doc.docs.isNotEmpty) {
      await doc.docs.first.reference.delete();
    }
  }
}
