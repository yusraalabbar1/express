import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/cart/addCart.dart';
import 'package:express/model/api/products/cart/delCart.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/favorite/del_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class myLike extends StatefulWidget {
  myLike({Key? key}) : super(key: key);

  @override
  State<myLike> createState() => _myLikeState();
}

class _myLikeState extends State<myLike> {
  controllerProduct controllerPro = Get.put(controllerProduct());
  var cc;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      print(
          'Backbutton pressed (device or appbar button), do whatever you want.');

      //trigger leaving and use own data
      // Navigator.pop(context, false);
      Navigator.pushReplacementNamed(context, 'homePage');

      //we need to return a future
      return Future.value(false);
    }, child: GetBuilder<controllerProduct>(builder: (controller) {
      return (Container(
        child: ListView.builder(
            itemCount: controllerPro.saveMyFavprite.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        color: MyColors.new4,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: MyColors.new4,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: CachedNetworkImageProvider(
                                      controllerPro.saveMyFavprite[index]
                                          ["product"]["images"][0]["image"]),
                                ),
                                subtitle: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Text(
                                            parse(controllerPro
                                                        .saveMyFavprite[index]
                                                    ["product"]["desctiption"])
                                                .body!
                                                .text,
                                            // controllerPro.saveMyFavprite[index]
                                            //     ["product"]["desctiption"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                fontFamily: 'Almarai'))),
                                    Container(
                                        child: Row(
                                      children: [
                                        Text("price : ".tr,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                fontFamily: 'Almarai')),
                                        Text(
                                            "${controllerPro.saveMyFavprite[index]["product"]["price"].toString()}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                                fontFamily: 'Almarai'))
                                      ],
                                    ))
                                  ],
                                ),
                                title: Container(
                                    child: Text(
                                        controllerPro.saveMyFavprite[index]
                                            ["product"]["name"],
                                        style: const TextStyle(
                                            color: MyColors.new3,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            fontFamily: 'Almarai'))),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: RotatedBox(
                                  quarterTurns: 0,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                              onPressed: () async {
                                                print("delete");
                                                await deletFavorite(
                                                    controllerPro
                                                                .saveMyFavprite[
                                                            index]["product"]
                                                        ["id"]);
                                                await MyFavorite();
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: MyColors.new4,
                                              )),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                              onPressed: () async {
                                                if (controllerPro
                                                                .saveMyFavprite[
                                                            index]["product"]
                                                        ["added_to_cart"] ==
                                                    0) {
                                                  setState(() {
                                                    cc = 1;
                                                    controllerPro
                                                                .saveMyFavprite[
                                                            index]["product"]
                                                        ["added_to_cart"] = 1;
                                                  });
                                                  await AddCart(
                                                      controllerPro
                                                              .saveMyFavprite[
                                                          index]["product"]["id"],
                                                      1,
                                                      context);
                                                  MyCart();
                                                } else if (controllerPro
                                                                .saveMyFavprite[
                                                            index]["product"]
                                                        ["added_to_cart"] ==
                                                    1) {
                                                  setState(() {
                                                    cc = 0;
                                                    controllerPro
                                                                .saveMyFavprite[
                                                            index]["product"]
                                                        ["added_to_cart"] = 0;
                                                  });
                                                  await DeletFromCart(
                                                      controllerPro
                                                              .saveMyFavprite[
                                                          index]["product"]["id"],
                                                      context);
                                                  MyCart();
                                                }
                                              },
                                              icon: Icon(
                                                Icons.shopping_cart,
                                                color: controllerPro.saveMyFavprite[
                                                                    index]
                                                                ["product"]
                                                            ["added_to_cart"] ==
                                                        1
                                                    ? Color.fromARGB(
                                                        255, 234, 99, 144)
                                                    : Colors.white,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                  color: MyColors.new3,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0)),
                                ),
                                width: 40,
                                height: MediaQuery.of(context).size.height / 6,
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            }),
      ));
    }));
  }
}
