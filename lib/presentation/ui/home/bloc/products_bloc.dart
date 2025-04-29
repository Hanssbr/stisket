import 'package:bloc/bloc.dart';

import '../../../../domain/usecases/get_all_products_usecase.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllProductsUsecase getAllProductsUsecase;
  ProductsBloc(this.getAllProductsUsecase) : super(ProductsInitial()) {
    on<GetAllProductsEvent>((event, emit) {
      emit(ProductsLoading());
      getAllProductsUsecase.call().then((products) {
        emit(ProductsLoaded(products));
      });
    });
  }
}
