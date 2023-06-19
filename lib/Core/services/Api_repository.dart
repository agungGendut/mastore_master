import 'dart:convert';

import '../../Model/add_to_cart_model.dart';
import '../../Model/address_model.dart';
import '../../Model/category_wrapper.dart';
import '../../Model/ekspedisi_model.dart';
import '../../Model/product_detail_wrapper.dart';
import '../../Model/produkList_wrapper.dart';
import '../../Model/signup_model.dart';
import '../../Model/userLogin_wrapper.dart';
import '../utils/api.dart';
import 'networking.dart';

class ApiRepository{
  static Future loginAuth(telephone, password, token) async {
    NetworkHelper networkHelper = NetworkHelper("${API.login}$telephone/$password", null, null);
    final request = await networkHelper.postForLogin();
    var statusLogin = UserLoginWrapper.fromJson(request);
    networkHelper.client.close();
    return statusLogin;
  }

  static Future loginSignup(username, email, telephone, password, retypepassword) async {
    NetworkHelper networkHelper = NetworkHelper("${API.signUp}$username/$email/$telephone/$password/$retypepassword", null, null);
    final request = await networkHelper.postRequest();
    var statustSignup = SignUpWrapper.fromJson(request);
    networkHelper.client.close();
    return statustSignup;
  }
  
  static Future getCategorysData() async {
    NetworkHelper networkHelper = NetworkHelper(API.category, null, null);
    var request = await networkHelper.getRequest();
    var categoryData = categorysWrapperFromJson(request);
    networkHelper.client.close();
    return categoryData;
  }

  static Future getProdukByCategory(int prodId) async {
    NetworkHelper networkHelper = NetworkHelper("${API.produkList}$prodId", null, null);
    var request = await networkHelper.getRequest();
    var produkData = produkListWrapperFromJson(request);
    networkHelper.client.close();
    return produkData;
  }
  
  static Future getProductSearch(String productSearch) async {
    NetworkHelper networkHelper = NetworkHelper("${API.productSearch}$productSearch",  null, null);
    var request = await networkHelper.getRequest();
    var productData = produkListWrapperFromJson(request);
    networkHelper.client.close();
    return productData;
  }

  static Future getProductDetailData(int productId) async {
    NetworkHelper networkHelper = NetworkHelper("${API.produkDetail}$productId", null,  null);
    var request = await networkHelper.getRequest();
    var detailProduct = ProductDetailWrapper.fromJson(json.decode(request));
    networkHelper.client.close();
    return detailProduct;
  }

  static Future getProvinceData() async {
    NetworkHelper networkHelper = NetworkHelper(API.provinceGet, null, null);
    var request = await networkHelper.getRequest();
    print("get Province data $request");
    Iterable dataProvince = json.decode(request);
    networkHelper.client.close();
    // List<Province> provinceAddress = json.decode(request);
    var provinceAddress = List<Province>.from(dataProvince.map((x) => Province.fromJson(x)));
    return provinceAddress;
  }

  static Future getKotakabupatenData(String idProvince) async {
    NetworkHelper networkHelper = NetworkHelper("${API.kabupatenGet}$idProvince", null, null);
    var request = await networkHelper.getRequest();
    Iterable dataKabupaten = json.decode(request);
    networkHelper.client.close();
    // var kabupatenAddress = Kabupaten.fromJson(request);
    var kabupatenAddress = List<Kabupaten>.from(dataKabupaten.map((x) => Kabupaten.fromJson(x)));
    return kabupatenAddress;
  }

  static Future getKecamatanData(String idKabupaten) async {
    NetworkHelper networkHelper = NetworkHelper("${API.kecamatanGet}$idKabupaten", null, null);
    var request = await networkHelper.getRequest();
    Iterable dataKecamatan = json.decode(request);
    networkHelper.client.close();
    // var kecamatanAddress = Kecamatan.fromJson(request);
    var kecamatanAddress = List<Kecamatan>.from(dataKecamatan.map((x) => Kecamatan.fromJson(x)));
    return kecamatanAddress;
  }

  static Future getKurirDataName(String idPenjual) async {
    NetworkHelper networkHelper = NetworkHelper("${API.kurirNameGet}$idPenjual", null, null);
    var request = await networkHelper.getRequest();
    Iterable dataKurir = json.decode(request);
    networkHelper.client.close();
    var kurirData = List<ListKurir>.from(dataKurir.map((x) => ListKurir.fromJson(x)));
    return kurirData;
  }

  static Future getKurirJenisJasa(String idKabupatenAsal, String idKecamatanTujuan, String kodeKurir, String berat) async {
    NetworkHelper networkHelper = NetworkHelper("${API.kurirJasaGet}$idKabupatenAsal/$idKecamatanTujuan/$kodeKurir/$berat", null, null);
    var request = await networkHelper.getRequest();
    Iterable jenisJasa = json.decode(request);
    networkHelper.client.close();
    var jenisData = List<JasaPengiriman>.from(jenisJasa.map((e) => JasaPengiriman.fromJson(e)));
    return jenisData;
  }

  static Future postTransaksiPembayaran(String idKonsumen, String idSeller, String kodeKurir, String kurir, String layanan, String ongkir, List<dynamic>? produkData) async {
    Map<String, dynamic> dataKirim = {
      "id_konsumen": idKonsumen,
      "id_reseller": idSeller,
      "kode_kurir": kodeKurir,
      "kurir": kurir,
      "layanan_value": layanan,
      "ongkir": ongkir,
      "keterangan": "",
      "listkeranjang": json.encode(produkData)
    };

    print("data dikirim $dataKirim");
    NetworkHelper networkHelper = NetworkHelper(API.pembayaranPost, dataKirim, null);
    var request = await networkHelper.postRequest();
    print("data balikan $request");
    Iterable response = json.decode(request);
    networkHelper.client.close();
  }

}