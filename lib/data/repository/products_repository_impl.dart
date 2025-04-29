import '../../domain/repositories/products_repository.dart';
import '../datasources/product_remote_datasource.dart';
import '../model/products_model.dart';

class ProductsRepositoryImpl implements ProductsRepository{
  final ProductRemoteDatasource remoteDatasource;
  ProductsRepositoryImpl(this.remoteDatasource);
  @override
  Future<List<Products>> getProducts() {
    return ProductRemoteDatasource().getProducts();
  }
  
}