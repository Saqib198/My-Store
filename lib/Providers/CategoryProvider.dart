
import 'package:flutter/foundation.dart';
import 'package:mystore/APIs/GetData.dart';

class CategoriesProvider extends ChangeNotifier {
  List<String> _categories = [];
  List<String> _filteredCategories = [];

  List<String> get categories => _categories;

  void setCategories(List<String> categories) {
    _categories = categories;
    _filteredCategories = categories;
    notifyListeners();
  }

  List<String> get filteredCategories => _filteredCategories;



  void filterCategories(String query) {
    if (query.isEmpty) {
      _filteredCategories = _categories;
    } else {
      _filteredCategories = _categories.where((category) => category.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }
}
