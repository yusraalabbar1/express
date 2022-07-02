import 'package:cached_network_image/cached_network_image.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class contactus extends StatefulWidget {
  contactus({Key? key}) : super(key: key);

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {
  controllerProduct controllerPro = Get.put(controllerProduct());
  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: MyColors.color1
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //       image: CachedNetworkImageProvider(
              //           "https://media.istockphoto.com/illustrations/contact-us-special-blue-banner-background-illustration-id1147152588?k=20&m=1147152588&s=612x612&w=0&h=njzV_aSc-wz3LxoJpIfXcq-Yg4nJttrVUMBMMnnstCo="),
              //       fit: BoxFit.cover),
              // ),
              ),
          Container(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 150,
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
                                          ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: controllerPro
                                                  .saveAllSetting["contact_us"]
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ListTile(
                                                    leading: IconButton(
                                                        onPressed: () {
                                                          Clipboard.setData(
                                                              new ClipboardData(
                                                                  text: controllerPro
                                                                      .listValue[
                                                                          index]
                                                                      .toString()));
                                                          key.currentState!
                                                              .showSnackBar(
                                                                  new SnackBar(
                                                            content: new Text(
                                                                "Copied to Clipboard"),
                                                          ));
                                                        },
                                                        icon: Icon(Icons.copy)),
                                                    trailing: Text(
                                                      controllerPro
                                                          .listValue[index]
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              MyColors.color2,
                                                          fontSize: 15),
                                                    ),
                                                    title: Text(controllerPro
                                                        .listKey[index]));
                                              }),
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
                                  Icons.contact_page,
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
