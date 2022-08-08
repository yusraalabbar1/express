import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/categories/productCategory.dart';
import 'package:express/model/api/categories/subCat.dart';
import 'package:express/model/api/products/all_product.dart';
import 'package:express/model/api/setting/setting.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/all_home/all_home.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myHome extends StatefulWidget {
  myHome({Key? key}) : super(key: key);

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  Future<bool> _onwillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 7, 44, 48),
            title: new Text("Exit the App".tr,
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            content: new Text("Are you sure to get out??".tr,
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
                    child: Text("Yes".tr,
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
                    child: Text("No".tr,
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
    super.initState();
  }

  controllerProduct controllerPro = Get.put(controllerProduct());
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
          body: Stack(
        children: [
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 50,
                child: GetBuilder<controllerProduct>(builder: (controllerPro) {
                  return (ListView.builder(
                    shrinkWrap: true,
                    // physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: controllerPro.saveAllCateg.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          controllerPro.saveSubCateg = [];
                          setState(() {
                            i = index;
                            SubCategories(
                                controllerPro.saveAllCateg[index]["id"]);
                          });
                        },
                        child: Center(
                          child: Chip(
                            // elevation: 20,
                            padding: EdgeInsets.all(8),
                            backgroundColor:
                                i == index ? MyColors.color2 : MyColors.color3,
                            shadowColor: Colors.black,

                            label: Text(controllerPro.saveAllCateg[index]
                                    ["name"]
                                .toString()), //Text
                          ),
                        ),
                      ),
                    ),
                  ));
                }),
              ),
              i == 0
                  ? allHome()
                  : FutureBuilder(
                      future: sitting(),
                      builder: ((context, snapshot) {
                        return snapshot.hasData
                            ? GetBuilder<controllerProduct>(
                                builder: (controllerPro) {
                                return (Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                              maxCrossAxisExtent: 200,
                                              childAspectRatio: 3 / 2,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20),
                                      itemCount:
                                          controllerPro.saveSubCateg.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return InkWell(
                                          onTap: () async {
                                            print("object");
                                            print(controllerPro
                                                    .saveSubCateg[index]
                                                ["has_sub"]);
                                            if (controllerPro
                                                        .saveSubCateg[index]
                                                    ["has_sub"] ==
                                                1) {
                                              await SubSubCategories(
                                                  controllerPro
                                                          .saveSubCateg[index]
                                                      ["id"]);
                                              Navigator.of(context)
                                                  .pushNamed("subSubCat");
                                            } else {
                                              await CategoryProduct(
                                                  controllerPro
                                                          .saveSubCateg[index]
                                                      ["id"],
                                                  1);
                                              controllerPro.SaveProCatId(
                                                  controllerPro
                                                          .saveSubCateg[index]
                                                      ["id"]);
                                              Navigator.of(context)
                                                  .pushNamed("sub3cat");
                                            }
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      color: Colors.transparent,
                                                    )),
                                                Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .transparent
                                                              .withOpacity(0.6),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          )),
                                                      alignment:
                                                          Alignment.center,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Text(
                                                        controllerPro
                                                                .saveSubCateg[
                                                            index]["name"],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontFamily:
                                                                'Almarai'),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            decoration: BoxDecoration(
                                                color: MyColors.color2,
                                                image: DecorationImage(
                                                  image:
                                                      CachedNetworkImageProvider(
                                                          controllerPro
                                                              .saveSubCateg[
                                                                  index]
                                                                  ["image"]
                                                              .toString()),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                          ),
                                        );
                                      }),
                                ));
                              })
                            : CircularProgressIndicator(
                                color: MyColors.color2,
                              );
                      }))
            ],
          ),
        ],
      )),
    );
  }
}
