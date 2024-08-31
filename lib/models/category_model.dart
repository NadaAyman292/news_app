// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String image;
  String name;
  Color color;
  CategoryModel({
    required this.id,
    required this.image,
    required this.name,
    required this.color,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          id: "business",
          image: "assets/images/bussines.png",
          name: "Business",
          color: Color(0xffCF7E48)),
      CategoryModel(
          id: "sports",
          image: "assets/images/sports.png",
          name: "Sports",
          color: Colors.red),
      CategoryModel(
          id: "entertainment",
          image: "assets/images/Politics.png",
          name: "Entertainment",
          color: Color(0xff003E90)),
      CategoryModel(
          id: "health",
          image: "assets/images/health.png",
          name: "Health",
          color: Colors.pink),
      CategoryModel(
          id: "science",
          image: "assets/images/science.png",
          name: "Science",
          color: Colors.yellowAccent),
      CategoryModel(
          id: "technology",
          image: "assets/images/environment.png",
          name: "Technology",
          color: Colors.green),
      CategoryModel(
          id: "general",
          image: "assets/images/Politics.png",
          name: "General",
          color: Color(0xff003E90)),
    ];
  }
}
