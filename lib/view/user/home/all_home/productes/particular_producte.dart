import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/cart/addCart.dart';
import 'package:express/model/api/products/cart/delCart.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/favorite/add_fav.dart';
import 'package:express/model/api/products/favorite/del_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/all_home/productes/dialog.dart';
import 'package:express/view/user/home/all_home/productes/dialogImage.dart';
import 'package:express/view/user/home/all_home/productes/pageview_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class particularProducte extends StatefulWidget {
  particularProducte({Key? key}) : super(key: key);

  @override
  State<particularProducte> createState() => _particularProducteState();
}

List images = [];

class _particularProducteState extends State<particularProducte> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  controllerProduct controllerPro = Get.put(controllerProduct());
  controllerProduct? geek;
  int? tappedIndex;
  int? tappedIndexColor;
  @override
  void initState() {
    super.initState();
    // tappedIndex = 0;
    // tappedIndexColor = 0;
  }

  var c;
  var cc;
  String color = "";
  String size = "";
  // var size = geek!.saveDetailsProduct["sizes"][0]["size"];
  @override
  Widget build(BuildContext context) {
    var nameFake;
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
            backgroundColor: MyColors.color2,
            child: Icon(
              Icons.shopping_cart,
              color: controllerPro.saveDetailsProduct["added_to_cart"] == 1
                  ? Colors.yellow
                  : Colors.white,
              size: 25,
            ),
            onPressed: () async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              if (preferences.getString("sendMen") == "guest") {
                dialog(context, "لم تقم بتسجيل الدخول");
              } else {
                if (controllerPro.saveDetailsProduct["added_to_cart"] == 0) {
                  if (controllerPro.saveDetailsProduct["sizes"].toString() ==
                          "[]" &&
                      controllerPro.saveDetailsProduct["colors"].toString() ==
                          "[]") {
                    setState(() {
                      cc = 1;
                      controllerPro.saveDetailsProduct["added_to_cart"] = 1;
                    });
                    await AddCart(controllerPro.saveDetailsProduct["id"], 1,
                        context, "", "");
                    MyCart();
                  } else {
                    if (controllerPro.saveDetailsProduct["sizes"].toString() ==
                            "[]" &&
                        controllerPro.saveDetailsProduct["colors"].toString() !=
                            "[]") {
                      if (color == "") {
                        print("select color");
                        dialog(context, "You did not specify the color".tr);
                      } else {
                        setState(() {
                          cc = 1;
                          controllerPro.saveDetailsProduct["added_to_cart"] = 1;
                        });
                        await AddCart(controllerPro.saveDetailsProduct["id"], 1,
                            context, color, "");
                        MyCart();
                      }
                    } else if (controllerPro.saveDetailsProduct["sizes"]
                                .toString() !=
                            "[]" &&
                        controllerPro.saveDetailsProduct["colors"].toString() ==
                            "[]") {
                      if (size == "") {
                        print("select size");
                        dialog(context, "You did not specify the size".tr);
                      } else {
                        setState(() {
                          cc = 1;
                          controllerPro.saveDetailsProduct["added_to_cart"] = 1;
                        });
                        await AddCart(controllerPro.saveDetailsProduct["id"], 1,
                            context, color, size);
                        MyCart();
                      }
                    } else if (controllerPro.saveDetailsProduct["sizes"]
                                .toString() !=
                            "[]" &&
                        controllerPro.saveDetailsProduct["colors"].toString() !=
                            "[]") {
                      if (size == "" && color == "") {
                        print("select size or color");
                        dialog(context,
                            "You did not specify the required item".tr);
                      } else if (size == "") {
                        print("select size or color");
                        dialog(context, "You did not specify the size".tr);
                      } else if (color == "") {
                        print("select size or color");
                        dialog(context, "You did not specify the color".tr);
                      } else {
                        setState(() {
                          cc = 1;
                          controllerPro.saveDetailsProduct["added_to_cart"] = 1;
                        });
                        await AddCart(controllerPro.saveDetailsProduct["id"], 1,
                            context, color, size);
                        MyCart();
                      }
                    }
                    print("object");
                  }
                } else if (controllerPro.saveDetailsProduct["added_to_cart"] ==
                    1) {
                  setState(() {
                    cc = 0;
                    controllerPro.saveDetailsProduct["added_to_cart"] = 0;
                  });
                  await DeletFromCart(
                      controllerPro.saveDetailsProduct["id"], context);
                  MyCart();
                }
              }
            }
            // heroTag: null,
            ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          backgroundColor: MyColors.color2,
          child: Icon(
            Icons.favorite_sharp,
            color: controllerPro.saveDetailsProduct["added_to_favourites"] == 1
                ? Colors.pink[100]
                : Colors.white,
            size: 25,
          ),
          onPressed: () async {
            //notification
            // Navigator.of(context).pushNamed("notification");
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            if (preferences.getString("sendMen") == "guest") {
              dialog(context, "لم تقم بتسجيل الدخول");
            } else {
              if (controllerPro.saveDetailsProduct["added_to_favourites"] ==
                  0) {
                //add and change color
                setState(() {
                  c = 1;
                  controllerPro.saveDetailsProduct["added_to_favourites"] = 1;
                });
                await addFavorite(
                    context, controllerPro.saveDetailsProduct["id"]);
                MyFavorite();
              } else if (controllerPro
                      .saveDetailsProduct["added_to_favourites"] ==
                  1) {
                //delete
                setState(() {
                  c = 0;
                  controllerPro.saveDetailsProduct["added_to_favourites"] = 0;
                });
                await deletFavorite(controllerPro.saveDetailsProduct["id"]);
                MyFavorite();
              }
            }
          },
          heroTag: null,
        )
      ]),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 222, 242, 238),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(controllerPro
                      .saveDetailsProduct["images"][0]["image"]
                      .toString()),
                  fit: BoxFit.cover),
            ),
            // child: pageViewImages(),
          ),
          Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  actions: [
                    Row(
                      children: [
                        Text(
                          "All images".tr,
                          style: TextStyle(color: Colors.black),
                        ),
                        IconButton(
                          onPressed: () {
                            images = [];
                            print(controllerPro
                                .saveDetailsProduct["images"].length);
                            for (var i = 0;
                                i <
                                    controllerPro
                                        .saveDetailsProduct["images"].length;
                                i++) {
                              images.add(controllerPro
                                  .saveDetailsProduct["images"][i]["image"]);
                            }
                            showCustomDialog(
                                context,
                                images,
                                controllerPro
                                    .saveDetailsProduct["images"].length);
                          },
                          icon: Icon(Icons.camera),
                        )
                      ],
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.transparent,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              10,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/background.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Sold by : ".tr,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'BAHNSCHRIFT'),
                                                ),
                                                Text(
                                                    controllerPro
                                                        .saveDetailsProduct[
                                                            "vendor_2"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'BAHNSCHRIFT'))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "price : ".tr,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      fontFamily:
                                                          'BAHNSCHRIFT'),
                                                ),
                                                controllerPro.saveDetailsProduct[
                                                            "discount"] !=
                                                        null
                                                    ? Text(
                                                        controllerPro.saveDetailsProduct[
                                                                    "price"]
                                                                .toString() +
                                                            " JOD \t",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            fontSize: 17,
                                                            fontFamily:
                                                                'BAHNSCHRIFT'))
                                                    : Text(
                                                        controllerPro
                                                            .saveDetailsProduct[
                                                                "price"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17,
                                                            fontFamily:
                                                                'BAHNSCHRIFT')),
                                              ],
                                            ),
                                          ),
                                          controllerPro.saveDetailsProduct[
                                                      "discount"] !=
                                                  null
                                              ? Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "Discount : ".tr,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  'BAHNSCHRIFT'),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                            controllerPro
                                                                    .saveDetailsProduct[
                                                                        "discount"]
                                                                    .toString() +
                                                                " JOD \t",
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    'BAHNSCHRIFT')),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "New price : ".tr,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 17,
                                                              fontFamily:
                                                                  'BAHNSCHRIFT'),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                            (int.parse(controllerPro
                                                                            .saveDetailsProduct[
                                                                                "price"]
                                                                            .toString()) -
                                                                        int.parse(controllerPro
                                                                            .saveDetailsProduct[
                                                                                "discount"]
                                                                            .toString()))
                                                                    .toString() +
                                                                " JOD \t",
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    'BAHNSCHRIFT')),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Name : ".tr,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        fontFamily:
                                                            'BAHNSCHRIFT'),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Text(
                                                      controllerPro
                                                              .saveDetailsProduct[
                                                          "name"],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          fontFamily:
                                                              'BAHNSCHRIFT')),
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: MyColors.color2,
                                            height:
                                                5, //height spacing of divider
                                            thickness:
                                                3, //thickness of divier line
                                            indent:
                                                25, //spacing at the start of divider
                                            endIndent:
                                                25, //spacing at the end of divider
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          controllerPro.saveDetailsProduct[
                                                          "sizes"]
                                                      .toString() !=
                                                  "[]"
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15,
                                                              right: 15),
                                                      child: Text(
                                                        "Sizes : ".tr,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                'Almarai'),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Container(),
                                          controllerPro.saveDetailsProduct[
                                                          "sizes"]
                                                      .toString() !=
                                                  "[]"
                                              ? SizedBox(
                                                  height: 100,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ListView.builder(
                                                      itemCount: controllerPro
                                                          .saveDetailsProduct[
                                                              "sizes"]
                                                          .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int i) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                tappedIndex = i;
                                                                size = controllerPro
                                                                            .saveDetailsProduct[
                                                                        "sizes"]
                                                                    [i]["size"];
                                                                // controllerPro
                                                                //     .saveDetailsProductSize(
                                                                //         size);
                                                              });
                                                            },
                                                            child: Chip(
                                                              backgroundColor:
                                                                  tappedIndex ==
                                                                          i
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .grey,
                                                              label: Text(
                                                                controllerPro
                                                                            .saveDetailsProduct[
                                                                        "sizes"]
                                                                    [i]["size"],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Almarai'),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                )
                                              : Container(),
                                          controllerPro.saveDetailsProduct[
                                                          "colors"]
                                                      .toString() !=
                                                  "[]"
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15,
                                                              right: 15),
                                                      child: Container(
                                                        child: Text(
                                                          "Colors : ".tr,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Almarai'),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              : Container(),
                                          controllerPro.saveDetailsProduct[
                                                          "colors"]
                                                      .toString() !=
                                                  "[]"
                                              ? SizedBox(
                                                  height: 100,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: ListView.builder(
                                                      itemCount: controllerPro
                                                          .saveDetailsProduct[
                                                              "colors"]
                                                          .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int i) {
                                                        return Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                tappedIndexColor =
                                                                    i;
                                                                color = controllerPro
                                                                            .saveDetailsProduct[
                                                                        "colors"]
                                                                    [
                                                                    i]["color"];
                                                                // controllerPro
                                                                //     .SaveDetailsProductColor(
                                                                //         color);
                                                              });
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border:
                                                                    Border.all(
                                                                  color: tappedIndexColor ==
                                                                          i
                                                                      ? Colors
                                                                          .black
                                                                      : Colors
                                                                          .grey,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: CircleAvatar(
                                                                  radius: 20,
                                                                  backgroundColor: Color(int.parse(controllerPro
                                                                      .saveDetailsProduct[
                                                                          "colors"]
                                                                          [i][
                                                                          "color"]
                                                                      .replaceAll(
                                                                          "#",
                                                                          "0xff")))),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                )
                                              : Container(),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, right: 15),
                                                child: controllerPro
                                                                .saveDetailsProduct[
                                                            "desctiption"] !=
                                                        null
                                                    ? Container(
                                                        child: Text(
                                                          "Description : ".tr,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Almarai'),
                                                        ),
                                                      )
                                                    : Container(),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: controllerPro
                                                              .saveDetailsProduct[
                                                          "desctiption"] !=
                                                      null
                                                  ? Text(
                                                      parse(controllerPro
                                                              .saveDetailsProduct[
                                                                  "desctiption"]
                                                              .toString())
                                                          .body!
                                                          .text,
                                                      style: TextStyle(
                                                          height: 1.5,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai'))
                                                  : Container(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
