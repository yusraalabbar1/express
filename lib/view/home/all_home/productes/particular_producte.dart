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
import 'package:express/view/home/all_home/productes/dialogImage.dart';
import 'package:express/view/home/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';

class particularProducte extends StatefulWidget {
  particularProducte({Key? key}) : super(key: key);

  @override
  State<particularProducte> createState() => _particularProducteState();
}

class _particularProducteState extends State<particularProducte> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  controllerProduct controllerPro = Get.put(controllerProduct());

  List sized = ["m", "L", "XL"];
  List colored = [Colors.red, Colors.blue];
  var c;
  var cc;
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
              if (controllerPro.saveDetailsProduct["added_to_cart"] == 0) {
                setState(() {
                  cc = 1;
                  controllerPro.saveDetailsProduct["added_to_cart"] = 1;
                });
                await AddCart(
                    controllerPro.saveDetailsProduct["id"], 1, context);
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
            if (controllerPro.saveDetailsProduct["added_to_favourites"] == 0) {
              //add and change color
              setState(() {
                c = 1;
                controllerPro.saveDetailsProduct["added_to_favourites"] = 1;
              });
              await addFavorite(controllerPro.saveDetailsProduct["id"]);
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
          ),
          Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                  actions: [
                    IconButton(
                      onPressed: () {
                        showCustomDialog(
                            context,
                            controllerPro.saveDetailsProduct["images"][0]
                                ["image"],
                            "");
                      },
                      icon: Icon(Icons.camera),
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
                                decoration: BoxDecoration(
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
                                      decoration: BoxDecoration(
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
                                          SizedBox(
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Soled by : ".tr,
                                                  style: TextStyle(
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              192, 230, 233),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      fontFamily:
                                                          'BAHNSCHRIFT'),
                                                ),
                                                Text("Mohamad alqam",
                                                    style: TextStyle(
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
                                                  style: TextStyle(
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
                                                    style: TextStyle(
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
                                                  style: TextStyle(
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
                                                        " \$",
                                                    style: TextStyle(
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
