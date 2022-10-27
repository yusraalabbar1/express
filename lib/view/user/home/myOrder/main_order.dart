import 'package:express/utilits/colors.dart';
import 'package:express/view/user/home/myOrder/myorder.dart';
import 'package:express/view/user/home/myOrder/other_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mainOrder extends StatefulWidget {
  mainOrder({Key? key}) : super(key: key);

  @override
  State<mainOrder> createState() => _mainOrderState();
}

int i = 1;

class _mainOrderState extends State<mainOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 55,
                  child: RaisedButton(
                    color: i == 1 ? MyColors.color1 : MyColors.color2,
                    elevation: 10,
                    splashColor: MyColors.color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color2, width: 2)),
                    onPressed: () {
                      setState(() {
                        i = 1;
                      });
                    },
                    child: Text(
                      "App Orders".tr,
                      style: TextStyle(
                          fontSize: 15,
                          color: MyColors.color3,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 55,
                  child: RaisedButton(
                    color: i == 0 ? MyColors.color1 : MyColors.color2,
                    elevation: 10,
                    splashColor: MyColors.color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color2, width: 2)),
                    onPressed: () {
                      setState(() {
                        i = 0;
                      });
                    },
                    child: Text(
                      "Other Orders".tr,
                      style: TextStyle(
                          fontSize: 15,
                          color: MyColors.color3,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        i == 1 ? myOrder() : otherOrder()
      ],
    );
  }
}
