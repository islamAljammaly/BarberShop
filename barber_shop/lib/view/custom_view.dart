import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/shop_status_controller.dart';
import '../controller/waiting_list_controller.dart';

class CustomerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("قائمة الانتظار"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * 0.05;
          double imageSize = constraints.maxWidth * 0.15;  

          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
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

                Expanded(
                  child: Obx(() {
                    var waitingList = Get.find<WaitingListController>().waitingList;
                    return ListView.builder(
                      itemCount: waitingList.length,
                      itemBuilder: (context, index) {
                        var customer = waitingList[index];
                        String formattedDate = DateFormat('yyyy-MM-dd').format(customer.addedTime);
                        String formattedTime = DateFormat('HH:mm').format(customer.addedTime);

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
                            "Date: $formattedDate Time: $formattedTime",
                            style: TextStyle(fontSize: fontSize * 0.5),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
