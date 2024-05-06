import 'package:flutter/material.dart';
import '../Models/Product.dart';

class ProductsProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  // Method to set the products
  void setProducts(List<Product> products) {
    _products = products;
    _filteredProducts =
        products; // Initially set filtered products same as all products
    notifyListeners();
  }

  // Getter to access the products
  List<Product> get products => _products;

  // Getter to access the filtered products
  List<Product> get filteredProducts => _filteredProducts;

  // Method to search and filter products by category and search query
  void searchProducts( String query) {
    _filteredProducts = _products.where((product) {
      return
          (product.name!.toLowerCase().contains(query.toLowerCase()) ||
              product.description!
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              product.brand!.toLowerCase().contains(query) ||
              product.category!.toLowerCase().contains(query.toLowerCase()));
    }).toList();
    notifyListeners();
  }


}
