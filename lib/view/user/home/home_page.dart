import 'package:express/control/controller.dart';
import 'package:express/model/api/categories/categories.dart';
import 'package:express/model/api/general/banner.dart';
import 'package:express/model/api/products/all_product.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/api/products/latest_products.dart';
import 'package:express/model/api/products/order/myOrder.dart';
import 'package:express/model/api/products/populer.dart';
import 'package:express/model/api/setting/setting.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/mprofile/myprofile.dart';
import 'package:express/view/user/home/myCar/mycart.dart';
import 'package:express/view/user/home/myHome/myhome.dart';
import 'package:express/view/user/home/myLike/mylike.dart';
import 'package:express/view/user/home/myOrder/myorder.dart';
import 'package:express/view/user/home/widget/appbar_widget.dart';
import 'package:express/view/user/home/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _currentIndex = 0;
  homecontroller controller = Get.put(homecontroller());

  final List<Widget> widgetOptions = <Widget>[
    myHome(),
    myProfile(),
    myOrder(),
    myLike(),
    myCart(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // MyCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appbar_Widget(_scaffoldKey, context),
      drawer: Drawer(
        child: drawerMain(context),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text(
              "Home".tr,
              style: TextStyle(fontFamily: 'Almarai'),
            ),
            selectedColor: MyColors.new4,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text(
              "Profile".tr,
              style: TextStyle(fontFamily: 'Almarai'),
            ),
            selectedColor: MyColors.new3,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.list_alt),
            title: Text(
              "My Orders".tr,
              style: TextStyle(fontFamily: 'Almarai'),
            ),
            selectedColor: MyColors.color1,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(
              "Likes".tr,
              style: TextStyle(fontFamily: 'Almarai'),
            ),
            selectedColor: Colors.pink,
          ),

          /// shopping_cart
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(
              "My Cart".tr,
              style: TextStyle(fontFamily: 'Almarai'),
            ),
            selectedColor: MyColors.new4,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await MyFavorite();
          await MyCart();
          await latestProduct();
          await banner();
          await AllProduct(1);
          await populer();
        },
        child: Center(
          child: widgetOptions.elementAt(_currentIndex),
        ),
      ),
    );
  }
}
