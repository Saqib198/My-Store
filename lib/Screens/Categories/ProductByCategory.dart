import 'package:flutter/material.dart';
import 'package:mystore/Components/AppBar.dart';
import 'package:mystore/Components/ProductCard.dart';
import 'package:provider/provider.dart';
import '../../APIs/GetData.dart';
import '../../Components/SearchBar.dart';
import '../../Models/Product.dart';
import '../../Providers/ProductsProvider.dart';
import '../Products/ProductDetail.dart';

class ProductByCategory extends StatefulWidget {
  final String category;
  ProductByCategory({Key? key, required this.category}) : super(key: key);

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {

  @override
  void initState() {
    getProducts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.category,
        isBack: true,
        onBackTap: () {
          Navigator.pop(context);
        },
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
            child: Text('${Provider.of<ProductsProvider>(context).filteredProducts.where((element) =>
                element.category!.toLowerCase() == widget.category.toLowerCase()).toList().length} '
                'Products Found',

                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],

                )),
          ),
          // Products List
          Expanded(
            child: Consumer<ProductsProvider>(
              builder: (context, provider, _) {
                // Get filtered products
                List<Product> filteredProducts = provider.filteredProducts.where((element) =>
                    element.category!.toLowerCase() == widget.category.toLowerCase()).toList();
                return ListView.builder(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {

                    return GestureDetector(
                      onTap: () {
                        // Navigate to Product Detail Screen and pass the product data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              product: filteredProducts[index],
                            ),
                          ),
                        );
                      },
                      child: ProductCard(
                        image: filteredProducts[index].thumbnail!,
                        name: filteredProducts[index].name!,
                        price: filteredProducts[index].price!,
                        brand: filteredProducts[index].brand!,
                        category: filteredProducts[index].category!,
                        rating: filteredProducts[index].rating!.toDouble(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
