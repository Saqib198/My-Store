import 'package:flutter/material.dart';
import 'package:mystore/Components/AppBar.dart';
import 'package:mystore/Components/ProductCard.dart';
import 'package:provider/provider.dart';
import '../../APIs/Api.dart';
import '../../APIs/GetData.dart';
import '../../Constant/String.dart';
import '../../Components/SearchBar.dart';
import '../../Models/Product.dart';
import '../../Providers/ProductsProvider.dart';
import 'ProductDetail.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    _productsFuture = getProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Products',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          CustomSearchBar(
            hintText: 'Search Products',
            onChanged: (value) {
              Provider.of<ProductsProvider>(context, listen: false)
                  .searchProducts(value);
            },
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text('${Provider.of<ProductsProvider>(context).filteredProducts.length} '
                'Products Found',

                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],

                )),
          ),

          // Products View
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<Product> products = snapshot.data!;
                  return Consumer<ProductsProvider>(
                    builder: (context, provider, _) {
                      products = provider.filteredProducts;
                      if (products.isEmpty) {
                        return Center(child: Text('No products found'));
                      } else {
                        return ListView.builder(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to Product Detail Screen and pass the product data
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetail(product: products[index]),
                                  ),
                                );
                              },
                              child: ProductCard(
                                image: products[index].thumbnail!,
                                name: products[index].name!,
                                price: products[index].price!,
                                rating: products[index].rating!.toDouble(),
                                brand: products[index].brand!,
                                category: products[index].category!,
                              ),
                            );
                          },
                        );
                      }
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
