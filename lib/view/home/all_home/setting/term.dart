import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';

class term extends StatefulWidget {
  term({Key? key}) : super(key: key);

  @override
  State<term> createState() => _termState();
}

class _termState extends State<term> {
  controllerProduct controllerPro = Get.put(controllerProduct());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://medicliq.health/wp-content/uploads/2022/04/Terms-and-Conditions-.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  elevation: 0.0,
                  backgroundColor: Colors.transparent,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.transparent,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40.0),
                                    topLeft: Radius.circular(40.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/background.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 60,
                                          ),
                                          Text(
                                            parse(controllerPro.saveAllSetting[
                                                    "app_terms"])
                                                .body!
                                                .text,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            // left: 46,
                            top: 0.0,
                            left: (MediaQuery.of(context).size.width) / 2 - 31,

                            // (background container size) - (circle height / 2)
                            child: Center(
                              child: Container(
                                child: Icon(
                                  Icons.add_moderator,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                height: 84.0,
                                width: 84.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 192, 230, 233)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSliverAppBar() {
  return SliverAppBar(
    actions: [],
    expandedHeight: 350,
    elevation: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      background: Hero(
        tag: 1,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
