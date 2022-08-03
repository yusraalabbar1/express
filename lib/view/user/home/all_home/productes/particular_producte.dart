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

  List sized = ["m", "L", "XL"];
  List colored = [Colors.red, Colors.blue];

  var c;
  var cc;
  String color = "";
  String size = "";
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
                AwesomeDialog(
                        context: context,
                        animType: AnimType.RIGHSLIDE,
                        dialogType: DialogType.INFO,
                        headerAnimationLoop: true,
                        btnOkOnPress: () {},
                        body: Text("لم تقم بتسجيل الدخول",
                            style: TextStyle(
                                color: MyColors.color2,
                                fontSize: 14,
                                fontFamily: 'Almarai')),
                        dialogBackgroundColor: MyColors.color3,
                        btnOkColor: MyColors.color1)
                    .show();
              } else {
                if (controllerPro.saveDetailsProduct["added_to_cart"] == 0) {
                  setState(() {
                    cc = 1;
                    controllerPro.saveDetailsProduct["added_to_cart"] = 1;
                  });
                  await AddCart(controllerPro.saveDetailsProduct["id"], 1,
                      context, color, size);
                  MyCart();
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
              AwesomeDialog(
                      context: context,
                      animType: AnimType.RIGHSLIDE,
                      dialogType: DialogType.INFO,
                      headerAnimationLoop: true,
                      btnOkOnPress: () {},
                      body: Text("لم تقم بتسجيل الدخول",
                          style: TextStyle(
                              color: MyColors.color2,
                              fontSize: 14,
                              fontFamily: 'Almarai')),
                      dialogBackgroundColor: MyColors.color3,
                      btnOkColor: MyColors.color1)
                  .show();
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
                        Text("All images".tr),
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
                                          MediaQuery.of(context).size.height,
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
                                        children: [
                                          const SizedBox(
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Solde by : ".tr,
                                                  style: const TextStyle(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              192, 230, 233),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'BAHNSCHRIFT'),
                                                ),
                                                Text(
                                                    controllerPro.saveDetailsProduct[
                                                            "vendor_2"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                192, 230, 233),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
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
                                                  "Name : ".tr,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'BAHNSCHRIFT'),
                                                ),
                                                Text(
                                                    controllerPro
                                                            .saveDetailsProduct[
                                                        "name"],
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
                                                      color: Color.fromARGB(
                                                          255, 177, 14, 90),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'BAHNSCHRIFT'),
                                                ),
                                                Text(
                                                    controllerPro
                                                                .saveDetailsProduct[
                                                            "price"] +
                                                        " JOD \t ",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 177, 14, 90),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'BAHNSCHRIFT'))
                                              ],
                                            ),
                                          ),
                                          controllerPro.saveDetailsProduct[
                                                          "sizes"]
                                                      .toString() !=
                                                  "[]"
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: Container(
                                                    child: Text(
                                                      "Sizes : ".tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai'),
                                                    ),
                                                  ),
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
                                                                size = controllerPro
                                                                            .saveDetailsProduct[
                                                                        "sizes"]
                                                                    [i]["size"];
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: Text(controllerPro
                                                                            .saveDetailsProduct[
                                                                        "sizes"]
                                                                    [
                                                                    i]["size"]),
                                                              ));
                                                            },
                                                            child: CircleAvatar(
                                                              radius: 20,
                                                              backgroundColor:
                                                                  MyColors
                                                                      .color2,
                                                              child: Text(controllerPro
                                                                          .saveDetailsProduct[
                                                                      "sizes"]
                                                                  [i]["size"]),
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
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: Container(
                                                    child: Text(
                                                      "Colors : ".tr,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Almarai'),
                                                    ),
                                                  ),
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
                                                                color = controllerPro
                                                                            .saveDetailsProduct[
                                                                        "colors"]
                                                                    [
                                                                    i]["color"];
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                content: CircleAvatar(
                                                                    radius: 20,
                                                                    backgroundColor: Color(int.parse(controllerPro
                                                                        .saveDetailsProduct[
                                                                            "colors"]
                                                                            [i][
                                                                            "color"]
                                                                        .replaceAll(
                                                                            "#",
                                                                            "0xff")))),
                                                              ));
                                                            },
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
                                                        );
                                                      }),
                                                )
                                              : Container(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: Container(
                                              child: Text(
                                                "Desctiption : ".tr,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    fontFamily: 'Almarai'),
                                              ),
                                            ),
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
                                              child: Text(
                                                  parse(controllerPro
                                                              .saveDetailsProduct[
                                                          "desctiption"])
                                                      .body!
                                                      .text,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 1.5,
                                                      fontSize: 14,
                                                      fontFamily: 'Almarai')),
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
                          Positioned(
                            // left: 46,
                            top: 0.0,
                            left: (MediaQuery.of(context).size.width) / 2 - 31,

                            // (background container size) - (circle height / 2)
                            child: Center(
                              child: Container(
                                child: InkWell(
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    height: 84.0,
                                    width: 84.0,
                                  ),
                                ),
                                height: 84.0,
                                width: 84.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 192, 230, 233)),
                              ),
                            ),
                          )
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

Widget buildSliverAppBar() {
  return SliverAppBar(
    actions: [],
    expandedHeight: 350,
    elevation: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      background: Hero(
        tag: 1,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
