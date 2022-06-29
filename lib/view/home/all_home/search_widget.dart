import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';

class searchWidget extends StatefulWidget {
  searchWidget({Key? key}) : super(key: key);

  @override
  State<searchWidget> createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            prefixIcon: Icon(
              Icons.search,
              color: MyColors.color3,
            ),
            hintText: 'search'),
        onChanged: (string) {
          // _onSearchFieldChanged(string);
        },
      ),
    );
  }
}
