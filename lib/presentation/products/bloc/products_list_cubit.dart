import 'package:flutter_marketplace_example/presentation/products/bloc/products_list_state.dart';
import 'package:flutter_marketplace_example/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/domain/usecases/products/products_usecase.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  ProductsListCubit() : super(ProductsListLoading());

  Future<void> getProducts({int offset = 0, int limit = 10}) async {
    try {
      final returnedProducts = await sl<GetProductsUsecase>().call(
        params: GetProductsParams(offset: offset, limit: limit),
      );
      returnedProducts.fold(
        (l) => emit(ProductsListLoadFailed(l)),
        (r) => emit(ProductsListLoaded(r)),
      );
    } catch (e) {
      emit(ProductsListLoadFailed(e.toString()));
    }
  }
}
