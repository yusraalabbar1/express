import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/categories/productCategory.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class subSubCat extends StatefulWidget {
  subSubCat({Key? key}) : super(key: key);

  @override
  State<subSubCat> createState() => _subSubCatState();
}

class _subSubCatState extends State<subSubCat> {
  controllerProduct controllerPro = Get.put(controllerProduct());

  @override
  Widget build(BuildContext context) {
    // Navigator.pop(context, true);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.color2,
          title: Text(
            "Sub Category".tr,
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
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: controllerPro.saveSubSubCateg.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () async {
                        // await detailsProducts(
                        //     controllerPro.saveAllProduct[index]["id"]);
                        // print(controllerPro.saveDetailsProduct);
                        // if (controllerPro.saveDetailsProduct != {}) {
                        //   print(controllerPro.saveDetailsProduct["name"]);
                        //   if (controllerPro.saveDetailsProduct["name"] != null) {
                        //     Navigator.of(context).pushNamed("particularProducte");
                        //   }
                        // }
                        await CategoryProduct(
                            controllerPro.saveSubSubCateg[index]["id"], 1);

                        controllerPro.SaveProCatId(
                            controllerPro.saveSubSubCateg[index]["id"]);
                        Navigator.of(context).pushNamed("sub3cat");
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
                              flex: 2,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.transparent.withOpacity(0.6),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      )),
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    controllerPro.saveSubSubCateg[index]
                                        ["name"],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(controllerPro
                                  .saveSubSubCateg[index]["image"]
                                  .toString()),
                              fit: BoxFit.cover,
                            ),
                            color: MyColors.color2,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
