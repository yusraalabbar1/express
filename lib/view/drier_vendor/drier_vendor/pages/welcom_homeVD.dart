import 'dart:async';

import 'package:express/control/controllerDirver.dart';
import 'package:express/main.dart';
import 'package:express/model/api/driver/d_orderApi.dart';
import 'package:express/model/api/vendor/v_orderApi.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomHomeVD extends StatefulWidget {
  welcomHomeVD({Key? key}) : super(key: key);

  @override
  State<welcomHomeVD> createState() => _welcomHomeVDState();
}

class _welcomHomeVDState extends State<welcomHomeVD>
    with AutomaticKeepAliveClientMixin {
  getInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    controllerDriver controller = Get.put(controllerDriver());
    String? men = preferences.getString('sendMen');
    if (controller.saveDriverLogin == 2 || isLogin == 2) {
      print("driverrrrrrr");
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenDriver'));
      await OrderApi();
    } else if (controller.saveVendorLogin == 3 || isLogin == 3) {
      print("vendorrrrrrrrr");
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenVendor'));
      await OrderApiVendor();
    } else {
      print(isLogin);
      print("no thing");
    }
  }

  Timer? searchOnStoppedTyping;
  _onChangeHandler() {
    const duration = Duration(
        milliseconds:
            3000); // set the duration that you want call pop() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => navigateHome());
  }

  navigateHome() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    controllerDriver controller = Get.put(controllerDriver());
    String? men = preferences.getString('sendMen');
    await getInfo();
    if (controller.saveDriverLogin == 2 || isLogin == 2) {
      Navigator.of(context).pushReplacementNamed("home_pageD");
    } else if (controller.saveVendorLogin == 3 || isLogin == 3) {
      Navigator.of(context).pushReplacementNamed("orderVendor");
    }
  }

  @override
  void initState() {
    // getInfo();
    _onChangeHandler();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wstContainer1(context),
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: const Text(
                    "",
                    style: TextStyle(
                        fontSize: 12,
                        color: MyColors.color3,
                        fontFamily: 'Almarai'),
                  ),
                ),
                Center(
                    child: Image.asset(
                  "assets/images/loading2.gif",
                  width: 130,
                ))
              ],
            ) /* add child content here */,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق ",
                style: TextStyle(
                    fontSize: 13,
                    color: MyColors.color3,
                    fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
