import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystore/Providers/BottomNavProvider.dart';
import 'package:mystore/Providers/FavouriteProvider.dart';
import 'package:mystore/Screens/Categories/CategoryScreen.dart';
import 'package:mystore/Screens/Categories/ProductByCategory.dart';
import 'package:mystore/Screens/FavouriteScreen.dart';
import 'package:mystore/Screens/HomeScreen.dart';
import 'package:mystore/Screens/Products/ProductsScreen.dart';
import 'package:mystore/Screens/UserSetting.dart';
import 'package:provider/provider.dart';

import 'Models/Product.dart';
import 'Providers/CategoryProvider.dart';
import 'Providers/ProductsProvider.dart';
import 'Screens/Products/ProductDetail.dart';
import 'Screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ProductsProvider()),
      ChangeNotifierProvider(create: (_)=>CategoriesProvider()),
      ChangeNotifierProvider(create: (_)=>FavouriteProvider()),
      ChangeNotifierProvider(create: (_)=>BottomNavProvider())

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,

          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
         home:  SplashScreen(),



      ),
    );
  }
}
