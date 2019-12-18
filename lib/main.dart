import 'package:flutter/material.dart';
import 'package:flutter_app3_shop/screens/product_detail.screen.dart';
import 'package:flutter_app3_shop/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Lato'),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      }
    );
  }
}
