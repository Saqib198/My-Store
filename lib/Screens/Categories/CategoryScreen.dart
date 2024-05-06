import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mystore/APIs/GetData.dart';
import 'package:mystore/Components/AppBar.dart';
import 'package:mystore/Components/CategoryCard.dart';
import 'package:mystore/Components/SearchBar.dart';
import 'package:provider/provider.dart';

import '../../Providers/CategoryProvider.dart';
import 'ProductByCategory.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<String>> _categoriesFuture;
  @override
  void initState() {
    super.initState();
    _categoriesFuture = getCategories(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categories',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              hintText: 'Search categories',
              onChanged: (value) {
                // Update filtered categories when search query changes
                Provider.of<CategoriesProvider>(context, listen: false)
                    .filterCategories(value);
              },
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text('${Provider.of<CategoriesProvider>(context).filteredCategories.length} '
                  'Categories Found',

                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[600],

                  )),
            ),

            // GridView of categories
            FutureBuilder<List<String>>(
              future: _categoriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<String> categories = snapshot.data!;
                  return Consumer<CategoriesProvider>(
                    builder: (context, provider, _) {
                      categories = provider.filteredCategories;
                      if (categories.isEmpty) {
                        return Center(child: Text('No Category found'));
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: provider.filteredCategories.length,
                          itemBuilder: (context, index) {
                            final category = provider.filteredCategories[index];
                            return CategoryCard(
                              image: //if category is smartphone or laptop  then show smartphone and laptop image
                                  category.toLowerCase() == 'smartphones' ||
                                          category.toLowerCase() == 'laptops'
                                      ? 'assets/categories/${category.toLowerCase()}.jpg'
                                      : null,
                              title: category,
                              onTap: () {
                                // Navigate to ProductByCategory Screen and pass the category name
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductByCategory(category: category),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
