import 'dart:io';

import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class orderDeliver extends StatefulWidget {
  orderDeliver({Key? key}) : super(key: key);

  @override
  State<orderDeliver> createState() => _orderDeliverState();
}

class _orderDeliverState extends State<orderDeliver> {
  String phone = "+201000376267";
  String message = "Hi";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("your order".tr),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/tha.gif"),
            Text(
              "your order will be delivered within 48 hours".tr,
              style: TextStyle(fontSize: 15, color: MyColors.new3),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.only(
                  bottom: 10, right: 30, left: 30, top: 10),
              child: RaisedButton(
                color: MyColors.color1,
                elevation: 10,
                splashColor: MyColors.color3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: MyColors.color1, width: 2)),
                onPressed: () {
                  Navigator.of(context).pushNamed("homePage");
                },
                child: Text(
                  "Home".tr,
                  style: TextStyle(
                      fontSize: 15,
                      color: MyColors.color3,
                      fontFamily: 'Almarai'),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 55,
              margin: const EdgeInsets.only(
                  bottom: 10, right: 30, left: 30, top: 10),
              child: RaisedButton(
                color: Color.fromARGB(255, 8, 194, 141),
                elevation: 10,
                splashColor: MyColors.color3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: MyColors.color1, width: 2)),
                onPressed: () {
                  launch('whatsapp://send?phone=+201000376267');
                },
                child: Text(
                  "Whats app".tr,
                  style: TextStyle(
                      fontSize: 15,
                      color: MyColors.color3,
                      fontFamily: 'Almarai'),
                ),
              ),
            ),
          ],
        ));
  }
}
