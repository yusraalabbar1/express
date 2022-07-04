import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/favorite/add_fav.dart';
import 'package:express/model/api/products/favorite/del_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mostPopular extends StatefulWidget {
  mostPopular({Key? key}) : super(key: key);

  @override
  State<mostPopular> createState() => _mostPopularState();
}

class _mostPopularState extends State<mostPopular> {
  controllerProduct controllerPro = Get.put(controllerProduct());
  var c;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Most Popular".tr,
                style: TextStyle(
                    fontFamily: 'Almarai', fontWeight: FontWeight.bold)),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("allProducts");
                },
                child: Text(
                  "view all".tr,
                  style: TextStyle(fontFamily: 'Almarai'),
                )),
          ],
        ),
        Container(
            height: 160,
            child: GetBuilder<controllerProduct>(builder: (controller) {
              return (ListView.builder(
                itemCount: controllerPro.savepopulerProduct.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () async {
                        await detailsProducts(
                            controllerPro.savepopulerProduct[index]["id"]);
                        // print(controllerPro.saveDetailsProduct);
                        // if (controllerPro.saveDetailsProduct != {}) {
                        //   print(controllerPro.saveDetailsProduct["name"]);
                        //   if (controllerPro.saveDetailsProduct["name"] != null) {
                        //     Navigator.of(context).pushNamed("particularProducte");
                        //   }
                        // }
                        Navigator.of(context).pushNamed("particularProducte");
                      },
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width / 4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      controllerPro.savepopulerProduct[index]
                                              ["images"][0]["image"]
                                          .toString()),
                                  fit: BoxFit.cover,
                                ),
                                color: MyColors.new4,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            // child:
                            // Text(controllerPro.savepopulerProduct[index]["name"]
                            //     .toString())
                          ),
                          Positioned(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.favorite_sharp,
                                    color:
                                        controllerPro.savepopulerProduct[index]
                                                    ["added_to_favourites"] ==
                                                1
                                            ? Colors.red
                                            : Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    if (controllerPro.savepopulerProduct[index]
                                            ["added_to_favourites"] ==
                                        0) {
                                      //add and change color
                                      setState(() {
                                        c = 1;
                                        controllerPro.savepopulerProduct[index]
                                            ["added_to_favourites"] = 1;
                                      });
                                      await addFavorite(controllerPro
                                          .savepopulerProduct[index]["id"]);
                                      MyFavorite();
                                    } else if (controllerPro
                                                .savepopulerProduct[index]
                                            ["added_to_favourites"] ==
                                        1) {
                                      //delete
                                      setState(() {
                                        c = 0;
                                        controllerPro.savepopulerProduct[index]
                                            ["added_to_favourites"] = 0;
                                      });
                                      await deletFavorite(controllerPro
                                          .savepopulerProduct[index]["id"]);
                                      MyFavorite();
                                    }
                                  }))
                        ],
                      ));
                },
              ));
            }))
      ],
    );
  }
}

// Widget mostPopular(context) {
//   controllerProduct controllerPro = Get.put(controllerProduct());

//   return Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text("Most Popular"),
//           InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed("allProducts");
//               },
//               child: Text("view all")),
//         ],
//       ),
//       Container(
//         height: 160,
//         child: ListView.builder(
//           itemCount: controllerPro.savepopulerProduct.length,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             return InkWell(
//               onTap: () async {
//                 await detailsProducts(
//                     controllerPro.saveAllProduct[index]["id"]);
//                 print(controllerPro.saveDetailsProduct);
//                 if (controllerPro.saveDetailsProduct != {}) {
//                   print(controllerPro.saveDetailsProduct["name"]);
//                   if (controllerPro.saveDetailsProduct["name"] != null) {
//                     Navigator.of(context).pushNamed("particularProducte");
//                   }
//                 }
//               },
//               child: Container(
//                 margin: const EdgeInsets.all(8),
//                 width: MediaQuery.of(context).size.width / 4,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: CachedNetworkImageProvider(controllerPro
//                           .savepopulerProduct[index]["images"][0]["image"]
//                           .toString()),
//                       fit: BoxFit.cover,
//                     ),
//                     color: MyColors.new4,
//                     borderRadius: BorderRadius.all(Radius.circular(20))),
//                 // child:
//                 // Text(controllerPro.savepopulerProduct[index]["name"]
//                 //     .toString())
//               ),
//             );
//           },
//         ),
//       )
//     ],
//   );
// }
