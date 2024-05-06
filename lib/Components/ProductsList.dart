import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//widget for the product row having image, name, price, rating and favorite icon
class ProductRow extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final int? price;
  final double? rating;
  final bool isFavorite;
  final Function()? onFavoriteTap;

  ProductRow({
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),

      //border with opacity 0.5
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl!),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  name!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      '\$ ${price!.toString()}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    SizedBox(width: 5),
                   IconButton(onPressed: (){
                      onFavoriteTap!(

                      );
                   },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: 20,
                       )
                      )
                  ],
                ),

                Row(
                  children: [
                    Text(
                      rating!.toString(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    RatingBarIndicator(
                      rating: rating!,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
