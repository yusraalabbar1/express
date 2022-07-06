import 'package:express/control/controllerDirver.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatVendor extends StatefulWidget {
  chatVendor({Key? key}) : super(key: key);

  @override
  State<chatVendor> createState() => _chatVendorState();
}

final _firstore = FirebaseFirestore.instance;

class _chatVendorState extends State<chatVendor> {
  String? messageText;
  final messageTextController = TextEditingController();

  controllerDriver controller = Get.put(controllerDriver());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.color2,
        title: Text('محادثتي',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontFamily: 'Almarai')),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: MyColors.color2,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: MyColors.color3,

                        // hoverColor: Colors.white,
                        filled: true,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'اكتب الرسالة هنا',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firstore.collection('express').add({
                        'id': controller.detailsOrdervendor["id"],
                        'text': messageText,
                        'sender': controller.detailsOrdervendor["vendor"]
                            ["name"],
                        'mobile': controller.detailsOrdervendor["vendor"]
                            ["mobile"],
                        'time': FieldValue.serverTimestamp()
                      });
                    },
                    child: Text(
                      'ارسال',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  MessageStreamBuilder({Key? key}) : super(key: key);

  controllerDriver controller = Get.put(controllerDriver());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firstore.collection('express').orderBy('time').snapshots(),
      // initialData: initialData,
      builder: (context, snapshot) {
        List<messageLine> messageWidgets = [];
        if (snapshot.hasData) {
          //add here a spinner
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            //conition add messageWidgets if messageSender==same driver and same vendor
            if (message.get('id') ==
                int.parse(controller.detailsOrdervendor["id"].toString())) {
              print("this is true user");
              final messageText = message.get('text');
              final messageSender = message.get('sender');
              final messageMobile = message.get('mobile');
              final messageWidget = messageLine(
                  text: messageText,
                  sender: messageSender,
                  mobile: messageMobile,
                  tovendor: controller.detailsOrdervendor["delivery"]["mobile"],
                  isMe: messageSender ==
                      controller.detailsOrdervendor["vendor"]["name"]);
              messageWidgets.add(messageWidget);
            } else {
              print("not true");
            }
          }
        } else {
          print("no data");
          return Center(child: CircularProgressIndicator());
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class messageLine extends StatelessWidget {
  const messageLine(
      {this.text,
      this.sender,
      this.mobile,
      required this.isMe,
      this.tovendor,
      Key? key})
      : super(key: key);
  final String? sender;
  final String? text;
  final String? mobile;
  final bool isMe;
  final String? tovendor;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text('$mobile , $sender',
                style: TextStyle(fontSize: 12, color: Colors.amber)),
            Material(
                color: isMe ? Colors.amber : MyColors.color2,
                elevation: 5,
                borderRadius: isMe
                    ? BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )
                    : BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    '$text',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )),
          ],
        ));
  }
}
