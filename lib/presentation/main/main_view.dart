import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tradly/features/cart/presentation/screen/cart_screen.dart';
import 'package:tradly/features/products/presentation/screen/products_screen.dart';
import 'package:tradly/features/wishlist/presentation/screen/wishlist_screen.dart';
import '../resourcses/colors_manager.dart';
import '../resourcses/strings_manager.dart';
import '../resourcses/values_manager.dart';
import 'pages/browse/view/browse_page.dart';
import 'pages/order_history/view/order_history.dart';
import 'pages/profile/profile_page.dart';
import 'pages/store/view/store_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomeScreen(),
    const BrowsePage(),
    const StorePage(),
    const OrderHistory(),
    const ProfilePage(),
  ];
  List<String> titles = [
    AppStrings.groceries.tr(),
    AppStrings.browse.tr(),
    AppStrings.store.tr(),
    AppStrings.orderHistory.tr(),
    AppStrings.profile.tr(),
  ];
  var _title = AppStrings.groceries.tr();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(_title, style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => WishListView()));
            },
            icon: const Icon(Icons.favorite),
            color: ColorManager.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => CartView()));
            },
            icon: const Icon(Icons.shopping_cart),
            color: ColorManager.white,
          ),
        ],
      ),
      // ====================
      body: pages[_currentIndex],
      // IndexedStack(index: _currentIndex, children: pages),
      // ====================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorManager.grey, spreadRadius: AppSize.s0),
          ],
        ),
        child: BottomNavigationBar(
          iconSize: AppSize.s30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppStrings.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: AppStrings.browse.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: AppStrings.store.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: AppStrings.orderHistory.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppStrings.profile.tr(),
            ),
          ],
          backgroundColor: ColorManager.white,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
