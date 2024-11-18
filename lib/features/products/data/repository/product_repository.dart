import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/common/exceptions/api_exception.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/features/products/data/data_sources/remote/product_api_service.dart';
import 'package:kindred_mobile/features/products/data/models/product_model.dart';
import 'package:kindred_mobile/features/products/domain/entities/product_list_entity.dart';
import 'package:kindred_mobile/features/products/domain/repository/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductsApiService _productsApiService;

  ProductRepositoryImpl(this._productsApiService);

  @override
  Future<DataState<ProductModel>> getSingleProduct(int id) async {
    try {
      final httpResponse = await _productsApiService.getSingleProduct(
        id: id,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(ApiException(
          message: httpResponse.response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ProductListEntity>>> getProductList(
    int limit,
    int skip,
  ) async {
    try {
      final httpResponse = await _productsApiService.getProductsList(
        limit: limit,
        skip: skip,
        select: '''title,price,thumbnail,stock,discountPercentage''',
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(ApiException(
          message: httpResponse.response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }
}
