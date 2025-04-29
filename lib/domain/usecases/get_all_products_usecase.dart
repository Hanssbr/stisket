import '../../data/model/products_model.dart';
import '../repositories/products_repository.dart';

class GetAllProductsUsecase {
  final ProductsRepository repository;

  GetAllProductsUsecase(this.repository);
  Future<List<Products>> call() => repository.getProducts();
}