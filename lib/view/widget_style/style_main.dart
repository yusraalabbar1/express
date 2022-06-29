import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';

Container containerMaine() {
  return Container(
    width: double.infinity,
    height: double.infinity,
  );
}

BoxDecoration boxDecorationMain() {
  return BoxDecoration(
    image: DecorationImage(
      image: AssetImage("assets/images/background.png"),
      fit: BoxFit.cover,
    ),
  );
}

Container wstContainer1(context) {
  return Container(
      height: (MediaQuery.of(context).size.height) / 5,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/images/logo.png"));
}

Container buttonStart(col1, col2, t1, col3, context, rout) {
  return Container(
    width: double.infinity,
    height: 55,
    margin: EdgeInsets.only(bottom: 10, right: 30, left: 30, top: 10),
    child: RaisedButton(
      color: col1,
      elevation: 10,
      splashColor: MyColors.color1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: col2, width: 2)),
      onPressed: () {
        Navigator.of(context).pushNamed(rout);
      },
      child: Text(
        t1,
        style: TextStyle(fontSize: 15, color: col3, fontFamily: 'Almarai'),
      ),
    ),
  );
}
