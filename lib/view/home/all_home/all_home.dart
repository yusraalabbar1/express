import 'package:express/utilits/colors.dart';
import 'package:express/view/home/all_home/most_popular.dart';
import 'package:express/view/home/all_home/productes/new_product.dart';
import 'package:express/view/home/all_home/page_view.dart';
import 'package:express/view/home/all_home/search_widget.dart';
import 'package:flutter/material.dart';

class allHome extends StatefulWidget {
  allHome({Key? key}) : super(key: key);

  @override
  State<allHome> createState() => _allHomeState();
}

class _allHomeState extends State<allHome> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: ListView(
          shrinkWrap: true,
          children: [
            // searchWidget(),
            SizedBox(
              height: 10,
            ),
            Carousel(),
            newProduct(),
            mostPopular(),
          ],
        ),
      ),
    );
  }
}
