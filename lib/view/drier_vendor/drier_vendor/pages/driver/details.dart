import 'package:express/control/controllerDirver.dart';
import 'package:express/model/api/driver/d_orderApi.dart';
import 'package:express/model/api/driver/d_updateOrderApi.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/driver/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class details extends StatefulWidget {
  details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  var stat = "";
  var notes = "";
  var c1, c2, c3, cc1, cc2, cc3;

  controllerDriver controller = Get.put(controllerDriver());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.color2,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              " اختر حالة الطلب",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 55,
                child: RaisedButton(
                  color: c1 == 1 ? MyColors.color1 : Colors.red,
                  elevation: 10,
                  splashColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.red, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
                    setState(() {
                      c1 = 1;
                      c2 = 0;
                      c3 = 0;
                    });
                    stat = "cancelled";
                    print(stat);
                  },
                  child: Text(
                    "ملغي",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Almarai'),
                  ),
                ),
              ),
              Container(
                height: 55,
                child: RaisedButton(
                  color: c2 == 1 ? MyColors.color1 : Colors.orange,
                  elevation: 10,
                  splashColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.orange, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
                    setState(() {
                      c1 = 0;
                      c2 = 1;
                      c3 = 0;
                      firstore.collection('express').add({
                        'id': controller.detailsOrder["id"],
                        'text': "مؤجل",
                        'sender': controller.detailsOrder["delivery"]["name"],
                        'mobile': controller.detailsOrder["delivery"]["mobile"],
                        'time': FieldValue.serverTimestamp()
                      });
                    });
                    stat = "pending";
                    print(stat);
                  },
                  child: Text(
                    "مؤجل",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Almarai'),
                  ),
                ),
              ),
              Container(
                height: 55,
                child: RaisedButton(
                  color: c3 == 1 ? MyColors.color1 : Colors.green,
                  elevation: 10,
                  splashColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: Colors.green, width: 2)),
                  onPressed: () {
                    // Navigator.of(context).pushNamed("info");
                    setState(() {
                      c1 = 0;
                      c2 = 0;
                      c3 = 1;
                    });
                    stat = "completed";
                    print(stat);
                  },
                  child: Text(
                    "تم التسليم",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Almarai'),
                  ),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Text(
          //     " اختر اختصارات التبليغ",
          //     style: TextStyle(
          //         fontSize: 17,
          //         color: Colors.grey,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: 'Almarai'),
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     circuler("مفصول", cc1 = 1),
          //     circuler("مغلق", cc2 = 1),
          //     circuler("لارد", cc3 = 1),
          //   ],
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     circuler("تعديل قيمة", notes == "تعديل قيمة"),
          //     circuler("رفض وعدم دفع توصيل", notes == "رفض وعدم دفع توصيل"),
          //     circuler("رفض ودفع توصيل", notes == "رفض ودفع توصيل"),
          //   ],
          // ),
          SizedBox(
            height: 30,
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
              onPressed: () async {
                print("ontap");
                print(stat);
                print(notes);
                await UpdateOrderApi(
                    context, controller.detailsOrder["id"], stat, notes);
                await OrderApi();
              },
              child: Text(
                "التعديل على حالة الطلب",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
              ),
            ),
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
                Navigator.of(context).pushNamed("info");
              },
              child: Text(
                "تفاصيل الطلب",
                style: TextStyle(
                    fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
              ),
            ),
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  " اختر اختصارات التبليغ",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Almarai'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  circuler("مفصول", cc1 = 1),
                  circuler("مغلق", cc2 = 1),
                  circuler("رفض ودفع توصيل", notes == "رفض ودفع توصيل"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  circuler("تعديل قيمة", notes == "تعديل قيمة"),
                  circuler("رفض وعدم دفع توصيل", notes == "رفض وعدم دفع توصيل"),
                  circuler("لارد", cc3 = 1),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "التحدث مع التاجر",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai'),
            ),
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
                Navigator.of(context).pushNamed("ChatScreen");
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
    );
  }

  Widget circuler(text, ontap) {
    return Container(
      height: 55,
      child: RaisedButton(
        color: Colors.orange,
        elevation: 10,
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(color: Colors.orange, width: 2)),
        onPressed: () {
          // Navigator.of(context).pushNamed("info");
          setState(() {
            notes = text;
            firstore.collection('express').add({
              'id': controller.detailsOrder["id"],
              'text': notes,
              'sender': controller.detailsOrder["delivery"]["name"],
              'mobile': controller.detailsOrder["delivery"]["mobile"],
              'time': FieldValue.serverTimestamp()
            });
          });
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 13, color: Colors.white, fontFamily: 'Almarai'),
        ),
      ),
    );
  }
}
