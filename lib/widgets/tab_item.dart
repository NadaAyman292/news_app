// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/models/sourse_response_model.dart';

class TabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabItem({Key? key, required this.sources, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.green)),
        child: Text(
          sources.name ?? "",
          style: TextStyle(color: isSelected ? Colors.white : Colors.green),
        ));
  }
}
