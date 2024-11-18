import 'package:kindred_mobile/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {super.id,
      super.title,
      super.description,
      super.category,
      super.price,
      super.discountPercentage,
      super.stock,
      super.tags,
      super.brand,
      super.sku,
      super.weight,
      super.dimensions,
      super.warrantyInformation,
      super.shippingInfomation,
      List<dynamic>? reviews,
      super.returnPolicy,
      super.minimumOrderQuantity,
      super.images,
      super.thumbnail});

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      category: map['category'] ?? "",
      price: map['price'] ?? 0,
      discountPercentage: map['discountPercentage'] ?? 0,
      stock: map['stock'] ?? 0,
      tags: map['tags'] ?? [],
      brand: map['brand'] ?? "",
      sku: map['sku'] ?? "",
      weight: map['weight'] ?? 0,
      dimensions: map['dimensions'] ?? {},
      warrantyInformation: map['warrantyInformation'] ?? "",
      shippingInfomation: map['shippingInformation'] ?? "",
      reviews: map['reviews'] ?? [],
      returnPolicy: map['returnPolicy'] ?? "",
      minimumOrderQuantity: map['minimumOrderQuantity'] ?? 0,
      images: map['images'] ?? [],
      thumbnail: map['thumbnail '] ?? "",
    );
  }
}

class ProductReview {
  final int? rating;
  final String? comment;
  final DateTime? date;
  final String? reviewerName;
  final String? reviewerEmail;

  ProductReview({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ProductReview.fromJson(Map<String, dynamic> json) {
    return ProductReview(
      rating: json['rating'],
      comment: json['comment'],
      date: DateTime.parse(json['date']),
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}
