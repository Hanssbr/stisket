import '../repositories/products_repository.dart';

class DeleteProductUsecase {
  final ProductsRepository repository;
  DeleteProductUsecase(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteProducts(id);
  }
}