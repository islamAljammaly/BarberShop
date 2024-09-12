import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'barber_view.dart';
import 'custom_view.dart';

class StartPage extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 179, 124),
      appBar: AppBar(
        title: Text(
          "مرحباً في صالون الحلاقة 2024",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * 0.05; 
          double inputHeight = constraints.maxHeight * 0.08; 
          double buttonWidth = constraints.maxWidth * 0.6; 

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'للحصول على الكود يرجى الطلب من صاحب المحل أو الذهاب الى صفحة الفيس بوك الخاصة بنا لأن هذا التطبيق خاص بزبائننا فقط',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: fontSize),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: inputHeight,
                    child: TextField(
                      controller: codeController,
                      decoration: InputDecoration(
                        labelText: 'Enter Code',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: fontSize * 0.8), 
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        String code = codeController.text;
                        if (code == '1742001') {
                          Get.offAll(() => BarberView());
                        } else if (code == '1234') {
                          Get.offAll(() => CustomerView());
                        } else {
                          Get.snackbar('Error', 'Invalid code');
                        }
                      },
                      child: Text(
                        "Enter",
                        style: TextStyle(fontSize: fontSize * 0.8),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 101, 72, 61),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
