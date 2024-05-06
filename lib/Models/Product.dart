
//product model having name, price, rating, brand, category, image, gallery images, stock,description,

class Product {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final double? rating;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;
  final int? stock;


  Product({
     this.id,
     this.name,
     this.price,
     this.rating,
     this.brand,
     this.category,
     this.thumbnail,
     this.images,
     this.stock,
     this.description,
  });

  //FromJson method to convert json to product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      price: json['price'],
      rating: json['rating'].toDouble(),
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
      stock: json['stock'],
      description: json['description'],
    );
  }

  //toJson method to convert product object to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'rating': rating,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
      'stock': stock,
      'description': description,
    };
  }

}
