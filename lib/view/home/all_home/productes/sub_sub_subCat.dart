import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
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
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: controllerPro.saveAllProductCategory.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                        onTap: () async {
                          await detailsProducts(controllerPro
                              .saveAllProductCategory[index]["id"]);
                          print(controllerPro.saveDetailsProduct);
                          if (controllerPro.saveDetailsProduct != {}) {
                            print(controllerPro.saveDetailsProduct["name"]);
                            if (controllerPro.saveDetailsProduct["name"] !=
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
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: Stack(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(15.0)),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: CachedNetworkImageProvider(
                                                        controllerPro
                                                            .saveAllProductCategory[
                                                                index]["images"]
                                                                [0]["image"]
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
                                                // CircleAvatar(
                                                //   radius: 20,
                                                //   child: IconButton(
                                                //     icon: Icon(
                                                //       Icons
                                                //           .shopping_cart,
                                                //       color: controllerPro.saveAllProduct[
                                                //                       index]
                                                //                   [
                                                //                   "added_to_cart"] ==
                                                //               1
                                                //           ? Color
                                                //               .fromARGB(
                                                //                   255,
                                                //                   253,
                                                //                   247,
                                                //                   186)
                                                //           : Colors
                                                //               .white,
                                                //       size: 20,
                                                //     ),
                                                //     onPressed:
                                                //         () async {
                                                //       if (controllerPro
                                                //                       .saveAllProduct[
                                                //                   index]
                                                //               [
                                                //               "added_to_cart"] ==
                                                //           0) {
                                                //         setState(() {
                                                //           cc = 1;
                                                //           controllerPro
                                                //                       .saveAllProduct[
                                                //                   index]
                                                //               [
                                                //               "added_to_cart"] = 1;
                                                //         });
                                                //         await AddCart(
                                                //             controllerPro
                                                //                     .saveAllProduct[
                                                //                 index]["id"],
                                                //             1,
                                                //             context);
                                                //         MyCart();
                                                //       } else if (controllerPro
                                                //                       .saveAllProduct[
                                                //                   index]
                                                //               [
                                                //               "added_to_cart"] ==
                                                //           1) {
                                                //         setState(() {
                                                //           cc = 0;
                                                //           controllerPro
                                                //                       .saveAllProduct[
                                                //                   index]
                                                //               [
                                                //               "added_to_cart"] = 0;
                                                //         });
                                                //         await DeletFromCart(
                                                //             controllerPro
                                                //                     .saveAllProduct[
                                                //                 index]["id"],
                                                //             context);
                                                //         MyCart();
                                                //       }
                                                //     },
                                                //   ),
                                                // ),
                                                // SizedBox(
                                                //   height: 5,
                                                // ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.red[100],
                                                  child: Center(
                                                    child: IconButton(
                                                        icon: Icon(
                                                          Icons.favorite_sharp,
                                                          color: controllerPro.saveAllProductCategory[
                                                                          index]
                                                                      [
                                                                      "added_to_favourites"] ==
                                                                  1
                                                              ? Colors.red
                                                              : Colors.white,
                                                          size: 20,
                                                        ),
                                                        onPressed: () async {
                                                          if (controllerPro
                                                                          .saveAllProductCategory[
                                                                      index][
                                                                  "added_to_favourites"] ==
                                                              0) {
                                                            //add and change color
                                                            setState(() {
                                                              c = 1;
                                                              controllerPro
                                                                          .saveAllProductCategory[
                                                                      index][
                                                                  "added_to_favourites"] = 1;
                                                            });
                                                            await addFavorite(
                                                                controllerPro
                                                                        .saveAllProductCategory[
                                                                    index]["id"]);
                                                            MyFavorite();
                                                          } else if (controllerPro
                                                                          .saveAllProductCategory[
                                                                      index][
                                                                  "added_to_favourites"] ==
                                                              1) {
                                                            //delete
                                                            setState(() {
                                                              c = 0;
                                                              controllerPro
                                                                          .saveAllProductCategory[
                                                                      index][
                                                                  "added_to_favourites"] = 0;
                                                            });
                                                            await deletFavorite(
                                                                controllerPro
                                                                        .saveAllProductCategory[
                                                                    index]["id"]);
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
                                                .saveAllProductCategory[index]
                                            ["name"],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          controllerPro
                                                  .saveAllProductCategory[index]
                                              ["price"],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            )));
                  }),
            ),
          ],
        ));
  }
}
