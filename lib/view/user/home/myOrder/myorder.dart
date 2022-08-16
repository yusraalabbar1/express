import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/order/myOrderModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/all_home/productes/dialogImage.dart';
import 'package:express/view/user/home/all_home/productes/particular_producte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class myOrder extends StatefulWidget {
  myOrder({Key? key}) : super(key: key);

  @override
  State<myOrder> createState() => _myOrderState();
}

// List images = [];
class _myOrderState extends State<myOrder> {
  // controllerProduct controllerPro = Get.put(controllerProduct());
  int currentPage = 1;

  late int totalPages;

  List<passOrder> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage > totalPages) {
        refreshController.loadNoData();
        return false;
      }
    }
    homecontroller controller = Get.put(homecontroller());

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://myexpress.aqdeveloper.tech/api/v1/my-orders?lang=$lang&page=$currentPage'));

    request.headers.addAll(headers);

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = passOrderFromJson(res.body);

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pushReplacementNamed(context, 'homePage');
          return Future.value(false);
        },
        child: Column(
          children: [
            Expanded(
                child: SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await getPassengerData(isRefresh: true);
                if (result) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await getPassengerData();
                if (result) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: (ListView.builder(
                  itemCount: passengers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final passenger = passengers[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: MyColors.new3,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: MyColors.new4,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: RotatedBox(
                                        quarterTurns: -1,
                                        child: Center(
                                          child: Text(
                                              "${passenger.createdAt}"
                                                  .substring(0, 10),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                  fontFamily: 'Almarai')),
                                        ),
                                      ),
                                      decoration: const BoxDecoration(
                                        color: MyColors.new4,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0)),
                                      ),
                                      width: 40,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: ListTile(
                                        trailing: passenger.status == "pending"
                                            ? CircleAvatar(
                                                radius: 50,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        "https://cdn.pecsaustralia.com/wp-content/uploads/2019/11/27165821/US_prod_Wait-Card_01.jpg"),
                                              )
                                            : passenger.status == "completed"
                                                ? CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(
                                                            "https://thumbs.dreamstime.com/b/red-cross-icon-isolated-sign-wrong-error-button-white-background-eps-164583269.jpg"),
                                                  )
                                                : CircleAvatar(
                                                    radius: 50,
                                                    backgroundImage:
                                                        CachedNetworkImageProvider(
                                                            "https://static5.depositphotos.com/1033654/455/i/950/depositphotos_4555579-stock-photo-3d-human-arrow-success-green.jpg"),
                                                  ),
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                images = [];
                                                for (var i = 0;
                                                    i < passenger.items!.length;
                                                    i++) {
                                                  images.add(passenger
                                                      .items![i]
                                                      .product!
                                                      .images![0]
                                                      .image);
                                                }
                                                showCustomDialog(
                                                    context,
                                                    images,
                                                    passenger.items!.length);
                                              },
                                              child: Text("Show All Items".tr,
                                                  style: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Almarai")),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                                // alignment: Alignment.topLeft,
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Total Price: ".tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Almarai")),
                                                Text(
                                                    (passenger.finalTotal! + 2)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            )),
                                            Container(
                                                // alignment: Alignment.topLeft,
                                                child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("status: ".tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: "Almarai")),
                                                Text("${passenger.status}",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            )),
                                          ],
                                        )),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  })),
            )),
            // InkWell(
            //   onTap: () {
            //     Navigator.of(context).pushNamed("allOrder");
            //   },
            //   child: Container(
            //     margin: EdgeInsets.all(10),
            //     child: Text("Show All Orders".tr),
            //   ),
            // )
          ],
        ));
  }
}
