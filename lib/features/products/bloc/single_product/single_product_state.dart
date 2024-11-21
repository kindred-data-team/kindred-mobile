import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:kindred_mobile/common/exceptions/api_exception.dart';
import 'package:kindred_mobile/features/products/data/models/single_products_model.dart';

abstract class SingleProductState extends Equatable {
  final SingleProductsModel? product;
  final ApiException? exception;

  const SingleProductState({this.product, this.exception});

  @override
  List<Object> get props => [product!, exception ?? DioException(requestOptions: RequestOptions(data: []))];
}

class SingleProductLoadingState extends SingleProductState {
  const SingleProductLoadingState();
}

class SingleProductLoadedState extends SingleProductState {
  const SingleProductLoadedState(SingleProductsModel product) : super(product: product);
}

class SingleProductErrorState extends SingleProductState {
  const SingleProductErrorState(ApiException exception) : super(exception: exception);
}
