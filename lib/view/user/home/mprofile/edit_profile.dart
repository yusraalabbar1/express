import 'package:express/control/controller.dart';
import 'package:express/model/api/profile/editProfil.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<FormState> formstate = new GlobalKey<FormState>();
homecontroller controller = Get.find();

showLoading(context) {
  String name = "", mobile = "", city = "", area = "";
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
              key: formstate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Edit".tr,
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 13,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 30,
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Almarai',
                          fontSize: 10),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: controller.saveProfileName,
                      ),
                      // validator: (text) {
                      //   if (text!.length > 15) {
                      //     return "can not enter bigest than 15";
                      //   }
                      //   if (text.length < 2) {
                      //     return "can not enter less than 2";
                      //   }
                      //   return null;
                      // },
                      onSaved: (string) {
                        print("on saved");
                        name = string!;
                        if (name != "") {
                          controller.SaveProfileName(string);
                        }
                      },
                    ));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Almarai',
                          fontSize: 10),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: controller.saveProfilemobile,
                      ),
                      // validator: (text) {
                      //   if (text!.length > 15) {
                      //     return "can not enter bigest than 15";
                      //   }
                      //   if (text.length < 9) {
                      //     return "can not enter less than 9";
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        // do something
                      },
                      onSaved: (string) {
                        print("on saved");
                        mobile = string!;
                        if (mobile != "") {
                          controller.SaveProfilemobile(string);
                        }
                      },
                    ));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Almarai',
                          fontSize: 10),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: controller.saveProfiledefaultAddress,
                      ),
                      // validator: (text) {
                      //   if (text!.length > 15) {
                      //     return "can not enter bigest than 15";
                      //   }
                      //   if (text.length < 2) {
                      //     return "can not enter less than 2";
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        // do something
                      },
                      onSaved: (string) {
                        print("on saved");
                        city = string!;
                        if (city != "") {
                          controller.SaveProfiledefaultAddress(string);
                        }
                      },
                    ));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<homecontroller>(builder: (controller) {
                    return (TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Almarai',
                          fontSize: 10),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: controller.saveProfiledefaultAddressarea,
                      ),
                      // validator: (text) {
                      //   if (text!.length > 15) {
                      //     return "can not enter bigest than 15";
                      //   }
                      //   if (text.length < 2) {
                      //     return "can not enter less than 2";
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        // do something
                      },
                      onSaved: (string) {
                        print("on saved");
                        area = string!;
                        if (area != "") {
                          controller.SaveProfiledefaultAddressarea(string);
                        }
                      },
                    ));
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: MyColors.color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        child: Text("Ok".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            print("valid");
                            if (name == "" || name == null) {
                              name = controller.saveProfileName;
                              print("1");
                              print(name);
                            }
                            if (mobile == "" || mobile == null) {
                              mobile = controller.saveProfilemobile;
                              print("2");
                              print(controller.saveProfilemobile);
                            }
                            if (city == "" || city == null) {
                              city = controller.saveProfiledefaultAddress;
                              print("3");
                              print(city);
                            }
                            if (area == "" || area == null) {
                              area = controller.saveProfiledefaultAddressarea;
                              print("4");
                              print(area);
                            }
                            await EditProfil(context, name, mobile, city, area);
                          }
                          Navigator.of(context).pop();
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        color: Color.fromARGB(255, 231, 38, 64),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(
                                color: Color.fromARGB(255, 231, 38, 64),
                                width: 2)),
                        child: Text("Cancle".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              )),
        );
      });
}
