import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/driver/d_detailsOrderModel.dart';
import 'package:express/model/model_json/driver/d_orderModel.dart';
import 'package:express/model/model_json/driver/new_order_other_model.dart';
import 'package:express/model/model_json/products/order/myOrderModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/all_home/productes/dialogImage.dart';
import 'package:express/view/user/home/all_home/productes/particular_producte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class otherOrder extends StatefulWidget {
  otherOrder({Key? key}) : super(key: key);

  @override
  State<otherOrder> createState() => _otherOrderState();
}

// List images = [];
class _otherOrderState extends State<otherOrder> {
  // controllerProduct controllerPro = Get.put(controllerProduct());
  int currentPage = 1;

  late int totalPages;

  List<DatumOrderOtherModel> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    print("otherrrrrrrrrrrrrrrrrrrrrr");
    if (isRefresh) {
      currentPage = 0;
    } else {
      print(totalPages);
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
            'https://myexpress.aqdeveloper.tech/api/v1/other-orders?lang=$lang&page=$currentPage'));

    request.headers.addAll(headers);

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = OrderOtherModelFromJson(res.body);

      if (isRefresh) {
        passengers = result.data!;
      } else {
        passengers.addAll(result.data!);
      }

      currentPage++;

      totalPages = result.meta!.totalPages!;
      print(totalPages);

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
        child: Expanded(
          flex: 6,
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
              child: ListView.builder(
                  itemCount: passengers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final passenger = passengers[index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: MyColors.color1,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: MyColors.color2,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          color: MyColors.new3,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              bottomLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0)),
                                        ),
                                        child: RotatedBox(
                                          quarterTurns: -1,
                                          child: Center(
                                            child: Text(
                                                passenger.created_at!
                                                    .toString()
                                                    .substring(0, 10),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    fontFamily: 'Almarai')),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Code Order:".tr + "\t",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                              Text(
                                                passenger.code.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "price : ".tr + "\t" + "JD",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                              Text(
                                                passenger.total.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Address".tr + ":" + "\t",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                              Text(
                                                passenger.userAddress
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Mobile Number".tr + ":" + "\t",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                              Text(
                                                passenger.userMobile.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Almarai',
                                                    height: 1.5),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  passenger.status == "pending"
                                      ? const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                CachedNetworkImageProvider(
                                                    "https://cdn.pecsaustralia.com/wp-content/uploads/2019/11/27165821/US_prod_Wait-Card_01.jpg"),
                                          ),
                                        )
                                      : passenger.status == "completed"
                                          ? const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        "https://thumbs.dreamstime.com/b/red-cross-icon-isolated-sign-wrong-error-button-white-background-eps-164583269.jpg"),
                                              ),
                                            )
                                          : const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        "https://static5.depositphotos.com/1033654/455/i/950/depositphotos_4555579-stock-photo-3d-human-arrow-success-green.jpg"),
                                              ),
                                            ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  })),
        ));
  }
}
