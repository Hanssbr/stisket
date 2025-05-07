import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/delete_product_usecase.dart';
import '../../../../domain/usecases/get_all_products_usecase.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final DeleteProductUsecase deleteProductUsecase;
  final GetAllProductsUsecase getAllProductsUsecase;
  ProductsBloc(this.getAllProductsUsecase, this.deleteProductUsecase)
      : super(ProductsInitial()) {
    // on<GetAllProductsEvent>((event, emit) {
    //   emit(ProductsLoading());
    //   getAllProductsUsecase.call().then((products) {
    //     emit(ProductsLoaded(products));
    //   });
    // });

    on<GetAllProductsEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await getAllProductsUsecase.call();
        print(products.first.name);
        emit(ProductsLoaded(products));
      } catch (e) {
        emit(ProductsError(e.toString()));
      }
    });

    on<DeleteProductsEvent>((event, emit) async {
      try {
        await deleteProductUsecase.call(event.id);
        add(GetAllProductsEvent());
      } catch (e, stacktrace) {
        print('Error deleting product: $e');
        print('Stacktrace: $stacktrace');

        emit(ProductsError('Gagal menghapus produk'));
      }
    });
  }
}
