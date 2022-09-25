import 'package:express/control/controller.dart';
import 'package:express/model/api/auth/login.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/welcom.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var mobileNumber;
  var password;
  bool _isObscure = true;
  FocusNode myFocusNode = new FocusNode();

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
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Login".tr,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Mobile Number".tr,
                      style: Theme.of(context).textTheme.headline4,
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
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: MyColors.color2),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        // suffix: Text("+962"),
                        prefixIcon: IconButton(
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
                        // controller.SaveUserName(string);
                      },
                    )
                        //   );
                        // })
                        ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Password".tr,
                      style: Theme.of(context).textTheme.headline4,
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
                        if (text.length < 2) {
                          return "can not enter less than 2";
                        }
                        return null;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
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
                        // controller.SavePassWord(string);
                      },
                    )
                        //   );
                        // })
                        ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        homecontroller controller = Get.put(homecontroller());
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setString("sendMen", "guest");
                        controller.SaveTypeUser("guest");
                        setState(() {
                          sendMen = "guest";
                        });
                        Navigator.of(context)
                            .pushReplacementNamed("welcomHome");
                      },
                      child: Text("Guest".tr,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 67, 67, 69),
                              fontFamily: 'Almarai')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("forget");
                    },
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 10),
                      child: Text(
                        "Forget Your Password?".tr,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                        child: Text(
                          "Don't have an account?".tr,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("signup");
                      },
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
                            loginApi(context, mobileNumber, password);
                          }
                        },
                        child: Text(
                          "Login".tr,
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
