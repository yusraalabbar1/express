import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/categories/productCategory.dart';
import 'package:express/model/api/products/cart/addCart.dart';
import 'package:express/model/api/products/cart/delCart.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/favorite/add_fav.dart';
import 'package:express/model/api/products/favorite/del_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class sub3cat extends StatefulWidget {
  sub3cat({Key? key}) : super(key: key);

  @override
  State<sub3cat> createState() => _sub3catState();
}

class _sub3catState extends State<sub3cat> {
  controllerProduct controllerPro = Get.put(controllerProduct());
  var c, cc;
  int page = 1;
  @override
  void initState() {
    super.initState();
    print(page);
  }

  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context, true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.color2,
          title: Text(
            "Product".tr,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            containerMaine(),
            Container(
              decoration: boxDecorationMain(),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future:
                            CategoryProduct(controllerPro.saveProCatId, page),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? controllerPro.saveAllProductCategory.length != 0
                                  ? GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 2 / 2.5,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount: controllerPro
                                          .saveAllProductCategory.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return InkWell(
                                            onTap: () async {
                                              await detailsProducts(controllerPro
                                                      .saveAllProductCategory[
                                                  index]["id"]);
                                              print(controllerPro
                                                  .saveDetailsProduct);
                                              if (controllerPro
                                                      .saveDetailsProduct !=
                                                  {}) {
                                                print(controllerPro
                                                        .saveDetailsProduct[
                                                    "name"]);
                                                if (controllerPro
                                                            .saveDetailsProduct[
                                                        "name"] !=
                                                    null) {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          "particularProducte");
                                                }
                                              }
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                //child: Text(myProducts[index]["name"]),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Stack(
                                                          children: [
                                                            Container(
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                15.0),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                15.0)),
                                                                    image: DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image: CachedNetworkImageProvider(controllerPro
                                                                            .saveAllProductCategory[index]["images"][0]["image"]
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
                                                                          Colors
                                                                              .red[100],
                                                                      child:
                                                                          Center(
                                                                        child: IconButton(
                                                                            icon: Icon(
                                                                              Icons.favorite_sharp,
                                                                              color: controllerPro.saveAllProductCategory[index]["added_to_favourites"] == 1 ? Colors.red : Colors.white,
                                                                              size: 20,
                                                                            ),
                                                                            onPressed: () async {
                                                                              if (controllerPro.saveAllProductCategory[index]["added_to_favourites"] == 0) {
                                                                                //add and change color
                                                                                setState(() {
                                                                                  c = 1;
                                                                                  controllerPro.saveAllProductCategory[index]["added_to_favourites"] = 1;
                                                                                });
                                                                                await addFavorite(context, controllerPro.saveAllProductCategory[index]["id"]);
                                                                                MyFavorite();
                                                                              } else if (controllerPro.saveAllProductCategory[index]["added_to_favourites"] == 1) {
                                                                                //delete
                                                                                setState(() {
                                                                                  c = 0;
                                                                                  controllerPro.saveAllProductCategory[index]["added_to_favourites"] = 0;
                                                                                });
                                                                                await deletFavorite(controllerPro.saveAllProductCategory[index]["id"]);
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
                                                                    .saveAllProductCategory[
                                                                index]["name"],
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            child: Text(
                                                              controllerPro.saveAllProductCategory[
                                                                          index]
                                                                      [
                                                                      "price"] +
                                                                  " JOD \t ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )),
                                                  ],
                                                )));
                                      })
                                  : Center(
                                      child: Container(
                                          height: 50,
                                          width: 50,
                                          child: CircularProgressIndicator()),
                                    )
                              : Center(
                                  child: Text("No products found".tr),
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          GetBuilder<controllerProduct>(builder: (controller) {
                        return (Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            controller.saveAllProductCategory.length > 9
                                ? InkWell(
                                    child: Text("عرض المزيد"),
                                    onTap: () async {
                                      setState(() {
                                        page = page + 1;
                                        CategoryProduct(
                                            controllerPro.saveProCatId, page);
                                        sub3cat();
                                      });

                                      // Navigator.of(context).pushNamed("sub3cat");
                                    },
                                  )
                                : Container(),
                            InkWell(
                              child: Text("عرض اقل"),
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
                                  setState(() {
                                    page = page - 1;
                                    CategoryProduct(
                                        controllerPro.saveProCatId, page);
                                    sub3cat();
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
