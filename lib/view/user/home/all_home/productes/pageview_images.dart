import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controller.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/all_home/productes/particular_producte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class pageViewImages extends StatefulWidget {
  pageViewImages({Key? key}) : super(key: key);

  @override
  State<pageViewImages> createState() => _pageViewImagesState();
}

class _pageViewImagesState extends State<pageViewImages> {
  PageController? _pageController;
  // List<String> images = controller.bannerImg;

  int activePage = 1;
  int _currentPage = 0;
  // late Timer _timer;
  @override
  void initState() {
    super.initState();
    // _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   if (_currentPage < images.length - 1) {
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
    //   _pageController!.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 350),
    //     curve: Curves.easeIn,
    //   );
    // });
    print("this is _pageViewImagesState");
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    // _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: MyColors.color1, spreadRadius: 2),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 230,
            child: PageView.builder(
                itemCount: images.length,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  bool active = pagePosition == activePage;
                  return slider(context, images, pagePosition, active);
                }),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(images.length, activePage))
        ],
      ),
    );
  }
}

AnimatedContainer slider(context, images, pagePosition, active) {
  double margin = active ? 5 : 8;

  return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // image: DecorationImage(
        //   image: CachedNetworkImageProvider(images[pagePosition]),
        //   fit: BoxFit.cover,
        // )
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(
              images[pagePosition],
            ),
            gaplessPlayback: false,
            customSize: MediaQuery.of(context).size,
            enableRotation: true,
            minScale: PhotoViewComputedScale.contained * 0.1,
            maxScale: PhotoViewComputedScale.covered * 1.8,
            initialScale: PhotoViewComputedScale.contained,
            basePosition: Alignment.center,
            backgroundDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
          )));
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
