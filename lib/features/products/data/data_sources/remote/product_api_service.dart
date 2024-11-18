import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/features/products/data/models/product_list_model.dart';
import 'package:kindred_mobile/features/products/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'product_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class ProductsApiService {
  @factoryMethod
  factory ProductsApiService(Dio dio) = _ProductsApiService;

  @GET('/products')
  Future<HttpResponse<List<ProductListModel>>> getProductsList({
    @Query("limit") int? limit,
    @Query("skip") int? skip,
    @Query("select") String? select,
  });

  @GET('/products/{id}')
  Future<HttpResponse<ProductModel>> getSingleProduct({
    @Path("id") int? id,
  });
}
