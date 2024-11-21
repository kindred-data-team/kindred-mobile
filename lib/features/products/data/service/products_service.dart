import 'package:dio/dio.dart';
import 'package:kindred_mobile/core/data/api/api.dart';

class ProductsService {
  Future<Response> getAllProducts(final int limit, final int skip) async {
    Response response;
    response = await Api.dioOptions.get('/products?limit=$limit&skip=$skip');
    return response;
  }

  Future<Response> getSingleProduct(int id) async {
    Response response;
    response = await Api.dioOptions.get('/products/$id');
    return response;
  }
}
