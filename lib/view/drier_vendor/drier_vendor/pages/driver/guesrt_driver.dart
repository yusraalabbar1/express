import 'package:flutter/material.dart';

class gestDriver extends StatefulWidget {
  @override
  State<gestDriver> createState() => _gestDriverState();
}

class _gestDriverState extends State<gestDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("أنت يجب أن تسجل الدخول"),
      ),
    );
  }
}
