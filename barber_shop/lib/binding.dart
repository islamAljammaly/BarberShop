import 'package:get/get.dart';
import 'controller/shop_status_controller.dart';
import 'controller/waiting_list_controller.dart';
class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingListController>(() => WaitingListController());
    Get.lazyPut<ShopStatusController>(() => ShopStatusController());
  }
}
