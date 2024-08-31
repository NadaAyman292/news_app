import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  Function onClicked;
  CategoriesTab({super.key, required this.onClicked});
  List<CategoryModel> categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const Text(
            "Pick your category of interest",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 33,
              color: Color(0xff4F5A69),
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onClicked(categories[index]);
                    },
                    child: CategoryItem(
                      isOdd: index.isOdd,
                      categoryModel: categories[index],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
