import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/cart/checkItem.dart';
import 'package:express/model/api/products/cart/delCart.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/cart/updateCart.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myCart extends StatefulWidget {
  myCart({Key? key}) : super(key: key);

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  var i = 0;
  List<String> data = ["Mathew", "Deon", "Sara", "Yeu"];
  var userChecked = [];
  void _onSelected(bool selected, String dataName, id) async {
    if (selected == true) {
      setState(() {
        userChecked.add(dataName);
        print(userChecked);
        checkItem(id, 1);
      });
    } else {
      setState(() {
        userChecked.remove(dataName);
        print(userChecked);
        checkItem(id, 0);
      });
    }
    // await MyCart();
  }

  controllerProduct controllerPro = Get.put(controllerProduct());

  @override
  Widget build(BuildContext context) {
    return i == 0
        ? WillPopScope(onWillPop: () {
            print(
                'Backbutton pressed (device or appbar button), do whatever you want.');
            Navigator.pushReplacementNamed(context, 'homePage');
            return Future.value(false);
          }, child: GetBuilder<controllerProduct>(builder: (controller) {
            return (Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: controllerPro.saveMyMyCart.length,
                        itemBuilder: (context, i) {
                          return (Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: MyColors.color2,
                                    value: controllerPro.saveMyMyCart[i]
                                                ["is_checked"] ==
                                            0
                                        ? false
                                        : true,
                                    onChanged: (val) {
                                      setState(() {
                                        if (val == false) {
                                          controllerPro.saveMyMyCart[i]
                                              ["is_checked"] = 0;
                                        } else {
                                          controllerPro.saveMyMyCart[i]
                                              ["is_checked"] = 1;
                                        }
                                      });
                                      _onSelected(
                                          val!,
                                          (int.parse(controllerPro
                                                          .saveMyMyCart[i]
                                                      ["product"]["price"]) *
                                                  int.parse(controllerPro
                                                          .saveMyMyCart[i]
                                                      ["quantity"]))
                                              .toString(),
                                          controllerPro.saveMyMyCart[i]
                                              ["product"]["id"]);
                                    },
                                  )),
                              Expanded(
                                  flex: 9,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ExpansionTile(
                                      collapsedBackgroundColor:
                                          Color.fromARGB(255, 180, 225, 240),
                                      leading: CircleAvatar(
                                        radius: 35,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                controllerPro.saveMyMyCart[i]
                                                        ["product"]["images"][0]
                                                    ["image"]),
                                      ),
                                      title: Text(
                                          controllerPro.saveMyMyCart[i]
                                              ["product"]["name"],
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Almarai',
                                              fontWeight: FontWeight.bold)),
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          color: Colors.cyan[50],
                                          child: Center(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.red,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      await DeletFromCart(
                                                          controllerPro
                                                                  .saveMyMyCart[i]
                                                              ["product"]["id"],
                                                          context);
                                                      MyCart();
                                                    },
                                                    icon: Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        MyColors.new4,
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          await UpdatFromCart(
                                                              controllerPro
                                                                  .saveMyMyCart[
                                                                      i][
                                                                      "product"]
                                                                      ["id"]
                                                                  .toString(),
                                                              (int.parse(controllerPro
                                                                              .saveMyMyCart[i]
                                                                          [
                                                                          "quantity"]) +
                                                                      1)
                                                                  .toString());
                                                          await MyCart();
                                                        },
                                                        icon: Icon(
                                                          Icons.add_box,
                                                          color: Colors.white,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  Text(
                                                      controllerPro
                                                          .saveMyMyCart[i]
                                                              ["quantity"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: MyColors.new3,
                                                          fontSize: 16)),
                                                  // FutureBuilder(
                                                  //     future: MyCart(),
                                                  //     builder:
                                                  //         ((context, snapshot) {
                                                  //       return snapshot.hasData
                                                  //           ? Text(
                                                  //               controllerPro
                                                  //                   .saveMyMyCart[
                                                  //                       i][
                                                  //                       "quantity"]
                                                  //                   .toString(),
                                                  //               style:
                                                  //                   TextStyle(
                                                  //                 color: MyColors
                                                  //                     .color2,
                                                  //                 fontSize: 18,
                                                  //               ))
                                                  //           : CircularProgressIndicator();
                                                  //     })),
                                                  SizedBox(
                                                    width: 7,
                                                  ),
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        MyColors.new4,
                                                    child: IconButton(
                                                        onPressed: () async {
                                                          if (int.parse(controllerPro
                                                                      .saveMyMyCart[i]
                                                                  [
                                                                  "quantity"]) !=
                                                              1) {
                                                            await UpdatFromCart(
                                                                controllerPro
                                                                    .saveMyMyCart[
                                                                        i][
                                                                        "product"]
                                                                        ["id"]
                                                                    .toString(),
                                                                (int.parse(controllerPro.saveMyMyCart[i]
                                                                            [
                                                                            "quantity"]) -
                                                                        1)
                                                                    .toString());
                                                            await MyCart();
                                                          } else {
                                                            print("cannt");
                                                          }
                                                        },
                                                        icon: Icon(
                                                          Icons.remove,
                                                          color: Colors.white,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )),
                                        ),
                                      ],
                                      subtitle: Text(
                                          (int.parse(controllerPro
                                                          .saveMyMyCart[i]
                                                      ["product"]["price"]) *
                                                  int.parse(controllerPro
                                                          .saveMyMyCart[i]
                                                      ["quantity"]))
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'Almarai',
                                          )),
                                      onExpansionChanged: (bool expanded) {},
                                    ),
                                  ))
                            ],
                          ));
                        })),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 180,
                  width: double.infinity,
                  color: MyColors.new4,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Text("Cart's Total: ".tr,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Almarai")),
                          Text(controllerPro.savecartTotal.toString(),
                              style:
                                  TextStyle(color: MyColors.new3, fontSize: 16))
                          // FutureBuilder(
                          //     future: MyCart(),
                          //     builder: ((context, snapshot) {
                          //       return snapshot.hasData
                          //           ? Text(
                          //               controllerPro.savecartTotal.toString(),
                          //               style: TextStyle(
                          //                   color: MyColors.new3, fontSize: 16))
                          //           : CircularProgressIndicator();
                          //     }))
                        ],
                      ),
                      Row(
                        children: [
                          Text("Delivary Fees: ".tr,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Almarai")),
                          Text(controllerPro.savedeliveryFees.toString(),
                              style:
                                  TextStyle(color: MyColors.new3, fontSize: 16))
                        ],
                      ),
                      Row(
                        children: [
                          Text("Total Price: ".tr,
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "Almarai")),
                          Text(
                              (controllerPro.savedeliveryFees +
                                      controllerPro.savecartTotal)
                                  .toString(),
                              style:
                                  TextStyle(color: MyColors.new3, fontSize: 16))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            print('Button Clicked.');
                            Navigator.of(context).pushNamed("completeCart");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: Text(
                            "Continue".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Almarai'),
                          ),
                          textColor: Colors.white,
                          splashColor: Colors.white,
                          color: MyColors.new3,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
          }))
        : WillPopScope(
            onWillPop: () {
              print(
                  'Backbutton pressed (device or appbar button), do whatever you want.');

              //trigger leaving and use own data
              // Navigator.pop(context, false);
              Navigator.pushReplacementNamed(context, 'homePage');

              //we need to return a future
              return Future.value(false);
            },
            child: Container(
              child: Text("empty".tr),
            ),
          );
  }
}
