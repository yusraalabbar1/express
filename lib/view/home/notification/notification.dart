import 'package:express/utilits/colors.dart';
import 'package:express/view/widget_style/style_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class notification extends StatefulWidget {
  notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.color3,
          title: Text("Notifiction".tr,
              style: TextStyle(
                  color: MyColors.color4, fontSize: 14, fontFamily: 'Almarai')),
        ),
        body: Stack(
          children: [
            containerMaine(),
            Container(
              decoration: boxDecorationMain(),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  // int itemCount = notifmap.length;
                  // int reversedIndex = itemCount - 1 - index;
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 2, bottom: 2),
                    child: ClipRRect(
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    ("https://us.123rf.com/450wm/llesia/llesia2110/llesia211000042/176329767-notification-bell-icon-3d-render-yellow-ringing-bell-with-new-notification-for-social-media-reminder.jpg?ver=6"),
                                    fit: BoxFit.cover,
                                  )),
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(4.0),
                                ),
                              ),
                              width: 70,
                              height: 73,
                            ),

                            SizedBox(width: 10),
                            Expanded(
                              child: ListTile(
                                title: Text("Tilte".tr,
                                    style: TextStyle(
                                        color: MyColors.color2,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Almarai')),
                                subtitle: Text("text",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 7, 66, 73),
                                        fontSize: 11,
                                        fontFamily: 'Almarai')),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Text("2/4/2022",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                        fontFamily: 'Almarai')),
                              ),
                              decoration: BoxDecoration(
                                color: MyColors.color1,
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  bottomLeft: Radius.circular(4.0),
                                ),
                              ),
                              width: 40,
                              height: 73,
                            ),

                            //const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
