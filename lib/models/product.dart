import 'dart:convert';

import 'package:amazon_clone/models/rating.dart';

class Product {
  final String name;
  final String description;
  final num price;
  final num quantity;
  final String category;
  final List<String> images;
  final String? id;
  final List<Rating>? rating;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.images,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
      'rating': rating,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0.0,
      quantity: map['quantity'] ?? 0.0,
      category: map['category'] ?? '',
      images: List<String>.from(map['images']),
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
