part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileUnitial extends ProfileState {}

class UserProfileGetData extends ProfileState {
  final UserLoginWrapper? userLoginData;
  UserProfileGetData({this.userLoginData});
}

class AddressGetData extends ProfileState {
  final List<Province>? provinceData;
  final List<Kabupaten>? kabupatenData;
  final List<Kecamatan>? kecamatanData;
  AddressGetData({this.provinceData, this.kabupatenData, this.kecamatanData});
}

class KurirGetData extends ProfileState{
  final List<ListKurir>? kurirList;
  final List<JasaPengiriman>? jenisJasa;
  KurirGetData({this.kurirList, this.jenisJasa});
}

class ProfileMenuData extends ProfileState{
  final List<ResultMenu>? profileMenu;
  ProfileMenuData({this.profileMenu});
}
