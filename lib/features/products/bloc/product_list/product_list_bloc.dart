import 'package:bloc/bloc.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/features/products/bloc/product_list/product_list_event.dart';
import 'package:kindred_mobile/features/products/bloc/product_list/product_list_state.dart';
import 'package:kindred_mobile/features/products/data/repository/product_repository.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(const ProductListLoadingState()) {
    on<GetProductList>(onGetProductList);
  }
  void onGetProductList(GetProductList event, Emitter<ProductListState> emit) async {
    final ProductRepository sampleProductRepository = ProductRepository();
    final dataState = await sampleProductRepository.getProductList(event.limit, event.skip);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProductListLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(ProductListErrorState(dataState.exception!));
    }
  }
}
