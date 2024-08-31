import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  Function onClicked;
  DrawerTab({super.key, required this.onClicked});
  static const int CATEGORY_ID = 1;
  static const int SETTINGS_ID = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.green,
            child: const Center(
              child: Text(
                "News App",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onClicked(CATEGORY_ID);
            },
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                onClicked(SETTINGS_ID);
              },
              child: Text("Settings", style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
