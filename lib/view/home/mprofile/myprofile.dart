import 'dart:io';

import 'package:express/control/controller.dart';
import 'package:express/model/api/profile/profileUpdate.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/home/mprofile/edit_profile.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class myProfile extends StatefulWidget {
  myProfile({Key? key}) : super(key: key);

  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  homecontroller controller = Get.put(homecontroller());
  PickedFile? imageFile = null;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option".tr,
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery".tr),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera".tr),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openGallery(BuildContext context) async {
    String fileName = "";
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) {
      print("no image");
    } else {
      setState(() {
        imageFile = pickedFile;
        fileName = imageFile!.path.split('/').last;
      });
      updateProfile(
          controller.saveProfileName,
          controller.saveProfilemobile,
          controller.saveProfiledefaultAddress,
          controller.saveProfiledefaultAddressarea,
          File(imageFile!.path),
          fileName);
    }

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    String fileName = "";
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) {
      print("no image");
    } else {
      setState(() {
        imageFile = pickedFile;
        fileName = imageFile!.path.split('/').last;
      });
      updateProfile(
          controller.saveProfileName,
          controller.saveProfilemobile,
          controller.saveProfiledefaultAddress,
          controller.saveProfiledefaultAddressarea,
          File(imageFile!.path),
          fileName);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print(
            'Backbutton pressed (device or appbar button), do whatever you want.');
        Navigator.pushReplacementNamed(context, 'homePage');
        return Future.value(false);
      },
      child: Scaffold(
          body: Stack(
        children: [
          containerMaine(),
          Container(
            decoration: boxDecorationMain(),
          ),
          // rowAppbar(context),
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height - 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: MyColors.new3,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GetBuilder<homecontroller>(builder: (controller) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    width: 44,
                                    height: 44,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundColor: MyColors.new4,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: imageFile == null
                                            ? Image.network(
                                                controller
                                                    .saveProfilephotoProfile,
                                                width: 44,
                                                height: 44,
                                                fit: BoxFit.fill,
                                              )
                                            : Image.file(
                                                File(imageFile!.path),
                                                errorBuilder: (context,
                                                        exception,
                                                        stackTrack) =>
                                                    Icon(
                                                  Icons.error,
                                                ),
                                              ),
                                      ),
                                    ),
                                  )
                                  //   );
                                  // })
                                  ),
                              Expanded(
                                  flex: 1,
                                  child: Text("",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Almarai'))),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 127,
                                    height: 37,
                                    child: RaisedButton.icon(
                                      onPressed: () {
                                        print('Button Clicked.');
                                        _showChoiceDialog(context);
                                        // Navigator.of(context).pushNamed("UploadImageScreen");
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0))),
                                      label: Text(
                                        "Change profile picture".tr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'Almarai'),
                                      ),
                                      icon: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                      textColor: Colors.white,
                                      splashColor: Colors.white,
                                      color: MyColors.new4,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text('User Name'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Almarai')),
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.all(30),
                                    child: Text(
                                        controller.saveProfileName != null
                                            ? controller.saveProfileName
                                            : "",
                                        style: TextStyle(
                                            color: MyColors.color1,
                                            fontSize: 13,
                                            fontFamily: 'Almarai')),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 32, 53, 104),
                                      Color(0xff414D72)
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text("Name".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Almarai')),
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(30),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        controller.saveProfileName != null
                                            ? controller.saveProfileName
                                            : "",
                                        style: TextStyle(
                                            color: MyColors.color1,
                                            fontSize: 13,
                                            fontFamily: 'Almarai')),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 32, 53, 104),
                                      Color(0xff414D72)
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text("Mobile Number".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Almarai')),
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(30),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        controller.saveProfilemobile != null
                                            ? controller.saveProfilemobile
                                            : "",
                                        style: TextStyle(
                                            color: MyColors.color1,
                                            fontSize: 13,
                                            fontFamily: 'Almarai')),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 32, 53, 104),
                                      Color(0xff414D72)
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text("City".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Almarai')),
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(30),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        controller.saveProfiledefaultAddress !=
                                                null
                                            ? controller
                                                .saveProfiledefaultAddress
                                            : "",
                                        style: TextStyle(
                                            color: MyColors.color1,
                                            fontSize: 13,
                                            fontFamily: 'Almarai')),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          Container(
                            height: 2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color.fromARGB(255, 32, 53, 104),
                                      Color(0xff414D72)
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                  child: Container(
                                child: Text("Area".tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Almarai')),
                              )),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(30),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        controller.saveProfiledefaultAddressarea !=
                                                null
                                            ? controller
                                                .saveProfiledefaultAddressarea
                                            : "",
                                        style: TextStyle(
                                            color: MyColors.color1,
                                            fontSize: 13,
                                            fontFamily: 'Almarai')),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 150,
                            height: 37,
                            child: RaisedButton.icon(
                              onPressed: () {
                                print('Button Clicked.');
                                showLoading(context);
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              label: Text(
                                "Edit information".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Almarai'),
                              ),
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              splashColor: Colors.white,
                              color: MyColors.new4,
                            ),
                          ),
                        ],
                      );
                    })),
              ),
            ],
          )
        ],
      )),
    );
  }
}
