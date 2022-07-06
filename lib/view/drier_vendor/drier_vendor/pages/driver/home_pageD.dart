import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controllerDirver.dart';
import 'package:express/model/api/driver/d_detailsOrderApi.dart';
import 'package:express/model/api/driver/d_logout.dart';
import 'package:express/model/api/driver/d_orderApi.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home_pageD extends StatefulWidget {
  home_pageD({Key? key}) : super(key: key);

  @override
  State<home_pageD> createState() => _home_pageDState();
}

class _home_pageDState extends State<home_pageD>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Future<bool> _onwillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 7, 44, 48),
            title: new Text("الخروج من التطبيق",
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            content: new Text("هل أنت متأكد؟؟",
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: MyColors.color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color1, width: 2)),
                    child: Text("نعم",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RaisedButton(
                    color: Color.fromARGB(255, 231, 38, 64),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            color: Color.fromARGB(255, 231, 38, 64), width: 2)),
                    child: Text("لا",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              )
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // OrderApi();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الطلبات"),
          backgroundColor: MyColors.color2,
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.setInt("islogin", 0);
                  await driverLogout();
                  Navigator.of(context).pushReplacementNamed("welcom");
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: RefreshIndicator(onRefresh: () async {
          await OrderApi();
        }, child: GetBuilder<controllerDriver>(builder: (controller) {
          return (ListView.builder(
              itemCount: controller.allOrder.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    if (controller.allOrder[index]["status"] == "completed") {
                      AwesomeDialog(
                              context: context,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: true,
                              dialogType: DialogType.SUCCES,
                              btnOkOnPress: () async {
                                await detailsOrderApi(
                                    controller.allOrder[index]["id"]);
                                Navigator.of(context).pushNamed("info");
                              },
                              body: Text(
                                  "الطلب تم تسليمه يمكنك فقط رؤية التفاصيل",
                                  style: TextStyle(
                                      color: MyColors.color2,
                                      fontSize: 14,
                                      fontFamily: 'Almarai')),
                              dialogBackgroundColor: MyColors.color3,
                              btnOkColor: MyColors.color1)
                          .show();
                    } else if (controller.allOrder[index]["status"] ==
                        "cancelled") {
                      AwesomeDialog(
                              context: context,
                              animType: AnimType.RIGHSLIDE,
                              dialogType: DialogType.ERROR,
                              headerAnimationLoop: true,
                              btnOkOnPress: () async {
                                await detailsOrderApi(
                                    controller.allOrder[index]["id"]);
                                Navigator.of(context).pushNamed("info");
                              },
                              body: Text(
                                  "الطلب تم إلغاءه يمكنك فقط رؤية التفاصيل",
                                  style: TextStyle(
                                      color: MyColors.color2,
                                      fontSize: 14,
                                      fontFamily: 'Almarai')),
                              dialogBackgroundColor: MyColors.color3,
                              btnOkColor: MyColors.color1)
                          .show();
                    } else {
                      await detailsOrderApi(controller.allOrder[index]["id"]);
                      Navigator.of(context).pushNamed("details");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 200, 236, 239),
                        border: Border.all(
                          color: Color.fromARGB(255, 117, 180, 187),
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                          trailing: Container(
                            child: controller.allOrder[index]["status"] ==
                                    "completed"
                                ? Text(
                                    "تم التسليم",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Almarai'),
                                  )
                                : controller.allOrder[index]["status"] ==
                                        "cancelled"
                                    ? Text(
                                        "ملغي",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            fontFamily: 'Almarai'),
                                      )
                                    : Text(
                                        "انتظار",
                                        style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            fontFamily: 'Almarai'),
                                      ),
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "الهاتف",
                                style: TextStyle(
                                    color: MyColors.color2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Almarai'),
                              ),
                              Text(
                                controller.allOrder[index]["user_mobile"],
                                style: TextStyle(
                                    color: MyColors.color2,
                                    fontSize: 15,
                                    fontFamily: 'Almarai'),
                              ),
                            ],
                          ),
                          title: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                children: [
                                  Text("المنطقة",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Almarai')),
                                  Text(
                                      controller.allOrder[index]
                                          ["user_address"],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Almarai'))
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text("السعر",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Almarai')),
                                  Text(
                                      "${controller.allOrder[index]["total"]} JOD",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: 'Almarai'))
                                ],
                              )),
                            ],
                          )),
                    ),
                  ),
                );
              }));
        })),
      ),
    );
  }
}
