import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';

class init extends StatefulWidget {
  init({Key? key}) : super(key: key);

  @override
  State<init> createState() => _initState();
}

class _initState extends State<init> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Future<bool> _onwillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 7, 44, 48),
            title: new Text("الخروج من التطبيق",
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            content: new Text("هل أنت متأكد؟؟",
                style: TextStyle(
                    color: Colors.white, fontSize: 13, fontFamily: 'Almarai')),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: MyColors.color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(color: MyColors.color1, width: 2)),
                    child: Text("نعم",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(true);
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
                            color: Color.fromARGB(255, 231, 38, 64), width: 2)),
                    child: Text("لا",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Almarai')),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ],
              )
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
        body: Stack(
          children: [
            // imageBackgroundContainer(),
            containerMaine(),
            Container(
              decoration: boxDecorationMain(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  wstContainer1(context),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: const Text(
                      "هيا لنبدأ",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Almarai'),
                    ),
                  ),
                  Container(
                    height: 55,
                    margin: EdgeInsets.only(
                        bottom: 10, right: 30, left: 30, top: 10),
                    child: RaisedButton(
                      color: MyColors.color1,
                      elevation: 10,
                      splashColor: MyColors.color1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: MyColors.color1, width: 2)),
                      onPressed: () async {
                        Navigator.of(context).pushNamed("welcom");
                      },
                      child: Text(
                        "ابدأ",
                        style: TextStyle(
                            fontSize: 15,
                            color: MyColors.color3,
                            fontFamily: 'Almarai'),
                      ),
                    ),
                  )
                ],
              ) /* add child content here */,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "جميع الحقوق محفوظة لدى التطبيق ",
                  style: TextStyle(
                      fontSize: 13,
                      color: MyColors.color3,
                      fontFamily: 'Almarai'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
