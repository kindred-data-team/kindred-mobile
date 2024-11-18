import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/features/products/domain/entities/product_entity.dart';
import 'package:kindred_mobile/features/products/domain/entities/product_list_entity.dart';

abstract class ProductRepository {
  Future<DataState<ProductEntity>> getSingleProduct(int id);
  Future<DataState<List<ProductListEntity>>> getProductList(int limit, int skip);
}
