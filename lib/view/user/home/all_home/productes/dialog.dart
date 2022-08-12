import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';

dialog(context, text) {
  AwesomeDialog(
          context: context,
          animType: AnimType.RIGHSLIDE,
          dialogType: DialogType.INFO,
          headerAnimationLoop: true,
          btnOkOnPress: () {},
          body: Text(text,
              style: TextStyle(
                  color: MyColors.color2, fontSize: 14, fontFamily: 'Almarai')),
          dialogBackgroundColor: MyColors.color3,
          btnOkColor: MyColors.color1)
      .show();
}
