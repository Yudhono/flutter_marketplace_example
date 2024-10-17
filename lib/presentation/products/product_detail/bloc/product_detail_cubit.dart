import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_marketplace_example/domain/usecases/products/get_one_product_usecase.dart';
import 'package:flutter_marketplace_example/presentation/products/product_detail/bloc/product_detail_state.dart';
import 'package:flutter_marketplace_example/service_locator.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailLoading());

  Future<void> getProductDetail(int id) async {
    try {
      final returnedProductDetail =
          await sl<GetOneProductUsecase>().call(params: id);
      returnedProductDetail.fold(
        (l) => emit(ProductDetailLoadFailed(l.toString())),
        (r) => emit(ProductDetailLoaded(r)),
      );
    } catch (e) {
      emit(ProductDetailLoadFailed(e.toString()));
    }
  }
}
