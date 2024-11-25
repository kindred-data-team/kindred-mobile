import 'dart:io';

import 'package:kindred_app/common/exceptions/api_exception.dart';
import 'package:kindred_app/core/data/resources/data_state.dart';
import 'package:kindred_app/features/doctor/products/data/models/product_list_model.dart';
import 'package:kindred_app/features/doctor/products/data/models/single_products_model.dart';
import 'package:kindred_app/features/doctor/products/data/service/products_service.dart';

class ProductRepository {
  final _provider = ProductsService();

  Future<DataState<List<ProductsListModel>>> getProductList(
    int limit,
    int skip,
  ) async {
    try {
      final response = await _provider.getAllProducts(limit, skip);

      if (response.statusCode == HttpStatus.ok) {
        List<ProductsListModel> res = (response.data['products'] as List)
            .map((e) => ProductsListModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return DataSuccess(res);
      } else {
        return DataFailed(ApiException(
          message: response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState<SingleProductsModel>> getSingleProduct(
    int id,
  ) async {
    try {
      final response = await _provider.getSingleProduct(id);
      if (response.statusCode == HttpStatus.ok) {
        SingleProductsModel res =
            SingleProductsModel.fromJson(response.data as Map<String, dynamic>);

        return DataSuccess(res);
      } else {
        return DataFailed(ApiException(
          message: response.statusMessage ?? '',
        ));
      }
    } on ApiException catch (e) {
      return DataFailed(e);
    }
  }
}
