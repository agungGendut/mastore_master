part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetHomeMenuInitial extends HomeState{
  final DataData menuWrapper;
  final List<CategorysWrapper> cateGoryWrapper;
  final List<ProdukListWrapper> produkListWrapper;
  final List<ProdukListWrapper> produkSearch;
  GetHomeMenuInitial({required this.menuWrapper, required this.cateGoryWrapper, required this.produkListWrapper, required this.produkSearch});
}
