
  import 'dart:collection';

  import 'package:flutter/cupertino.dart';

  class CategoryList extends ChangeNotifier{
    List<String> _categoryList = ['Main Dish','Drink', 'Soup', 'Starter'];

    UnmodifiableListView get categoryList => UnmodifiableListView(_categoryList);

    void addNewCategory(String newCategory){
      _categoryList.add(newCategory);
      notifyListeners();
    }

  }