import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/features/products/domain/usecases/get_product_use_case.dart';
import 'package:kindred_mobile/features/products/presentation/bloc/single_product/single_product_event.dart';
import 'package:kindred_mobile/features/products/presentation/bloc/single_product/single_product_state.dart';

@injectable
class SingleProductBloc extends Bloc<SingleProductEvent, SingleProductState> {
  final GetProductUseCase _getProductUseCase;

  SingleProductBloc(this._getProductUseCase) : super(const SingleProductLoadingState()) {
    on<GetSingleProduct>(onGetSingleProduct);
  }
  void onGetSingleProduct(GetSingleProduct event, Emitter<SingleProductState> emit) async {
    final dataState = await _getProductUseCase(params: event.id);

    if (dataState is DataSuccess && dataState.data != null) {
      print('successed');
      print(dataState.data);
      emit(SingleProductLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      print('successed');
      print(dataState.exception!.message);
      emit(SingleProductErrorState(dataState.exception!));
    }
  }
}
