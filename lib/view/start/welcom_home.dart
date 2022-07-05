import 'dart:async';

import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/api/categories/categories.dart';
import 'package:express/model/api/categories/productCategory.dart';
import 'package:express/model/api/categories/subCat.dart';
import 'package:express/model/api/general/banner.dart';
import 'package:express/model/api/general/notificationApi.dart';
import 'package:express/model/api/products/all_product.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/favorite/add_fav.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/api/products/latest_products.dart';
import 'package:express/model/api/products/order/myOrder.dart';
import 'package:express/model/api/products/populer.dart';
import 'package:express/model/api/setting/setting.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/home/home_page.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class welcomHome extends StatefulWidget {
  welcomHome({Key? key}) : super(key: key);

  @override
  State<welcomHome> createState() => _welcomHomeState();
}

class _welcomHomeState extends State<welcomHome>
    with AutomaticKeepAliveClientMixin {
  getInfo() async {
    homecontroller controller = Get.put(homecontroller());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    lang = preferences.getString("lang")!;
    controller.SaveProfileaccessToken(preferences.getString('accessToken'));
    controller.SaveProfileName(preferences.getString('name'));
    controller.SaveProfilemobile(preferences.getString('mobile'));
    controller.SaveProfilephotoProfile(preferences.getString('photoProfile'));
    controller.SaveProfiledefaultAddress(preferences.getString('city'));
    controller.SaveProfiledefaultAddressarea(preferences.getString('area'));
    latestProduct();
    sitting();
    banner();
    AllProduct(1);
    populer();
    AllCategories(lang);
    // SubCategories(30);
    MyFavorite();
    MyCart();
    notificationApi(1);
    MyOrder(1);
  }

  Timer? searchOnStoppedTyping;
  _onChangeHandler() {
    const duration = Duration(
        milliseconds:
            8000); // set the duration that you want call pop() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping?.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => navigateHome());
  }

  navigateHome() {
    Navigator.of(context).pushReplacementNamed("homePage");
  }

  @override
  void initState() {
    getInfo();
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
