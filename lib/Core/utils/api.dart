class API {
  static const String _apiServer = "https://mastore.co.id/api/";

  static const String login = "${_apiServer}login/signing/";
  static const String signUp = "${_apiServer}login/signup/";
  static const String category = "${_apiServer}produk/getkategoriproduk";
  static const String produkList = "${_apiServer}produk/getprodukbykategori/";
  static const String produkDetail = "${_apiServer}produk/detail/";
  static const String productSearch = "${_apiServer}produk/cari/";
  static const String provinceGet = "${_apiServer}ongkir/getprovinsi";
  static const String kabupatenGet = "${_apiServer}ongkir/getkokab/";
  static const String kecamatanGet = "${_apiServer}ongkir/getkecamatan/";
  static const String kurirNameGet = "${_apiServer}ongkir/getkurir/";
  static const String kurirJasaGet = "${_apiServer}ongkir/getlayanan/";
  static const String pembayaranPost = "${_apiServer}transaksi/docheckout";
}
