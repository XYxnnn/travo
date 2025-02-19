import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;

  CategoryModel({
    required this.name,
    required this.iconPath
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(
            name: 'Landmark',
            iconPath: 'assets/icons/landmark.svg',
        )
    );

    categories.add(
        CategoryModel(
            name: 'Nature',
            iconPath: 'assets/icons/nature.svg',
        )
    );

    categories.add(
        CategoryModel(
            name: 'Amusement',
            iconPath: 'assets/icons/ferriswheel.svg',
        )
    );

    categories.add(
        CategoryModel(
            name: 'Shopping',
            iconPath: 'assets/icons/shopping.svg',
        )
    );

    categories.add(
        CategoryModel(
            name: 'Exercise',
            iconPath: 'assets/icons/exercise.svg',
        )
    );

    return categories;
  }
}