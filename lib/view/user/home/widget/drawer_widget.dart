import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/widget/chane_lang.dart';
import 'package:express/view/user/home/widget/delet_account.dart';
import 'package:express/view/user/home/widget/logoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget drawerMain(context) {
  return Container(
    color: MyColors.new3,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            maxRadius: 50,
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("term");
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.add_moderator,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      child: Text("Terms and Conditions".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Almarai')))
                ],
              ),
            ),
          ),
          InkWell(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.security,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("Privacy policy".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
            onTap: () {
              Navigator.of(context).pushNamed("privecy");
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("aboutus");
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.person_pin_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      child: Text("About Us".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Almarai')))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("contactus");
              },
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.person_pin_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      child: Text("Contact Us".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Almarai')))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              showLoadingLang(context);
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.language,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("Language".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              showLoadingLogout(context);
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("Log out".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              showLoadingDelet(context);
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Icon(
                    Icons.delete_forever,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                Container(
                    child: Text("Delet Account".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Almarai')))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
