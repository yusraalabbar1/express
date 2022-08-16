import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/categories/categories.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class langPage extends StatefulWidget {
  langPage({Key? key}) : super(key: key);

  @override
  State<langPage> createState() => _langPageState();
}

class _langPageState extends State<langPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  // AppLanguage langControl = Get.put(AppLanguage());
  // homecontroller controller = Get.put(homecontroller());

  controllerProduct controllerPro = Get.put(controllerProduct());
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
                Center(
                  child: Text("اختر لغة التطبيق",
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 15,
                          fontFamily: 'Almarai')),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text("Choose The Language of the Application",
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 15,
                          fontFamily: 'Almarai')),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 130,
                        height: 50,
                        child: GetBuilder<controllerProduct>(
                            builder: (controllerPro) {
                          return (RaisedButton(
                            onPressed: () async {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              print('Button Clicked.');
                              await preferences.setString("lang", 'en');
                              controllerPro.SaveLanguage(
                                  preferences.getString("lang"));

                              Get.updateLocale(Locale('en'));
                              Navigator.of(context)
                                  .pushReplacementNamed("login");
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25.0))),
                            child: Text(
                              "English",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Almarai'),
                            ),
                            textColor: Colors.white,
                            splashColor: Colors.white,
                            color: MyColors.color2,
                          ));
                        }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 130,
                          height: 50,
                          child: GetBuilder<controllerProduct>(
                              builder: (controllerPro) {
                            return (RaisedButton(
                              onPressed: () async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                preferences.setString("lang", 'ar');
                                controllerPro.SaveLanguage(
                                    preferences.getString("lang"));
                                Get.updateLocale(const Locale('ar'));
                                // Get.toNamed("welcomHome");
                                Navigator.of(context)
                                    .pushReplacementNamed("login");
                              },
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              child: const Text(
                                "العربية",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Almarai'),
                              ),
                              textColor: Colors.white,
                              splashColor: Colors.white,
                              color: MyColors.color2,
                            ));
                          })),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              ],
            ) /* add child content here */,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "جميع الحقوق محفوظة لدى التطبيق 2022",
                style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 13, 13, 18),
                    fontFamily: 'Almarai'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
