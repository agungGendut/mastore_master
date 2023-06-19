part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetProfileUser extends ProfileEvent {}

class GetProfileData extends ProfileEvent {}

class GetProfileProvince extends ProfileEvent {}

class GetProfileKabupaten extends ProfileEvent {
  final String idProvince;
  GetProfileKabupaten(this.idProvince);
}

class GetProfileKecamatan extends ProfileEvent {
  final String idKabupaten;
  GetProfileKecamatan(this.idKabupaten);
}

class GetProfileKurir extends ProfileEvent {
  final String idPenjual;
  GetProfileKurir(this.idPenjual);
}

class GetProfileJasaKurir extends ProfileEvent {
  final String idKabupatenAsal;
  final String idKecamatanTujuan;
  final String jenisKurir;
  final String? berat;
  GetProfileJasaKurir(this.idKabupatenAsal, this.idKecamatanTujuan, this.jenisKurir, this.berat);
}
