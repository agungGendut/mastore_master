import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
// import 'package:mastore/Bloc/Produk_bloc/produk_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/services/Api_repository.dart';
import '../../Model/address_model.dart';
import '../../Model/ekspedisi_model.dart';
import '../../Model/profile_menu_model.dart';
import '../../Model/userLogin_wrapper.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserLoginWrapper? dataUsers;
  List<Province>? provinceList;
  List<Kabupaten>? kabupatenList;
  List<Kecamatan>? kecamatanList;
  List<ListKurir>? kurirList;
  List<JasaPengiriman>? jenisJasa;

  var profileMenu = {
    "success": true,
    "message": "Get Profile List",
    "status_code": 200,
    "data": {
      "data": {
        "results": [
          {
            "id": 0,
            "tittle": "Pembelian"
          },
          {
            "id": 1,
            "tittle": "Profile"
          },
          {
            "id": 3,
            "tittle": "Data Bank"
          },
          {
            "id": 4,
            "tittle": "Keuangan"
          },
          {
            "id": 5,
            "tittle": "Wishlist"
          }
        ]
      }
    }
  };

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      await mapEventToStates(event, emit);
    });
  }

  Future<void> mapEventToStates(
      ProfileEvent event, Emitter<ProfileState> emit
      ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (event is GetProfileData) {
      var wrapper = ProfileMenu.fromJson(profileMenu);
      emit(ProfileMenuData(profileMenu: wrapper.data?.data?.results));
    }

    if (event is GetProfileUser){
      final dataUser = preferences.getString("UserData");
      print("data user ${jsonDecode(dataUser ?? "")}");
      dataUsers = UserLoginWrapper.fromJson(jsonDecode(dataUser ?? ""));
      emit(UserProfileGetData(userLoginData: dataUsers));
    }

    if (event is GetProfileProvince){
      final response = await ApiRepository.getProvinceData();
      provinceList = response;
      emit(AddressGetData(provinceData: provinceList, kabupatenData: kabupatenList, kecamatanData: kecamatanList));
    }

    if (event is GetProfileKabupaten){
      final response = await ApiRepository.getKotakabupatenData(event.idProvince);
      kabupatenList = response;
      emit(AddressGetData(provinceData: provinceList, kabupatenData: kabupatenList, kecamatanData: kecamatanList));
    }

    if (event is GetProfileKecamatan){
      final response = await ApiRepository.getKecamatanData(event.idKabupaten);
      kecamatanList = response;
      emit(AddressGetData(provinceData: provinceList, kabupatenData: kabupatenList, kecamatanData: kecamatanList));
    }

    if (event is GetProfileKurir){
      final response = await ApiRepository.getKurirDataName(event.idPenjual);
      kurirList = response;
      emit(KurirGetData(kurirList: kurirList));
    }

    if (event is GetProfileJasaKurir){
      final response = await ApiRepository.getKurirJenisJasa(event.idKabupatenAsal, event.idKabupatenAsal, event.jenisKurir, event.berat ?? "");
      jenisJasa = response;
      emit(KurirGetData(kurirList: kurirList, jenisJasa: jenisJasa));
    }
  }
}
