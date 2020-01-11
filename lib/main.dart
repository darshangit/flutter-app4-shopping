import 'package:flutter/material.dart';
import 'package:flutter_app3_shop/providers/auth.dart';
import 'package:flutter_app3_shop/providers/cart.dart';
import 'package:flutter_app3_shop/providers/orders.dart';
import 'package:flutter_app3_shop/screens/auth-screen.dart';
import 'package:flutter_app3_shop/screens/cart_screen.dart';
import 'package:flutter_app3_shop/screens/edit_product_screen.dart';
import 'package:flutter_app3_shop/screens/orders_screen.dart';
import 'package:flutter_app3_shop/screens/user_products_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import 'package:flutter_app3_shop/screens/product_detail.screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
          title: 'MyShop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrangeAccent,
              fontFamily: 'Lato'),
          home: AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName: (ctx) => OrdersScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
            EditProductScreen.routeName: (ctx) => EditProductScreen()
          }),
    );
  }
}
