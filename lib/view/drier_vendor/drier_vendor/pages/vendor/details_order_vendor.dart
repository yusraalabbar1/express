import 'package:express/control/controllerDirver.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class detailsOrderVendor extends StatefulWidget {
  detailsOrderVendor({Key? key}) : super(key: key);

  @override
  State<detailsOrderVendor> createState() => _detailsOrderVendorState();
}

class _detailsOrderVendorState extends State<detailsOrderVendor> {
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
                  Text(controller.detailsOrdervendor["user_address"],
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
                  Text(controller.detailsOrdervendor["user_mobile"],
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
                  Text(controller.detailsOrdervendor["code"],
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
                  Text(controller.detailsOrdervendor["total"].toString(),
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
                      controller.detailsOrdervendor["notes"] == null
                          ? "لم تضف أي ملاحظة"
                          : controller.detailsOrdervendor["notes"],
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Almarai')),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: EdgeInsets.only(bottom: 10, right: 30, left: 30, top: 10),
              child: RaisedButton(
                color: MyColors.color2,
                elevation: 10,
                splashColor: MyColors.color1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: MyColors.color2, width: 2)),
                onPressed: () {
                  print("ontap");
                  Navigator.of(context).pushNamed("chatVendor");
                },
                child: Text(
                  "ابدأ المحادثة",
                  style: TextStyle(
                      fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
