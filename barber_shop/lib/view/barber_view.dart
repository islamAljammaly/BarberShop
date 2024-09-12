import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/shop_status_controller.dart';
import '../controller/waiting_list_controller.dart';

class BarberView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * 0.05;  
          double buttonWidth = constraints.maxWidth * 0.6;  
          double imageSize = constraints.maxWidth * 0.15;  

          return Column(
            children: [
              Obx(() {
                var shopStatus = Get.find<ShopStatusController>().shopStatus.value;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    shopStatus.isOpen ? "المحل مفتوح حالياً" : "المحل مغلق حالياً",
                    style: TextStyle(
                      fontSize: fontSize,
                      color: shopStatus.isOpen ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }),

              SizedBox(height: 20),
              Obx(() {
                var shopStatus = Get.find<ShopStatusController>().shopStatus.value;
                return SizedBox(
                  width: buttonWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.find<ShopStatusController>().toggleShopStatus();
                    },
                    child: Text(
                      shopStatus.isOpen ? "أغلق المحل" : "افتح المحل",
                      style: TextStyle(fontSize: fontSize * 0.8),  
                    ),
                  ),
                );
              }),

              Expanded(
                child: Obx(() {
                  var waitingList = Get.find<WaitingListController>().waitingList;
                  return ListView.builder(
                    itemCount: waitingList.length,
                    itemBuilder: (context, index) {
                      var customer = waitingList[index];
                      return ListTile(
                        leading: Container(
                          width: imageSize,
                          height: imageSize,
                          child: Image.asset(
                            'assets/man.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          customer.name,
                          style: TextStyle(fontSize: fontSize * 0.7),  
                        ),
                        subtitle: Text(
                          "Added Time: ${DateFormat('yyyy-MM-dd HH:mm').format(customer.addedTime)}",
                          style: TextStyle(fontSize: fontSize * 0.5),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle, size: fontSize * 0.7),
                          onPressed: () {
                            Get.find<WaitingListController>().removeCustomer(customer.id);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: buttonWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<WaitingListController>().addCustomer("زبون جديد");
                  },
                  child: Text(
                    "أضف زبون على قائمة الانتظار",
                    style: TextStyle(fontSize: fontSize * 0.8),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
