import 'package:flutter/material.dart';
import 'package:mastore/View/Home_view/main_page.dart';
import 'package:mastore/View/Search_view/search_page.dart';
import 'package:mastore/View/splash_view/Splash_view.dart';

import '../../View/Produk/chart_page.dart';
import '../../View/Produk/checkout_kurir_page.dart';
import '../../View/Produk/checkout_page.dart';
import '../../View/Produk/produk_detail_page.dart';
import '../../View/Profile_view/profile_list_bank.dart';
import '../../View/login_view/login_view.dart';
import '../../View/login_view/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'checkoutKurir':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => CheckOutKurirPage(idPenjual: settings.arguments.toString(),));
    case 'checkoutPage':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => CheckoutPage(idPenjual: settings.arguments.toString(),));
    case 'profileDataBank':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const ProfileListBank());
    case 'SignupScreen':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const SignupView());
    case 'ChartScreen':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => ChartPage(produkId: int.parse(settings.arguments.toString()),));
    case 'SearchScreen':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => SearchPage(prodId: int.parse(settings.arguments.toString()),));
    case 'LoginScreen':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => const LoginScreen());
    case 'HomeScreen':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => MainPage(tabPage: int.parse(settings.arguments.toString()),));
    case 'ProdukDetailPage':
      return MaterialPageRoute(
          settings: routeSettings(settings),
          builder: (context) => ProdukDetailPage(idProduk: int.parse(settings.arguments.toString()),));
    default:
      return MaterialPageRoute(
          settings: const RouteSettings(name: 'SplashScreen'),
          builder: (context) => const SplashScreen());
  }
}

RouteSettings routeSettings(RouteSettings settings) =>
    RouteSettings(name: settings.name);
