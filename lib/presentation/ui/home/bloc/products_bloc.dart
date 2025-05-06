import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_all_products_usecase.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  ProductsBloc(this.getAllProductsUsecase) : super(ProductsInitial()) {
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
  }
}
