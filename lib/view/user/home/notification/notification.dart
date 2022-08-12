import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/api/general/notificationApi.dart';
import 'package:express/model/model_json/general/notificationModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class notification extends StatefulWidget {
  notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  // int page = 1;
  int currentPage = 1;

  late int totalPages;

  List<NotificationPass> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  /////////////////////////////////////

  Future<bool> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      print("1");
    } else {
      print("============================");
      print(totalPages);
      print("============================");
      if (currentPage > totalPages) {
        print("2");
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
        'GET', Uri.parse(Base + '/notifications?lang=$lang&page=$currentPage'));

    request.headers.addAll(headers);

    final response = await request.send();
    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final result = notificationPassFromJson(res.body);

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.color3,
          title: Text("Notifiction".tr,
              style: TextStyle(
                  color: MyColors.color4, fontSize: 14, fontFamily: 'Almarai')),
        ),
        body: Stack(
          children: [
            containerMaine(),
            Container(
              decoration: boxDecorationMain(),
            ),
            Column(
              children: [
                Expanded(
                  child: GetBuilder<homecontroller>(builder: (controller) {
                    return SmartRefresher(
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
                          shrinkWrap: true,
                          itemCount: passengers.length,
                          itemBuilder: (context, index) {
                            final passenger = passengers[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 2, bottom: 2),
                              child: ClipRRect(
                                child: Card(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Image.network(
                                              ("https://us.123rf.com/450wm/llesia/llesia2110/llesia211000042/176329767-notification-bell-icon-3d-render-yellow-ringing-bell-with-new-notification-for-social-media-reminder.jpg?ver=6"),
                                              fit: BoxFit.cover,
                                            )),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(4.0),
                                            bottomRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        width: 70,
                                        height: 73,
                                      ),

                                      SizedBox(width: 10),
                                      Expanded(
                                        child: ListTile(
                                          title: Text(passenger.title!,
                                              style: TextStyle(
                                                  color: MyColors.color2,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Almarai')),
                                          subtitle: Text(passenger.body!,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 7, 66, 73),
                                                  fontSize: 11,
                                                  fontFamily: 'Almarai')),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: RotatedBox(
                                          quarterTurns: -1,
                                          child: Text(
                                              passenger.createdAt!
                                                  .toString()
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11,
                                                  fontFamily: 'Almarai')),
                                        ),
                                        decoration: BoxDecoration(
                                          color: MyColors.color1,
                                          shape: BoxShape.rectangle,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            bottomLeft: Radius.circular(4.0),
                                          ),
                                        ),
                                        width: 40,
                                        height: 73,
                                      ),

                                      //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                    );
                  }),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: GetBuilder<homecontroller>(builder: (controller) {
                //     return (Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         controller.saveNotificationMap.length > 9
                //             ? InkWell(
                //                 child: Text("Show more".tr),
                //                 onTap: () async {
                //                   page = page + 1;
                //                   await notificationApi(page);
                //                   setState(() {
                //                     notification();
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
                //                       dialogBackgroundColor: MyColors.color3,
                //                       btnOkColor: MyColors.color1)
                //                   .show();
                //             } else {
                //               page = page - 1;
                //               await notificationApi(page);
                //               setState(() {
                //                 notification();
                //               });
                //             }
                //           },
                //         )
                //       ],
                //     ));
                //   }),
                // )
              ],
            )
          ],
        ));
  }
}
