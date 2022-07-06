import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controllerDirver.dart';
import 'package:express/model/api/driver/d_detailsOrderApi.dart';
import 'package:express/model/api/vendor/v_detailsApi.dart';
import 'package:express/model/api/vendor/v_logout.dart';
import 'package:express/model/api/vendor/v_orderApi.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class orderVendor extends StatefulWidget {
  orderVendor({Key? key}) : super(key: key);

  @override
  State<orderVendor> createState() => _orderVendorState();
}

class _orderVendorState extends State<orderVendor>
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
                  await vendorLogout();
                  Navigator.of(context).pushReplacementNamed("welcom");
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ))
          ],
        ),
        body: RefreshIndicator(onRefresh: () async {
          await OrderApiVendor();
        }, child: GetBuilder<controllerDriver>(builder: (controller) {
          return (ListView.builder(
              itemCount: controller.allOrderVendor.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () async {
                    await detailsVendorOrderApi(
                        controller.allOrderVendor[index]["id"]);
                    Navigator.of(context).pushNamed("detailsOrderVendor");
                    // await detailsOrderApi(controller.allOrderVendor[index]["id"]);
                    // if (controller.allOrderVendor[index]["status"] ==
                    //     "completed") {
                    //   AwesomeDialog(
                    //           context: context,
                    //           animType: AnimType.RIGHSLIDE,
                    //           headerAnimationLoop: true,
                    //           dialogType: DialogType.SUCCES,
                    //           btnOkOnPress: () {},
                    //           body: Text("الطلب تم تسليمه",
                    //               style: TextStyle(
                    //                   color: MyColors.color2,
                    //                   fontSize: 14,
                    //                   fontFamily: 'Almarai')),
                    //           dialogBackgroundColor: MyColors.color3,
                    //           btnOkColor: MyColors.color1)
                    //       .show();
                    // } else if (controller.allOrderVendor[index]["status"] ==
                    //     "cancelled") {
                    //   AwesomeDialog(
                    //           context: context,
                    //           animType: AnimType.RIGHSLIDE,
                    //           dialogType: DialogType.ERROR,
                    //           headerAnimationLoop: true,
                    //           btnOkOnPress: () {},
                    //           body: Text("الطلب تم إلغاءه",
                    //               style: TextStyle(
                    //                   color: MyColors.color2,
                    //                   fontSize: 14,
                    //                   fontFamily: 'Almarai')),
                    //           dialogBackgroundColor: MyColors.color3,
                    //           btnOkColor: MyColors.color1)
                    //       .show();
                    // } else {
                    //   await detailsVendorOrderApi(
                    //       controller.allOrderVendor[index]["id"]);
                    //   Navigator.of(context).pushNamed("detailsOrderVendor");
                    // }
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
                          // trailing: Container(
                          //   height: 50,
                          //   width: 50,
                          //   decoration: BoxDecoration(
                          //     image: controller.allOrderVendor[index]["status"] ==
                          //             "completed"
                          //         ? DecorationImage(
                          //             image: NetworkImage(
                          //                 "https://thumbs.dreamstime.com/b/truth-icon-flat-truth-symbol-isolated-white-background-flat-vector-truth-icon-168806304.jpg"),
                          //             fit: BoxFit.cover,
                          //           )
                          //         : controller.allOrderVendor[index]["status"] ==
                          //                 "cancelled"
                          //             ? DecorationImage(
                          //                 image: NetworkImage(
                          //                     "https://www.pngitem.com/pimgs/m/144-1441954_right-and-wrong-symbols-clipart-png-download-clear.png"),
                          //                 fit: BoxFit.cover,
                          //               )
                          //             : DecorationImage(
                          //                 image: NetworkImage(
                          //                     "https://cdn.pecsaustralia.com/wp-content/uploads/2019/11/27165821/US_prod_Wait-Card_01.jpg"),
                          //                 fit: BoxFit.cover,
                          //               ),
                          //     shape: BoxShape.circle,
                          //   ),
                          // ),
                          trailing: Container(
                            child: controller.allOrderVendor[index]["status"] ==
                                    "completed"
                                ? Text(
                                    "تم التسليم",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        fontFamily: 'Almarai'),
                                  )
                                : controller.allOrderVendor[index]["status"] ==
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
                                "رقم الهاتف",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'Almarai'),
                              ),
                              Text(
                                controller.allOrderVendor[index]["user_mobile"]
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.green,
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
                                      controller.allOrderVendor[index]
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
                                      "${controller.allOrderVendor[index]["total"]} JOD",
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
