import 'package:flutter/material.dart';

// Custom Category Card
class CategoryCard extends StatelessWidget {
  final String? title;
  final String? image;
  final Function()? onTap;

  const CategoryCard({
    Key? key,
    this.title,
    this.image,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
              child:  //show image whose category name is title
      Image.asset(

        //if image is unable to load then show this image
        image == null ? 'assets/categories/others.jpg' : image!,
        fit: BoxFit.cover,
        height: 149,
        width: double.infinity,
      ),
            ),
            Positioned(
              bottom: 18,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  //first letter of category name is capital
                  title!.substring(0, 1).toUpperCase() + title!.substring(1),

                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
