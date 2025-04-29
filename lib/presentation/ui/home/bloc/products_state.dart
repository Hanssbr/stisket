import '../../../../data/model/products_model.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Products> products;

  ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final String message;
  ProductsError(this.message);
}