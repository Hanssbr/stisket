import '../../data/model/products_model.dart';

abstract class ProductsRepository {
  Future<List<Products>> getProducts();
}