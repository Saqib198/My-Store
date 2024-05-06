
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mystore/Providers/CategoryProvider.dart';
import 'package:provider/provider.dart';

import '../Constant/String.dart';
import '../Models/Product.dart';
import '../Providers/ProductsProvider.dart';
import 'Api.dart';


//get all products from API
Future<List<Product>> getProducts(BuildContext context) async {
  // Get products from API
  final response = await CallApi().getData('$productsUrl');

  if (response.statusCode == 200) {
    final List<dynamic> productsData = json.decode(response.body)['products'];
    List<Product> productsList = productsData.map((data) => Product.fromJson(data)).toList();
    Provider.of<ProductsProvider>(context, listen: false).setProducts(productsList);
    return productsList;

  } else {
    throw Exception('Failed to load products');
  }
}



Future<List<String>> getCategories(BuildContext context) async {
  // Get categories from API
  final response = await CallApi().getData('$categoriesUrl');

  if (response.statusCode == 200) {
    final List<dynamic> categoriesData = json.decode(response.body);
    List<String> categoriesList = List<String>.from(categoriesData);
    Provider.of<CategoriesProvider>(context, listen: false).setCategories(categoriesList);
    return categoriesList;
  } else {
    throw Exception('Failed to load categories');
  }
}
