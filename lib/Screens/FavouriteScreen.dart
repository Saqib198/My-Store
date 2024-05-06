import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Components/AppBar.dart';
import '../Components/ProductsList.dart';
import '../Components/SearchBar.dart';
import '../Models/Product.dart';
import '../Providers/FavouriteProvider.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Favourites',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchBar(
          hintText: 'Search Favourites',
          onChanged: (value) {
            Provider.of<FavouriteProvider>(context, listen: false)
                .searchFavourites(value);
          },

        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text('${Provider.of<FavouriteProvider>(context).favorites.length} '
              'Favourites Found',

              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[600],

              )),
        ),

        // Favourite Products List
        Expanded(
          child: Consumer<FavouriteProvider>(
            builder: (context, provider, _) {
              List<Product> products = provider.favorites;
              if (products.isEmpty) {
                return Center(child: Text('No Favourite Products'));
              } else {
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return ProductRow(
                      imageUrl: product.thumbnail,
                      name: product.name,
                      price: product.price,
                      rating: product.rating,
                      isFavorite: true,
                      onFavoriteTap: () {
                        //checl if product is already in favourite
                        if (provider.isFavorite(product)) {
                          provider.removeFromFavorites(product);
                        } else {
                          provider.addToFavorites(product);
                        }
                      },
                    );
                  },
                );
              }
            },
          ),
        ),

      ],
      ),
    );
  }
}
