part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeMenuData extends HomeEvent{}

class GetCategoryMenuData extends HomeEvent {}

class GetProductSearch extends HomeEvent {
  final String productSearch;
  GetProductSearch(this.productSearch);
}

class GetProdukListData extends HomeEvent {
  final int produkId;
  GetProdukListData(this.produkId);
}

class SearchProductReset extends HomeEvent {}
