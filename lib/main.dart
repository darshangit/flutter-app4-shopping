import 'package:flutter/material.dart';
import 'package:flutter_app3_shop/providers/auth.dart';
import 'package:flutter_app3_shop/providers/cart.dart';
import 'package:flutter_app3_shop/providers/orders.dart';
import 'package:flutter_app3_shop/screens/auth-screen.dart';
import 'package:flutter_app3_shop/screens/cart_screen.dart';
import 'package:flutter_app3_shop/screens/edit_product_screen.dart';
import 'package:flutter_app3_shop/screens/orders_screen.dart';
import 'package:flutter_app3_shop/screens/products_overview_screen.dart';
import 'package:flutter_app3_shop/screens/splash-screen.dart';
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
        ChangeNotifierProxyProvider<Auth, Products>(
          builder: (ctx, auth, previousProducts) => Products(
              auth.token,
              previousProducts == null ? [] : previousProducts.items,
              auth.userId),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          builder: (ctx, auth, previousOrder) => Orders(auth.token,
              previousOrder == null ? [] : previousOrder.orders, auth.userId),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrangeAccent,
                fontFamily: 'Lato'),
            home: auth.isAuth
                ? ProductsOverviewScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, authResultSnapshot) =>
                        authResultSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen()),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen()
            }),
      ),
    );
  }
}
