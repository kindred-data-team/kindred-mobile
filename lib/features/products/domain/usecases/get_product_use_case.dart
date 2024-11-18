import 'package:injectable/injectable.dart';
import 'package:kindred_mobile/core/data/resources/data_state.dart';
import 'package:kindred_mobile/core/data/usecases/usecase.dart';
import 'package:kindred_mobile/features/products/domain/entities/product_entity.dart';
import 'package:kindred_mobile/features/products/domain/repository/product_repository.dart';

@lazySingleton
class GetProductUseCase implements Usecase<DataState<ProductEntity>, int?> {
  final ProductRepository _productRepository;

  GetProductUseCase(this._productRepository);

  @override
  Future<DataState<ProductEntity>> call({int? params}) {
    return _productRepository.getSingleProduct(params ?? 1);
  }
}
