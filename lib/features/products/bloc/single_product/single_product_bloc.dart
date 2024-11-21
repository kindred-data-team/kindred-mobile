import 'package:bloc/bloc.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/features/products/bloc/single_product/single_product_event.dart';
import 'package:kindred_mobile/features/products/bloc/single_product/single_product_state.dart';
import 'package:kindred_mobile/features/products/data/repository/product_repository.dart';

class SingleProductBloc extends Bloc<SingleProductEvent, SingleProductState> {
  SingleProductBloc() : super(const SingleProductLoadingState()) {
    on<GetSingleProduct>(onGetSingleProduct);
  }
  void onGetSingleProduct(GetSingleProduct event, Emitter<SingleProductState> emit) async {
    final ProductRepository sampleProductRepository = ProductRepository();
    final dataState = await sampleProductRepository.getSingleProduct(event.id);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(SingleProductLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(SingleProductErrorState(dataState.exception!));
    }
  }
}
