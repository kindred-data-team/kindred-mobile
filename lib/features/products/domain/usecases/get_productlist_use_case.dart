import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/core/data/usecases/usecase.dart';
import 'package:kindred_mobile/features/products/domain/entities/product_list_entity.dart';
import 'package:kindred_mobile/features/products/domain/repository/product_repository.dart';

@lazySingleton
class GetProductListUseCase implements Usecase<DataState<List<ProductListEntity>>, GetProductListParams?> {
  final ProductRepository _productRepository;

  GetProductListUseCase(this._productRepository);

  @override
  Future<DataState<List<ProductListEntity>>> call({GetProductListParams? params}) {
    return _productRepository.getProductList(params?.limit ?? 10, params?.skip ?? 1);
  }
}

class GetProductListParams {
  final int? skip;
  final int? limit;
  const GetProductListParams({this.skip, this.limit});
}
