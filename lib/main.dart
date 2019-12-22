import 'package:flutter/material.dart';
import 'package:flutter_app3_shop/providers/cart.dart';
import 'package:flutter_app3_shop/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import 'package:flutter_app3_shop/screens/product_detail.screen.dart';
import 'package:flutter_app3_shop/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
          title: 'MyShop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrangeAccent,
              fontFamily: 'Lato'),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen()
          }),
    );
  }
}
