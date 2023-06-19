import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Auth_bloc/authentication_bloc.dart';
import 'package:mastore/Bloc/Profile_bloc/profile_bloc.dart';
import 'package:mastore/Core/utils/constants.dart';
import 'package:mastore/Core/utils/palette.dart';
import 'package:mastore/Core/widgets/StandarText.dart';
import 'package:mastore/Core/widgets/loading_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{
  bool? userLogin = false;

  @override
  void initState() {
    context.read<AuthenticationBloc>().add(CheckUserLogin());
    context.read<ProfileBloc>().add(GetProfileData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Container(),
              title: StandarText.header1("Profile", 18.0),
            ),
            body: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, profState){
                if (authState is UserLoginAuthentical) userLogin = authState.userLogin;
                if (profState is ProfileMenuData){
                  return Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Container(
                                height: 180,
                                width: 180,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey,
                                  child: Image.asset(AppIcons.img_default, fit: BoxFit.cover,),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
                                child: StandarText.labelCustom("John Doe", 24.0, 2),
                              ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: userLogin == false
                              ? GestureDetector(
                            onTap: (){
                              print("login clicked");
                              Navigator.of(context).pushReplacementNamed("LoginScreen");
                            },
                            child: Container(
                              height: 56,
                              width: 56,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 50, top: 16, right: 50, bottom: 24),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: StandarText.label("Login", 18.0, Colors.white),
                            ),
                          )
                              : Container(),
                        ),
                        SliverToBoxAdapter(
                          child: userLogin == true
                              ? GestureDetector(
                            onTap: (){
                              print("logout clicked");
                              Navigator.of(context).pushReplacementNamed("LoginScreen");
                            },
                            child: Container(
                              height: 56,
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 20, top: 16, right: 20, bottom: 24),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: StandarText.label("Logout", 18.0, Colors.white),
                            ),
                          )
                              : Container(),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Profile Menu", style: Palette.mdlHeading1.copyWith(
                                    color: Palette.mdlSpaceCadet100, height: 0, fontSize: 24
                                ),),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: List.generate(profState.profileMenu?.length ?? 0,
                                          (index) => GestureDetector(
                                            onTap: (){
                                              if (index == 0) {

                                              } else if (index == 1) {

                                              } else if (index == 2) {
                                                Navigator.of(context).pushReplacementNamed("profileDataBank");
                                              } else if (index == 3) {

                                              } else if (index == 4) {

                                              }
                                            },
                                        child: Container(
                                          height: 60,
                                          margin: const EdgeInsets.only(top: 15),
                                          padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              border: Border.all(color: Colors.black87)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              StandarText.labelCustom(profState.profileMenu?[index].tittle, 20.0, 1),
                                              const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.black87,)
                                            ],
                                          ),
                                        ),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }

                return const LoadingPage();
              },
            ),
          );
        },
      ),
    );
  }
}