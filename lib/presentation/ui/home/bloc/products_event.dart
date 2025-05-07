abstract class ProductsEvent {}

class GetAllProductsEvent extends ProductsEvent {}

class DeleteProductsEvent extends ProductsEvent {
  final String id;

  DeleteProductsEvent(this.id);
}
