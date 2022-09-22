import 'package:flutter/material.dart';

class guestVendor extends StatefulWidget {
  @override
  State<guestVendor> createState() => _guestVendorState();
}

class _guestVendorState extends State<guestVendor> {
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
