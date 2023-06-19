part of 'produk_bloc.dart';

@immutable
abstract class ProdukState {}

class ProdukInitial extends ProdukState {}

class GetProductInitial extends ProdukState {
  final List<ProdukListWrapper> produkListWrapper;
  GetProductInitial({required this.produkListWrapper});
}

class GetProductDetailInitial extends ProdukState {
  final ProductDetailWrapper prodDetail;
  GetProductDetailInitial({required this.prodDetail});
}
