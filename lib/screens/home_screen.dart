import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categories_tab.dart';
import 'package:news_app/screens/drawer_tab.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/widgets/tab_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  HomeScreen({super.key});
  bool isSettingsScreen = false;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage("assets/images/bg_image.png")),
      ),
      child: Scaffold(
        drawer: DrawerTab(
          onClicked: onDrwerClick,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          iconTheme: const IconThemeData(color: Colors.white, size: 35),
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          title: widget.isSettingsScreen
              ? const Text(
                  "Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                )
              : const Text(
                  "News",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
        ),
        body: widget.isSettingsScreen
            ? SettingsScreen()
            : selectedCategory == null
                ? CategoriesTab(
                    onClicked: onCategorySelected,
                  )
                : TabBarWidget(
                    id: selectedCategory!.id,
                  ),
      ),
    );
  }

  CategoryModel? selectedCategory = null;
  onCategorySelected(cat) {
    selectedCategory = cat;
    widget.isSettingsScreen = false;
    setState(() {});
  }

  onDrwerClick(id) {
    if (id == DrawerTab.CATEGORY_ID) {
      selectedCategory = null;
      widget.isSettingsScreen = false;
      Navigator.pop(context);
    } else if (id == DrawerTab.SETTINGS_ID) {
      selectedCategory = null;

      widget.isSettingsScreen = true;
      Navigator.pop(context);
    }
    setState(() {});
  }
}
