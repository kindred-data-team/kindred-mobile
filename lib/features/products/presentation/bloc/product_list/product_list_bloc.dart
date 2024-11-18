import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/features/products/domain/usecases/get_productlist_use_case.dart';
import 'package:kindred_mobile/features/products/presentation/bloc/product_list/product_list_event.dart';
import 'package:kindred_mobile/features/products/presentation/bloc/product_list/product_list_state.dart';

@injectable
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductListUseCase _getProductListUseCase;

  ProductListBloc(this._getProductListUseCase) : super(const ProductListLoadingState()) {
    on<GetProductList>(onGetProductList);
  }
  void onGetProductList(GetProductList event, Emitter<ProductListState> emit) async {
    GetProductListParams params = GetProductListParams(limit: event.limit, skip: event.skip);
    final dataState = await _getProductListUseCase(params: params);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print('successed');
      print(dataState.data);
      emit(ProductListLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.exception!.message);
      emit(ProductListErrorState(dataState.exception!));
    }
  }
}
