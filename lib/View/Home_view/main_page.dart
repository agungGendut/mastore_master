import 'package:flutter/material.dart';
import 'package:mastore/View/Produk/chart_page.dart';

import '../Profile_view/profile_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget{
  final int? tabPage;
  const MainPage({super.key, this.tabPage});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  int currentTabIndex = 0;
  final home = const MyHomePage();
  final keranjang = const ChartPage();
  final profile = const ProfilePage();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    currentTabIndex = widget.tabPage ?? 0;
    pageController = PageController(
      initialPage: widget.tabPage ?? 0,
      keepPage: true,
    );
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void handleOnTap(index) {
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: [home, keranjang, profile],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) => handleOnTap(val),
        currentIndex: currentTabIndex,
        items: List.generate(3,
                (index) => BottomNavigationBarItem(
                icon: index == 0
                    ? const Icon(Icons.home_filled)
                    : index == 1
                    ? const Icon(Icons.shopping_cart_outlined)
                    : const Icon(Icons.menu),
                label: index == 0
                    ? "Home"
                    : index == 1
                    ? "Chart"
                    : "Profile")),
      ),
    );
  }
}