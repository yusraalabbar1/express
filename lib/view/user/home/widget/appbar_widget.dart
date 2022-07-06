import 'package:express/utilits/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appbar_Widget(GlobalKey<ScaffoldState> scaffoldKey, context) {
  return AppBar(
    title: Image.asset(
      "assets/images/logo.png",
      width: 90,
      height: 90,
    ),
    leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 35,
        ),
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        }),
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {
            //notification
            Navigator.of(context).pushNamed("searchProduct");
          }),
      IconButton(
          icon: Icon(
            Icons.notifications,
            size: 30,
          ),
          onPressed: () {
            //notification
            Navigator.of(context).pushNamed("notification");
          }),
    ],
  );
}

AppBar subappbar_Widget(GlobalKey<ScaffoldState> scaffoldKey, context, title) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
          ),
          onPressed: () {
            //notification
            Navigator.of(context).pushNamed("searchProduct");
          }),
    ],
  );
}
