import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kindred_app/common/exceptions/api_exception.dart';
import 'package:kindred_app/features/doctor/products/data/models/product_list_model.dart';

abstract class ProductListState extends Equatable {
  final List<ProductsListModel>? products;
  final ApiException? exception;

  const ProductListState({this.products, this.exception});

  @override
  List<Object> get props => [
        products ?? [],
        exception ?? DioException(requestOptions: RequestOptions(data: []))
      ];
}

class ProductListLoadingState extends ProductListState {
  const ProductListLoadingState();
}

class ProductListLoadedState extends ProductListState {
  const ProductListLoadedState(List<ProductsListModel> products)
      : super(products: products);
}

class ProductListErrorState extends ProductListState {
  const ProductListErrorState(ApiException exception)
      : super(exception: exception);
}
