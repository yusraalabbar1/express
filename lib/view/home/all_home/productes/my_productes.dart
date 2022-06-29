// import 'package:express/utilits/colors.dart';
// import 'package:express/view/home/all_home/search_widget.dart';
// import 'package:express/view/home/myHome/dataCate.dart';
// import 'package:express/view/home/widget/appbar_widget.dart';
// import 'package:express/view/widget_style/style_main.dart';
// import 'package:flutter/material.dart';

// class myProductes extends StatefulWidget {
//   myProductes({Key? key}) : super(key: key);

//   @override
//   State<myProductes> createState() => _myProductesState();
// }

// class _myProductesState extends State<myProductes> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         appBar: subappbar_Widget(_scaffoldKey, context, "My Productes"),
//         body: Stack(
//           children: [
//             containerMaine(),
//             Container(
//               decoration: boxDecorationMain(),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   children: [
//                     searchWidget(),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Expanded(
//                       child: GridView.builder(
//                           gridDelegate:
//                               const SliverGridDelegateWithMaxCrossAxisExtent(
//                                   maxCrossAxisExtent: 200,
//                                   childAspectRatio: 3 / 2,
//                                   crossAxisSpacing: 20,
//                                   mainAxisSpacing: 20),
//                           itemCount: myProducts.length,
//                           itemBuilder: (BuildContext ctx, index) {
//                             return InkWell(
//                               onTap: () {
//                                 Navigator.of(context)
//                                     .pushNamed("particularProducte");
//                               },
//                               child: Container(
//                                   alignment: Alignment.center,
//                                   //child: Text(myProducts[index]["name"]),
//                                   decoration: BoxDecoration(
//                                       color: MyColors.new4,
//                                       borderRadius: BorderRadius.circular(15)),
//                                   child: Row(
//                                     children: [
//                                       Expanded(
//                                         flex: 3,
//                                         child: Column(
//                                           children: [
//                                             Expanded(
//                                               flex: 3,
//                                               child: Container(
//                                                   decoration: BoxDecoration(
//                                                       shape: BoxShape.rectangle,
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                               topLeft: Radius
//                                                                   .circular(
//                                                                       15.0),
//                                                               bottomRight: Radius
//                                                                   .circular(
//                                                                       15.0)),
//                                                       image: DecorationImage(
//                                                           fit: BoxFit.cover,
//                                                           image: NetworkImage(
//                                                               myProducts[index]
//                                                                   ["image"])))),
//                                             ),
//                                             Expanded(
//                                                 flex: 2,
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       child: Text(
//                                                         myProducts[index]
//                                                             ["name"],
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       child: Text(
//                                                         "2000",
//                                                         style: TextStyle(
//                                                             color:
//                                                                 Colors.white),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                       Expanded(
//                                           child: Column(
//                                         children: [
//                                           IconButton(
//                                               icon: Icon(
//                                                 Icons.shopping_cart,
//                                                 color: Colors.white,
//                                                 size: 25,
//                                               ),
//                                               onPressed: () {
//                                                 //notification
//                                                 // Navigator.of(context).pushNamed("notification");
//                                               }),
//                                           IconButton(
//                                               icon: Icon(
//                                                 Icons.favorite_border,
//                                                 color: Colors.pink,
//                                                 size: 25,
//                                               ),
//                                               onPressed: () {
//                                                 //notification
//                                                 // Navigator.of(context).pushNamed("notification");
//                                               }),
//                                         ],
//                                       ))
//                                     ],
//                                   )),
//                             );
//                           }),
//                     )
//                   ],
//                 )),
//           ],
//         ));
//   }
// }
