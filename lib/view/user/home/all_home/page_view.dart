import 'dart:async';

import 'package:express/control/controller.dart';
import 'package:express/model/api/categories/subCat.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController? _pageController;
  homecontroller controller = Get.put(homecontroller());
  // List<String> images = controller.bannerImg;

  int activePage = 1;
  int _currentPage = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < controller.saveContrilerBannerMap.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController!.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: controller.saveContrilerBannerMap.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(context, controller.saveContrilerBannerMap,
                    pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(
                controller.saveContrilerBannerMap.length, activePage))
      ],
    );
  }
}

Widget slider(context, images, pagePosition, active) {
  double margin = active ? 5 : 10;

  return InkWell(
    onTap: () async {
      print("===================================");
      print(images[pagePosition]["type"]);
      if (images[pagePosition]["type"] == 'external_url') {
        launch(images[pagePosition]["target"]);
      } else if (images[pagePosition]["type"] == 'category') {
      } else if (images[pagePosition]["type"] == 'product') {
        await detailsProducts(images[pagePosition]["target"]["id"]);
        Navigator.of(context).pushNamed("particularProducte");
      } else if (images[pagePosition]["type"] == 'sub_category') {
        // await SubCategories(32);
        // await SubSubCategories(images[pagePosition]["target"]["id"]);
        // Navigator.of(context).pushNamed("subSubCat");
      }
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(
            image: CachedNetworkImageProvider(images[pagePosition]["image"]),
            fit: BoxFit.cover,
          )),
    ),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
