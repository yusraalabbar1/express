import 'package:express/control/controllerDirver.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

final firstore = FirebaseFirestore.instance;

class _ChatScreenState extends State<ChatScreen> {
  var notes = "";
  var c1, c2, c3, cc1, cc2, cc3;
  // Widget circuler(text, ontap) {
  //   return Container(
  //     height: 55,
  //     child: RaisedButton(
  //       color: c2 == 1 ? MyColors.color1 : Colors.orange,
  //       elevation: 10,
  //       splashColor: Colors.orange,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(25),
  //           side: BorderSide(color: Colors.orange, width: 2)),
  //       onPressed: () {
  //         // Navigator.of(context).pushNamed("info");
  //         setState(() {
  //           notes = text;
  //           print(notes);
  //           firstore.collection('express').add({
  //             'id': controller.detailsOrder["id"],
  //             'text': notes,
  //             'sender': controller.detailsOrder["delivery"]["name"],
  //             'mobile': controller.detailsOrder["delivery"]["mobile"],
  //             'time': FieldValue.serverTimestamp()
  //           });
  //         });
  //       },
  //       child: Text(
  //         text,
  //         style: TextStyle(
  //             fontSize: 15, color: Colors.white, fontFamily: 'Almarai'),
  //       ),
  //     ),
  //   );
  // }

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
            // Container(
            //     child: Column(
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(15.0),
            //       child: Text(
            //         " اختر اختصارات التبليغ",
            //         style: TextStyle(
            //             fontSize: 17,
            //             color: Colors.grey,
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'Almarai'),
            //       ),
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [

            //         circuler("مفصول", cc1 = 1),
            //         circuler("مغلق", cc2 = 1),
            //         circuler("رفض ودفع توصيل", notes == "رفض ودفع توصيل"),
            //       ],
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         circuler("تعديل قيمة", notes == "تعديل قيمة"),
            //         circuler(
            //             "رفض وعدم دفع توصيل", notes == "رفض وعدم دفع توصيل"),
            //         circuler("لارد", cc3 = 1),
            //       ],
            //     ),
            //     SizedBox(
            //       height: 10,
            //     ),
            //   ],
            // )),
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
                      firstore.collection('express').add({
                        'id': controller.detailsOrder["id"],
                        'text': messageText,
                        'sender': controller.detailsOrder["delivery"]["name"],
                        'mobile': controller.detailsOrder["delivery"]["mobile"],
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
      stream: firstore.collection('express').orderBy('time').snapshots(),
      // initialData: initialData,
      builder: (context, snapshot) {
        List<messageLine> messageWidgets = [];
        if (snapshot.hasData) {
          //add here a spinner
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            //conition add messageWidgets if messageSender==same driver and same vendor
            if (message.get('id') ==
                int.parse(controller.detailsOrder["id"].toString())) {
              print("this is true user");
              final messageText = message.get('text');
              final messageSender = message.get('sender');
              final messageMobile = message.get('mobile');
              final messageWidget = messageLine(
                  text: messageText,
                  sender: messageSender,
                  mobile: messageMobile,
                  tovendor: controller.detailsOrder["vendor"]["mobile"],
                  isMe: messageSender ==
                      controller.detailsOrder["delivery"]["name"]);
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
              isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text('$mobile , $sender',
                style: TextStyle(fontSize: 12, color: Colors.amber)),
            Material(
                color: isMe ? MyColors.color2 : Colors.amber,
                elevation: 5,
                borderRadius: isMe
                    ? BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(30),
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
