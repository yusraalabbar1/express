import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/model/api/auth/forget.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forget extends StatefulWidget {
  forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  var mobileNumber;
  var confrime, password;
  bool _isObscure = true;
  FocusNode myFocusNode = new FocusNode();

  homecontroller controller = Get.put(homecontroller());
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
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
                  SizedBox(
                    height: 50,
                  ),
                  wstContainer1(context),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Reset Password".tr,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Center(
                        child:
                            //   GetBuilder<homecontroller>(builder: (controller) {
                            // return (
                            TextFormField(
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
                        mobileNumber = string!;
                        controller.SaveNumberMobileForget(string);
                      },
                    )
                        //   );
                        // })
                        ),
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
                        if (text.length < 6) {
                          return "can not enter less than 6";
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
                        controller.SavePassWordForget(string);
                      },
                    )
                        //   );
                        // })
                        ),
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
                        if (text.length < 6) {
                          return "can not enter less than 6";
                        }
                        return null;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: "Confirme PassWord".tr,
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
                            if (password == confrime) {
                              print(" validddddddddddddddd");
                              print("========information input==========");
                              print(mobileNumber);
                              print(password);
                              print("========================");
                              // loginApi(context, mobileNumber, password);

                              forgetMobile(context, mobileNumber);
                            } else {
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
                          "Next".tr,
                          style: TextStyle(
                              fontSize: 13,
                              color: MyColors.color3,
                              fontFamily: 'Almarai'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
