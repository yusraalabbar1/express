import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/order/myOrder.dart';
import 'package:express/model/api/products/order/placeOrder.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class completeCart extends StatefulWidget {
  completeCart({Key? key}) : super(key: key);

  @override
  State<completeCart> createState() => _completeCartState();
}

class _completeCartState extends State<completeCart> {
  String mobileNumber = "";
  String address = "";

  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text("My Cart".tr),
      ),
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
                  Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 10),
                    child: Text(
                      "Address".tr,
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
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: MyColors.color2),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText:
                            "${controller.saveProfiledefaultAddress} - ${controller.saveProfiledefaultAddressarea}",
                        suffixIcon: IconButton(
                            icon: Icon(Icons.mobile_friendly_outlined),
                            onPressed: () {}),
                      ),
                      onSaved: (string) {
                        address = string!;
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
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: MyColors.color2),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: controller.saveProfilemobile,
                        suffixIcon: IconButton(
                            icon: Icon(Icons.mobile_friendly_outlined),
                            onPressed: () {}),
                      ),
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
                      "Notes".tr,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: TextFormField(
                      minLines:
                          6, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Price: ".tr,
                          style: TextStyle(color: MyColors.new3, fontSize: 18)),
                      Text((2 + controllerPro.savecartTotal).toString(),
                          style: TextStyle(color: MyColors.new3, fontSize: 16))
                    ],
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
                        onPressed: () async {
                          var formdata = formstate.currentState;

                          formdata!.save();
                          print(mobileNumber);
                          print(address);
                          print("========================");
                          if (address == "") {
                            await PlaceOrder(
                                context, controller.saveProfiledefaultAddress);
                            // await MyOrder(1);
                          } else {
                            await PlaceOrder(context, address);
                            // await MyOrder(1);
                          }
                        },
                        child: Text(
                          "Checkout".tr,
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
