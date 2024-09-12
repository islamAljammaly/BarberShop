import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/shop_status_model.dart';


class ShopStatusController extends GetxController {
  var shopStatus = ShopStatus(isOpen: false, updatedTime: DateTime.now()).obs;

  @override
  void onInit() {
    super.onInit();
    fetchShopStatus();
  }

  void fetchShopStatus() {
    FirebaseFirestore.instance.collection('shop_control').doc('shop_status')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        shopStatus.value = ShopStatus.fromFirestore(snapshot.data()!);
      }
    });
  }

  Future<void> toggleShopStatus() async {
    var newStatus = !shopStatus.value.isOpen;
    await FirebaseFirestore.instance.collection('shop_control').doc('shop_status')
        .set({
      'isOpen': newStatus,
      'updatedTime': DateTime.now(),
    });
  }
}
