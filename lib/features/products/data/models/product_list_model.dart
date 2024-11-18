import 'package:kindred_mobile/features/products/domain/entities/product_list_entity.dart';

class ProductListModel extends ProductListEntity {
  const ProductListModel({
    super.id,
    super.title,
    super.price,
    super.thumbnail,
    super.stock,
    super.discountPercentage,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> map) {
    return ProductListModel(
      id: map["id"] ?? 1,
      title: map['title'] ?? "",
      price: map['price'] ?? 0.0,
      thumbnail: map['thumbnail'] ?? "",
      stock: map['stock'] ?? 0,
      discountPercentage: map['discountPercentage'].runtimeType == int
          ? int.parse(map['discountPercentage'].toString()).toDouble()
          : map['discountPercentage'] ?? 0.0,
    );
  }
}
