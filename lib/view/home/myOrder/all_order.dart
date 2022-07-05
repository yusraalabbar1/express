import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/order/myOrder.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/home/all_home/productes/dialogImage.dart';
import 'package:express/view/home/all_home/productes/particular_producte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class allOrder extends StatefulWidget {
  allOrder({Key? key}) : super(key: key);

  @override
  State<allOrder> createState() => _allOrderState();
}

class _allOrderState extends State<allOrder> {
  int page = 1;
  controllerProduct controllerPro = Get.put(controllerProduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Orders".tr),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<controllerProduct>(builder: (controllerPro) {
              return (ListView.builder(
                  itemCount: controllerPro.saveMyOrder.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: MyColors.new3,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: MyColors.new4,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: RotatedBox(
                                        quarterTurns: -1,
                                        child: Center(
                                          child: Text(
                                              "Order Date : ${controllerPro.saveMyOrder[index]["created_at"]}"
                                                  .substring(0, 23),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  fontFamily: 'Almarai')),
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                        color: MyColors.new4,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0)),
                                      ),
                                      width: 40,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: ListTile(
                                        trailing: controllerPro
                                                        .saveMyOrder[index]
                                                    ["status"] ==
                                                "pending"
                                            ? CircleAvatar(
                                                radius: 50,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        "https://cdn.pecsaustralia.com/wp-content/uploads/2019/11/27165821/US_prod_Wait-Card_01.jpg"),
                                              )
                                            : controllerPro.saveMyOrder[index]
                                                        ["status"] ==
                                                    "completed"
                                                ? CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(
                                                            "https://thumbs.dreamstime.com/b/red-cross-icon-isolated-sign-wrong-error-button-white-background-eps-164583269.jpg"),
                                                  )
                                                : CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(
                                                            "https://static5.depositphotos.com/1033654/455/i/950/depositphotos_4555579-stock-photo-3d-human-arrow-success-green.jpg"),
                                                  ),
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // Container(
                                            //     // alignment: Alignment.topLeft,
                                            //     child: Text(
                                            //   controllerPro.saveMyOrder[index]
                                            //       ["items"][0]["product"]["name"],
                                            //   style: TextStyle(
                                            //       color: MyColors.new2,
                                            //       fontSize: 18,
                                            //       fontWeight: FontWeight.bold),
                                            // )),
                                            InkWell(
                                              onTap: () {
                                                images = [];
                                                print(controllerPro
                                                    .saveMyOrder[index]["items"]
                                                    .length);
                                                for (var i = 0;
                                                    i <
                                                        controllerPro
                                                            .saveMyOrder[index]
                                                                ["items"]
                                                            .length;
                                                    i++) {
                                                  images.add(controllerPro
                                                                  .saveMyOrder[
                                                              index]["items"][i]
                                                          ["product"]["images"]
                                                      [0]["image"]);
                                                }
                                                showCustomDialog(
                                                    context,
                                                    images,
                                                    controllerPro
                                                        .saveMyOrder[index]
                                                            ["items"]
                                                        .length);
                                              },
                                              child: Text("Show All Items".tr,
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Almarai")),
                                            ),
                                            Container(
                                                // alignment: Alignment.topLeft,
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Total Price: ".tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Almarai")),
                                                Text(
                                                    "${controllerPro.saveMyOrder[index]["total"]}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            )),
                                            Container(
                                                // alignment: Alignment.topLeft,
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("status: ".tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Almarai")),
                                                Text(
                                                    "${controllerPro.saveMyOrder[index]["status"]}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            )),
                                          ],
                                        )),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  }));
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<controllerProduct>(builder: (controller) {
              return (Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.saveMyOrder.length > 9
                      ? InkWell(
                          child: Text("Show more".tr),
                          onTap: () async {
                            page = page + 1;
                            await MyOrder(page);
                            setState(() {
                              allOrder();
                            });

                            // Navigator.of(context).pushNamed("sub3cat");
                          },
                        )
                      : Container(),
                  InkWell(
                    child: Text("Show less".tr),
                    onTap: () async {
                      if (page == 1) {
                        AwesomeDialog(
                                context: context,
                                animType: AnimType.RIGHSLIDE,
                                dialogType: DialogType.ERROR,
                                headerAnimationLoop: true,
                                btnOkOnPress: () {},
                                body: Text("لا يمكن عرض صفحات أقل",
                                    style: TextStyle(
                                        color: MyColors.color2,
                                        fontSize: 14,
                                        fontFamily: 'Almarai')),
                                dialogBackgroundColor: MyColors.color3,
                                btnOkColor: MyColors.color1)
                            .show();
                      } else {
                        page = page - 1;
                        await MyOrder(page);
                        setState(() {
                          allOrder();
                        });
                      }
                    },
                  )
                ],
              ));
            }),
          )
        ],
      ),
    );
  }
}
