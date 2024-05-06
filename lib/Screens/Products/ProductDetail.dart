import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mystore/Providers/FavouriteProvider.dart';
import 'package:provider/provider.dart';
import '../../Components/AppBar.dart';
import '../../Models/Product.dart';

class ProductDetail extends StatelessWidget {
  static const String routeName = '/productDetail';
  final Product product;

  const ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return
      Consumer<FavouriteProvider>(
        builder: (context, categoryProvider, _) {
      bool isFavorite = categoryProvider.isFavorite(product);
      return Scaffold(
      appBar: CustomAppBar(
        title: 'Product Detail',
        isBack: true,
        onBackTap: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(product.thumbnail!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Product Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Heart Button for Favourite
                  IconButton(
                    onPressed: () {
                      if (isFavorite) {
                        categoryProvider.removeFromFavorites(product);
                      } else {
                        categoryProvider.addToFavorites(product);
                      }
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Name: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.name!,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Price: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$ ${product.price!.toString()}',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Category: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.category!,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Brand: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.brand!,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Rating: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.rating!.toString(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: product.rating!,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 12.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
        Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Stock: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.stock!.toString(),
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
        
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
              child:
                  Text(
                    'Description: ',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              child:
                  Text(
                    product.description!,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
            ),
        
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
            child: Text(
              'Product Gallery: ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
        
            ),
        
            //List of Product Images
            Container(
              margin: EdgeInsets.all(8),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: product.images!.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 109,
                    margin: EdgeInsets.all(8),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/gif/loading.gif'
                      ),
                      image: NetworkImage(product.images![index]),
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            )
        
        
                ],
        
              ),
      ),





    );
        }
      );
}
}
