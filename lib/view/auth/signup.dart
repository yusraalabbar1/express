import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/model/api/auth/regist.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  var name;
  var mobileNumber;
  var city;
  var area;
  var password;
  var confrime;
  homecontroller controller = Get.put(homecontroller());
  final alphanumeric = RegExp(r"(\w+)");
  bool _isObscure = true;
  FocusNode myFocusNode = new FocusNode();

  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // imageBackgroundContainer(),
          containerMaine(),
          Form(
            key: formstate,
            child: Container(
              decoration: boxDecorationMain(),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            "SignUp".tr,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Image.asset(
                          "assets/images/logo.png",
                          height: 99,
                          width: 141,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: MyColors.color2),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Name".tr,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.person), onPressed: () {}),
                        ),
                        validator: (text) {
                          String pattern = r'^[a-zA-Z]';
                          RegExp regex = RegExp(pattern);
                          if (text == null ||
                              text.isEmpty ||
                              !regex.hasMatch(text))
                            return 'Enter a valid Name';
                          else
                            return null;
                          // if (text!.length > 30) {
                          //   return "can not enter bigest than 30";
                          // }
                          // if (text.length < 2) {
                          //   return "can not enter less than 2";
                          // }
                          // return null;
                        },
                        onSaved: (string) {
                          name = string;
                          controller.SaveUserName(string);
                        },
                      ));
                    })),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: MyColors.color2),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Mobile Number".tr,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.mobile_friendly_outlined),
                              onPressed: () {}),
                        ),
                        validator: (text) {
                          if (text!.length > 15) {
                            return "can not enter bigest than 15";
                          }
                          if (text.length < 9) {
                            return "can not enter less than 9";
                          }
                          return null;
                        },
                        onSaved: (string) {
                          mobileNumber = string;
                          controller.SaveMobil(string!);
                        },
                      ));
                    })),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: MyColors.color2),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "City".tr,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.location_city),
                              onPressed: () {}),
                        ),
                        validator: (text) {
                          String pattern = r'^[a-zA-Z]';
                          RegExp regex = RegExp(pattern);
                          if (text == null ||
                              text.isEmpty ||
                              !regex.hasMatch(text))
                            return 'Enter a valid city';
                          else
                            return null;
                        },
                        onSaved: (string) {
                          city = string;
                          controller.SaveCity(string);
                        },
                      ));
                    })),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: MyColors.color2),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Area".tr,
                          suffixIcon: IconButton(
                              icon: Icon(Icons.home), onPressed: () {}),
                        ),
                        validator: (text) {
                          String pattern = r'^[a-zA-Z]';
                          RegExp regex = RegExp(pattern);
                          if (text == null ||
                              text.isEmpty ||
                              !regex.hasMatch(text))
                            return 'Enter a valid Area';
                          else
                            return null;
                        },
                        onSaved: (string) {
                          area = string;
                          controller.SaveArea(string);
                        },
                      ));
                    })),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(child:
                        GetBuilder<homecontroller>(builder: (controller) {
                      return (TextFormField(
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color: MyColors.color2),
                        keyboardType: TextInputType.visiblePassword,
                        validator: (text) {
                          if (text!.length > 30) {
                            return "can not enter bigest than 30";
                          }
                          if (text.length < 2) {
                            return "can not enter less than 2";
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: "PassWord".tr,
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color(0xffFAB10C)
                                  : Colors.black),
                        ),
                        onSaved: (string) {
                          password = string;
                          controller.SavePassWord(string);
                        },
                      ));
                    })),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(
                        child:
                            //   GetBuilder<homecontroller>(builder: (controller) {
                            // return (
                            TextFormField(
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: MyColors.color2),
                      keyboardType: TextInputType.visiblePassword,
                      validator: (text) {
                        if (text!.length > 30) {
                          return "can not enter bigest than 30";
                        }
                        if (text.length < 2) {
                          return "can not enter less than 2";
                        }
                        return null;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: "Confirme PassWord".tr,
                        labelStyle: TextStyle(
                            color: myFocusNode.hasFocus
                                ? Color(0xffFAB10C)
                                : Colors.black),
                      ),
                      onSaved: (string) {
                        confrime = string;
                        // controller.SavePassWord(string);
                      },
                    )
                        //   );
                        // })
                        ),
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 30, left: 30, top: 10),
                      child: RaisedButton(
                        color: MyColors.color1,
                        elevation: 10,
                        splashColor: MyColors.color3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        onPressed: () {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            formdata.save();
                            print(" validddddddddddddddd");
                            print("========information input==========");
                            print(mobileNumber);
                            print(password);
                            print("========================");

                            if (password == confrime) {
                              registrition(
                                  context,
                                  name,
                                  controller.mobilControl,
                                  city,
                                  area,
                                  password,
                                  confrime);
                            } else {
                              print("not confrime pass");
                              AwesomeDialog(
                                      context: context,
                                      animType: AnimType.RIGHSLIDE,
                                      headerAnimationLoop: true,
                                      btnOkOnPress: () {},
                                      body: Text("passwords do not match".tr,
                                          style: TextStyle(
                                              color: MyColors.color2,
                                              fontSize: 14,
                                              fontFamily: 'Almarai')),
                                      dialogBackgroundColor: MyColors.color3,
                                      btnOkColor: MyColors.color1)
                                  .show();
                            }
                          }
                        },
                        child: Text(
                          "Creat Account".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 30, left: 30, top: 10),
                      child: RaisedButton(
                        color: MyColors.color1,
                        elevation: 10,
                        splashColor: MyColors.color3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("login");
                        },
                        child: Text(
                          "Already have an account ? Login".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  )
                ],
              ) /* add child content here */,
            ),
          ),
        ],
      ),
    );
  }
}
