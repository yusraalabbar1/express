import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/all_product.dart';
import 'package:express/model/api/products/cart/addCart.dart';
import 'package:express/model/api/products/cart/delCart.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/favorite/add_fav.dart';
import 'package:express/model/api/products/favorite/del_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/model/api/products/search_product.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/home/all_home/productes/search_product.dart';
import 'package:express/view/home/all_home/search_widget.dart';
import 'package:express/view/home/myHome/dataCate.dart';
import 'package:express/view/home/widget/appbar_widget.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class allProducts extends StatefulWidget {
  allProducts({Key? key}) : super(key: key);

  @override
  State<allProducts> createState() => _allProductsState();
}

class _allProductsState extends State<allProducts> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String t = "asc";
  int page = 1;
  controllerProduct controllerPro = Get.put(controllerProduct());
  var cc, c;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: subappbar_Widget(_scaffoldKey, context, "All Productes".tr),
        body: Stack(
          children: [
            containerMaine(),
            Container(
              decoration: boxDecorationMain(),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(1),
                      height: 58,
                      width: MediaQuery.of(context).size.width,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("asc".tr),
                            IconButton(
                                icon: Icon(Icons.arrow_circle_down),
                                onPressed: () async {
                                  setState(() {
                                    t = "asc";
                                  });
                                  await Searchproduct("", t);
                                  controllerPro.saveAllProduct =
                                      controllerPro.saveSearchCateg;
                                }),
                            IconButton(
                                icon: Icon(Icons.arrow_circle_up),
                                onPressed: () async {
                                  setState(() {
                                    t = "desc";
                                  });
                                  await Searchproduct("", t);
                                  controllerPro.saveAllProduct =
                                      controllerPro.saveSearchCateg;
                                }),
                            Text("desc".tr),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 2.5,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: controllerPro.saveAllProduct.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                                onTap: () async {
                                  await detailsProducts(controllerPro
                                      .saveAllProduct[index]["id"]);
                                  print(controllerPro.saveDetailsProduct);
                                  if (controllerPro.saveDetailsProduct != {}) {
                                    print(controllerPro
                                        .saveDetailsProduct["name"]);
                                    if (controllerPro
                                            .saveDetailsProduct["name"] !=
                                        null) {
                                      Navigator.of(context)
                                          .pushNamed("particularProducte");
                                    }
                                  }
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    //child: Text(myProducts[index]["name"]),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Stack(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    15.0)),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: CachedNetworkImageProvider(
                                                                controllerPro
                                                                    .saveAllProduct[
                                                                        index]
                                                                        ["images"]
                                                                        [0]
                                                                        ["image"]
                                                                    .toString())))),
                                                Positioned(
                                                    left: 10,
                                                    top: 0.0,

                                                    // (background container size) - (circle height / 2)
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.red[100],
                                                          child: Center(
                                                            child: IconButton(
                                                                icon: Icon(
                                                                  Icons
                                                                      .favorite_sharp,
                                                                  color: controllerPro.saveAllProduct[index]
                                                                              [
                                                                              "added_to_favourites"] ==
                                                                          1
                                                                      ? Colors
                                                                          .red
                                                                      : Colors
                                                                          .white,
                                                                  size: 20,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (controllerPro
                                                                              .saveAllProduct[index]
                                                                          [
                                                                          "added_to_favourites"] ==
                                                                      0) {
                                                                    //add and change color
                                                                    setState(
                                                                        () {
                                                                      c = 1;
                                                                      controllerPro
                                                                              .saveAllProduct[index]
                                                                          [
                                                                          "added_to_favourites"] = 1;
                                                                    });
                                                                    await addFavorite(
                                                                        controllerPro.saveAllProduct[index]
                                                                            [
                                                                            "id"]);
                                                                    MyFavorite();
                                                                  } else if (controllerPro
                                                                              .saveAllProduct[index]
                                                                          [
                                                                          "added_to_favourites"] ==
                                                                      1) {
                                                                    //delete
                                                                    setState(
                                                                        () {
                                                                      c = 0;
                                                                      controllerPro
                                                                              .saveAllProduct[index]
                                                                          [
                                                                          "added_to_favourites"] = 0;
                                                                    });
                                                                    await deletFavorite(
                                                                        controllerPro.saveAllProduct[index]
                                                                            [
                                                                            "id"]);
                                                                    MyFavorite();
                                                                  }
                                                                }),
                                                          ),
                                                        ),
                                                      ],
                                                    ))
                                              ],
                                            )),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            // ignore: avoid_unnecessary_containers
                                            Expanded(
                                              child: Text(
                                                controllerPro
                                                        .saveAllProduct[index]
                                                    ["name"],
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  controllerPro
                                                          .saveAllProduct[index]
                                                      ["price"],
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))
                                      ],
                                    )));
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          GetBuilder<controllerProduct>(builder: (controller) {
                        return (Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            controller.saveAllProduct.length > 9
                                ? InkWell(
                                    child: Text("Show more".tr),
                                    onTap: () async {
                                      page = page + 1;
                                      await AllProduct(page);
                                      setState(() {
                                        allProducts();
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
                                          dialogBackgroundColor:
                                              MyColors.color3,
                                          btnOkColor: MyColors.color1)
                                      .show();
                                } else {
                                  page = page - 1;
                                  await AllProduct(page);
                                  setState(() {
                                    allProducts();
                                  });
                                }
                              },
                            )
                          ],
                        ));
                      }),
                    )
                  ],
                )),
          ],
        ));
  }
}
