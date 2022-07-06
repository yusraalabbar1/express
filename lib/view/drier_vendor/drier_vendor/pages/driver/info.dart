import 'package:express/control/controllerDirver.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class info extends StatefulWidget {
  info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  controllerDriver controller = Get.put(controllerDriver());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.color2,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: MyColors.color1,
          boxShadow: [
            BoxShadow(color: MyColors.color2, spreadRadius: 3),
          ],
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("العنوان: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.detailsOrder["user_address"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("رقم الهاتف: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.detailsOrder["user_mobile"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("رقم التوصيل: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.detailsOrder["code"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("السعر: ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(controller.detailsOrder["total"].toString(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الملاحظات : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                      controller.detailsOrder["notes"] == null
                          ? "لم تضف أي ملاحظة"
                          : controller.detailsOrder["notes"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
