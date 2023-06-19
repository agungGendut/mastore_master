part of 'produk_bloc.dart';

@immutable
abstract class ProdukEvent {}

class getDataProduk extends ProdukEvent {
  final int produkId;
  getDataProduk(this.produkId);
}

class getDataDetailProduct extends ProdukEvent {
  final int produkId;
  getDataDetailProduct(this.produkId);
}

class ProductCheckout extends ProdukEvent {
  final int idProduct;
  final int hrgProduct;
  final int jumlahProduct;
  ProductCheckout(this.idProduct, this.jumlahProduct, this.hrgProduct);
}
