import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Core/services/Api_repository.dart';
import '../../Model/product_detail_wrapper.dart';
import '../../Model/produkList_wrapper.dart';

part 'produk_event.dart';
part 'produk_state.dart';

class ProdukBloc extends Bloc<ProdukEvent, ProdukState> {
  late List<ProdukListWrapper>? prodList = [];
  late ProductDetailWrapper prodDetail = ProductDetailWrapper();

  ProdukBloc() : super(ProdukInitial()) {
    on<ProdukEvent>((event, emit) async {
      await mapEventToStates(event, emit);
    });
  }

  Future<void> mapEventToStates(
      ProdukEvent event, Emitter<ProdukState> emit
      ) async {

    if (event is getDataProduk){
      List<ProdukListWrapper> response = await ApiRepository.getProdukByCategory(event.produkId);
      prodList = response;
      emit(GetProductInitial(produkListWrapper: prodList ?? []));
    }

    if (event is getDataDetailProduct){
      ProductDetailWrapper response = await ApiRepository.getProductDetailData(event.produkId);
      prodDetail = response;
      emit(GetProductDetailInitial(prodDetail: prodDetail));
    }

    if (event is ProductCheckout){

    }

  }
}
