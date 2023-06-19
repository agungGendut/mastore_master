import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mastore/Core/services/Api_repository.dart';
import 'package:mastore/Model/produkList_wrapper.dart';
import 'package:meta/meta.dart';

import '../../Model/category_wrapper.dart';
import '../../Model/menu_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late MenuWrapper menuWrapper = MenuWrapper();
  late List<CategorysWrapper>? catMenu = [];
  late List<ProdukListWrapper>? prodList = [];
  late List<ProdukListWrapper>? searchList = [];

  var homeMenu = {
    "success": true,
    "message": "Get Programs List",
    "status_code": 200,
    "data": {
      "data": {
        "results": [
          {
            "id": 1,
            "tittle": "banner",
            "items": [
              {
                "id": 1,
                "picture": "assets/banner1.png",
                "title": "banner1",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 2,
                "picture": "assets/banner2.jpg",
                "title": "banner2",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 3,
                "picture": "assets/banner3.jpg",
                "title": "banner3",
                "subtitle": "",
                "description": "",
                "price": ""
              }
            ]
          },
          {
            "id": 1,
            "tittle": "Promotion",
            "items": [
              {
                "id": 1,
                "picture": "assets/promotion1.jpg",
                "title": "promo1",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 2,
                "picture": "assets/promotion2.jpg",
                "title": "promo2",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 3,
                "picture": "assets/promotion3.jpg",
                "title": "promo3",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 4,
                "picture": "assets/promotion4.jpg",
                "title": "promo4",
                "subtitle": "",
                "description": "",
                "price": ""
              }
            ]
          },
          {
            "id": 3,
            "tittle": "Kategori Produk",
            "items": [
              {
                "id": 1,
                "picture": "assets/kategori1.png",
                "title": "Sayuran dan Rempah",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 2,
                "picture": "assets/kategori2.png",
                "title": "Ternak",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 3,
                "picture": "assets/kategori3.png",
                "title": "Tanaman Hias",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 4,
                "picture": "assets/kategori4.png",
                "title": "Buah dan Polong",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 5,
                "picture": "assets/kategori5.png",
                "title": "Media dan Alat",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 6,
                "picture": "assets/kategori6.png",
                "title": "Olahan",
                "subtitle": "",
                "description": "",
                "price": ""
              },
              {
                "id": 6,
                "picture": "assets/kategori7.png",
                "title": "Lainya",
                "subtitle": "",
                "description": "",
                "price": ""
              }
            ]
          },
          {
            "id": 4,
            "tittle": "Sayuran dan Rempah",
            "items": [
              {
                "id": 1,
                "picture": "assets/sayuran1.jpg",
                "title": "PERSEDAPURAN",
                "subtitle": "Black Garlic",
                "description": "Bumbu tabur yang isinya bawang merah dan abwang putih goreng yang menjadikan rasanya gurrih sehingga cocok untuk teman makan sebagai taburan diatas nasi.",
                "price": "40,000"
              },
              {
                "id": 2,
                "picture": "assets/sayuran2.jpg",
                "title": "BENUA PERTANIAN",
                "subtitle": "Jamur Tiram",
                "description": "",
                "price": "50,000"
              },
              {
                "id": 3,
                "picture": "assets/sayuran3.jpg",
                "title": "PWMPSMKPPNKUTACANE",
                "subtitle": "Pokcoy",
                "description": "",
                "price": "5,500"
              },
              {
                "id": 4,
                "picture": "assets/sayuran4.jpg",
                "title": "RANTAU TANIJAYA",
                "subtitle": "Gula Kristal Aren",
                "description": "",
                "price": "20,600"
              },
              {
                "id": 5,
                "picture": "assets/sayuran5.jpg",
                "title": "MAKMUR",
                "subtitle": "Jamur Tiram Coklat (500g)",
                "description": "",
                "price": "9,500"
              },
              {
                "id": 6,
                "picture": "assets/sayuran6.jpg",
                "title": "PWMPSMKPPNKUTACANE",
                "subtitle": "Sayuran hidroponik",
                "description": "",
                "price": "5,500"
              },
              {
                "id": 7,
                "picture": "assets/sayuran7.jpg",
                "title": "BENUA PERTANIAN",
                "subtitle": "Jamur Tiram Putih",
                "description": "",
                "price": "10,000"
              },
              {
                "id": 8,
                "picture": "assets/sayuran8.jpg",
                "title": "BENUA PERTANIAN",
                "subtitle": "Jamur Tiram Putih",
                "description": "",
                "price": "25,000"
              },
              {
                "id": 9,
                "picture": "assets/sayuran9.jpg",
                "title": "BATATAS FAMS",
                "subtitle": "Selada Keriting Hidroponik",
                "description": "",
                "price": "5,000"
              },
              {
                "id": 10,
                "picture": "assets/sayuran10.jpg",
                "title": "SATAHI SAOLOAN",
                "subtitle": "Cabai Merah",
                "description": "",
                "price": "53,000"
              }
            ]
          },
          {
            "id": 5,
            "tittle": "Tanaman Hias",
            "items": [
              {
                "id": 1,
                "picture": "assets/tanamanHias1.jpg",
                "title": "CIPANAS PLANT",
                "subtitle": "Krisan",
                "description": "Bumbu tabur yang isinya bawang merah dan abwang putih goreng yang menjadikan rasanya gurrih sehingga cocok untuk teman makan sebagai taburan diatas nasi.",
                "price": "2,500"
              },
              {
                "id": 2,
                "picture": "assets/tanamanHias2.jpg",
                "title": "CIPANAS PLANT",
                "subtitle": "Kaktus",
                "description": "",
                "price": "10,000"
              },
              {
                "id": 3,
                "picture": "assets/tanamanHias3.jpg",
                "title": "CIPANAS PLANT",
                "subtitle": "Anggrek Bulan",
                "description": "",
                "price": "120,000"
              },
              {
                "id": 4,
                "picture": "assets/tanamanHias4.jpg",
                "title": "BATATAS FAMS",
                "subtitle": "Vicus Varigata",
                "description": "",
                "price": "51,500"
              },
              {
                "id": 5,
                "picture": "assets/tanamanHias5.jpg",
                "title": "BATATAS FAMS",
                "subtitle": "Alokasia Silver",
                "description": "",
                "price": "100,000"
              },
              {
                "id": 6,
                "picture": "assets/tanamanHias6.jpg",
                "title": "BYRIAS MAWAMA",
                "subtitle": "Beagonia spp",
                "description": "",
                "price": "120,000"
              },
              {
                "id": 7,
                "picture": "assets/tanamanHias7.jpg",
                "title": "BYRIAS MAWAMA",
                "subtitle": "Sansivera",
                "description": "",
                "price": "180,000"
              },
              {
                "id": 8,
                "picture": "assets/tanamanHias8.jpg",
                "title": "BYRIAS MAWAMA",
                "subtitle": "Aglaonema lokal",
                "description": "",
                "price": "85,000"
              },
              {
                "id": 9,
                "picture": "assets/tanamanHias9.jpg",
                "title": "BYRIAS MAWAMA",
                "subtitle": "Chalatea sp",
                "description": "",
                "price": "165,000"
              },
              {
                "id": 10,
                "picture": "assets/tanamanHias10.jpg",
                "title": "BYRIAS MAWAMA",
                "subtitle": "Chalatea hijau totol",
                "description": "",
                "price": "160,000"
              }
            ]
          },
        ]
      }
    }
  };

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      await mapEventToStates(event, emit);
    });
  }

  Future<void> mapEventToStates(
      HomeEvent event, Emitter<HomeState> emit
      ) async {

    if (event is GetHomeMenuData){
      // final String response = await rootBundle.loadString('assets/menuData');
      // final data = await json.decode(homeMenu);
      var wrapper = MenuWrapper.fromJson(homeMenu);
      print("${wrapper.data!.data!.results![0].tittle}");
      menuWrapper = wrapper;
      if (menuWrapper.data!.data!.results!.isNotEmpty){
      emit(GetHomeMenuInitial(
          menuWrapper: menuWrapper.data!.data!,
          cateGoryWrapper: catMenu ?? [],
          produkListWrapper: prodList ?? [],
          produkSearch: searchList ?? []
      ));
      }
    }

    if (event is GetCategoryMenuData){
      List<CategorysWrapper> response = await ApiRepository.getCategorysData();
      print(response);
      catMenu = response;
      emit(GetHomeMenuInitial(
          menuWrapper: menuWrapper.data!.data!,
          cateGoryWrapper: catMenu ?? [],
          produkListWrapper: prodList ?? [],
          produkSearch: searchList ?? []
      ));
    }

    if (event is GetProdukListData){
      List<ProdukListWrapper> response = await ApiRepository.getProdukByCategory(event.produkId);
      print(response);
      prodList?.addAll(response);
      emit(GetHomeMenuInitial(
          menuWrapper: menuWrapper.data!.data!,
          cateGoryWrapper: catMenu ?? [],
          produkListWrapper: prodList ?? [],
          produkSearch: searchList ?? []
      ));
    }

    if (event is GetProductSearch){
      List<ProdukListWrapper> response = await ApiRepository.getProductSearch(event.productSearch);
      print(response);
      searchList = response;
      emit(GetHomeMenuInitial(
          menuWrapper: menuWrapper.data!.data!,
          cateGoryWrapper: catMenu ?? [],
          produkListWrapper: prodList ?? [],
          produkSearch: searchList ?? []
      ));
    }

    if (event is SearchProductReset){
      catMenu?.clear();
      prodList?.clear();
      searchList?.clear();
    }

  }
}
