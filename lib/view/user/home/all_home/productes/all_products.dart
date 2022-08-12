import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/api/products/all_product.dart';
import 'package:express/model/api/products/favorite/add_fav.dart';
import 'package:express/model/api/products/favorite/del_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/model/api/products/search_product.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/model/model_json/products/searchModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:express/view/user/home/widget/appbar_widget.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class allProducts extends StatefulWidget {
  allProducts({Key? key}) : super(key: key);

  @override
  State<allProducts> createState() => _allProductsState();
}

class _allProductsState extends State<allProducts> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var t;
  int page = 1;
  controllerProduct controllerPro = Get.put(controllerProduct());
  var cc, c;
  /////////////////////////////////////
  int currentPage = 1;

  late int totalPages;

  List<searchProu> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      print("1===========================");
    } else {
      print("2===========================");
      print(currentPage);
      if (currentPage > totalPages) {
        print("3========================");
        refreshController.loadNoData();
        return false;
      }
    }
    controllerProduct controllerPro = Get.put(controllerProduct());
    homecontroller controller = Get.put(homecontroller());

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(Base +
            '/search-products/?lang=$lang&filter=asc&page=$currentPage'));

    request.headers.addAll(headers);

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = SearchModelwelcomeFromJson(res.body);

      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      totalPages = result.meta!.totalPages!;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  /////////////////////////////////

  Future<bool> getPassengerData2({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      print("1===========================");
    } else {
      print("2===========================");
      print(currentPage);
      if (currentPage > totalPages) {
        print("3========================");
        refreshController.loadNoData();
        return false;
      }
    }
    controllerProduct controllerPro = Get.put(controllerProduct());
    homecontroller controller = Get.put(homecontroller());

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            Base + '/search-products/?lang=$lang&filter=$t&page=$currentPage'));

    request.headers.addAll(headers);

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      /////////////////////////////////////
      final result = SearchModelwelcomeFromJson(res.body);
      // final result1 = passengersDataFromJson(res2.body);
      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      totalPages = result.meta!.totalPages!;

      print(res.body);
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  /////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: subappbar_Widget(_scaffoldKey, context, "All Products".tr),
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
                                    print(t);
                                    passengers = [];
                                    currentPage = 1;
                                  });
                                  final result =
                                      await getPassengerData2(isRefresh: true);
                                  if (result) {
                                    refreshController.refreshCompleted();
                                  } else {
                                    refreshController.refreshFailed();
                                  }
                                }),
                            IconButton(
                                icon: Icon(Icons.arrow_circle_up),
                                onPressed: () async {
                                  setState(() {
                                    t = "desc";
                                    passengers = [];
                                    currentPage = 1;
                                    print(currentPage);
                                  });
                                  final result =
                                      await getPassengerData2(isRefresh: true);
                                  if (result) {
                                    refreshController.refreshCompleted();
                                  } else {
                                    refreshController.refreshFailed();
                                  }
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
                      child: SmartRefresher(
                        controller: refreshController,
                        enablePullUp: true,
                        onRefresh: () async {
                          if (t == "desc" || t == "asc") {
                            print("control2");
                            final result =
                                await getPassengerData2(isRefresh: true);
                            if (result) {
                              refreshController.refreshCompleted();
                            } else {
                              refreshController.refreshFailed();
                            }
                          } else {
                            final result =
                                await getPassengerData(isRefresh: true);
                            if (result) {
                              refreshController.refreshCompleted();
                            } else {
                              refreshController.refreshFailed();
                            }
                          }
                        },
                        onLoading: () async {
                          if (t == "desc" || t == "asc") {
                            final result = await getPassengerData();
                            if (result) {
                              refreshController.loadComplete();
                            } else {
                              refreshController.loadFailed();
                            }
                          } else {
                            final result = await getPassengerData();
                            if (result) {
                              refreshController.loadComplete();
                            } else {
                              refreshController.loadFailed();
                            }
                          }
                        },
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 2 / 2.5,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: passengers.length,
                            itemBuilder: (BuildContext ctx, index) {
                              final passenger = passengers[index];
                              return InkWell(
                                  onTap: () async {
                                    await detailsProducts(passenger.id);
                                    Navigator.of(context)
                                        .pushNamed("particularProducte");
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
                                                          shape: BoxShape
                                                              .rectangle,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          15.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          15.0)),
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: CachedNetworkImageProvider(
                                                                  passenger
                                                                      .images![0]
                                                                      .image
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
                                                                    color: passenger.addedToFavourites ==
                                                                            1
                                                                        ? Colors
                                                                            .red
                                                                        : Colors
                                                                            .white,
                                                                    size: 20,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    if (passenger
                                                                            .addedToFavourites ==
                                                                        0) {
                                                                      //add and change color
                                                                      setState(
                                                                          () {
                                                                        c = 1;
                                                                        passenger
                                                                            .addedToFavourites = 1;
                                                                      });
                                                                      await addFavorite(
                                                                          context,
                                                                          passenger
                                                                              .id);
                                                                      MyFavorite();
                                                                    } else if (passenger
                                                                            .addedToFavourites ==
                                                                        1) {
                                                                      //delete
                                                                      setState(
                                                                          () {
                                                                        c = 0;
                                                                        passenger
                                                                            .addedToFavourites = 0;
                                                                      });
                                                                      await deletFavorite(
                                                                          passenger
                                                                              .id);
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
                                                  passenger.name!,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                    passenger.new_price
                                                            .toString() +
                                                        " JOD \t ",
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
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child:
                    //       GetBuilder<controllerProduct>(builder: (controller) {
                    //     return (Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         controller.saveAllProduct.length > 9
                    //             ? InkWell(
                    //                 child: Text("Show more".tr),
                    //                 onTap: () async {
                    //                   page = page + 1;
                    //                   await AllProduct(page);
                    //                   setState(() {
                    //                     allProducts();
                    //                   });

                    //                   // Navigator.of(context).pushNamed("sub3cat");
                    //                 },
                    //               )
                    //             : Container(),
                    //         InkWell(
                    //           child: Text("Show less".tr),
                    //           onTap: () async {
                    //             if (page == 1) {
                    //               AwesomeDialog(
                    //                       context: context,
                    //                       animType: AnimType.RIGHSLIDE,
                    //                       dialogType: DialogType.ERROR,
                    //                       headerAnimationLoop: true,
                    //                       btnOkOnPress: () {},
                    //                       body: Text("لا يمكن عرض صفحات أقل",
                    //                           style: TextStyle(
                    //                               color: MyColors.color2,
                    //                               fontSize: 14,
                    //                               fontFamily: 'Almarai')),
                    //                       dialogBackgroundColor:
                    //                           MyColors.color3,
                    //                       btnOkColor: MyColors.color1)
                    //                   .show();
                    //             } else {
                    //               page = page - 1;
                    //               await AllProduct(page);
                    //               setState(() {
                    //                 allProducts();
                    //               });
                    //             }
                    //           },
                    //         )
                    //       ],
                    //     ));
                    //   }),
                    // )
                  ],
                )),
          ],
        ));
  }
}
