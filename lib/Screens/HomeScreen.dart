import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/Providers/BottomNavProvider.dart';
import 'package:mystore/Screens/Categories/CategoryScreen.dart';
import 'package:mystore/Screens/FavouriteScreen.dart';
import 'package:mystore/Screens/Products/ProductsScreen.dart';
import 'package:mystore/Screens/UserSetting.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var currentTab = [
   ProductsScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    UserSetting(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavProvider>(context);
    return Scaffold(

      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        iconSize: 21,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        elevation: 0,

        fixedColor: Colors.white,
        backgroundColor: Colors.black,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/products.svg'),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/categories.svg'),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/favourite.svg'),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/person.svg'),
            label: 'Mitt konto',
          ),
        ],
      ),
    );
  }
}