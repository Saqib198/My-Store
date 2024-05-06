import 'package:flutter/material.dart';
import '../Models/Product.dart';

class FavouriteProvider extends ChangeNotifier {
  List<Product> _favorites = [];
  List<Product> _filteredFavorites = [];

  List<Product> get favorites => _filteredFavorites.isEmpty ? _favorites : _filteredFavorites;

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }

  void addToFavorites(Product product) {
    _favorites.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    _favorites.remove(product);
    notifyListeners();
  }

  void searchFavourites(String query) {
    _filteredFavorites = _favorites.where((product) =>
    product.name!.toLowerCase().contains(query.toLowerCase()) ||
        product.description!.toLowerCase().contains(query.toLowerCase()) ||
        product.brand!.toLowerCase().contains(query.toLowerCase()) ||
        product.category!.toLowerCase().contains(query.toLowerCase())
    ).toList();
    notifyListeners();
  }

  void clearSearch() {
    _filteredFavorites.clear();
    notifyListeners();
  }
}
