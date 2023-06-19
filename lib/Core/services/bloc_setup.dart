import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Home_bloc/home_bloc.dart';
import 'package:mastore/Bloc/Produk_bloc/produk_bloc.dart';
import 'package:mastore/Bloc/Profile_bloc/profile_bloc.dart';
import 'package:mastore/Bloc/transaksi_bloc/transaksi_bloc.dart';
import 'package:provider/single_child_widget.dart';

import '../../Bloc/Auth_bloc/authentication_bloc.dart';

List<SingleChildWidget> providers = [
  BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc()),
  BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
  BlocProvider<ProdukBloc>(create: (context) => ProdukBloc()),
  BlocProvider<TransaksiBloc>(create: (context) => TransaksiBloc()),
  BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
];