import 'package:ecomm_class/ui/Product_detail/product_details_page.dart';
import 'package:ecomm_class/ui/dashboard/dashboard_page.dart';
import 'package:ecomm_class/ui/dashboard/pages/cart_page.dart';
import 'package:ecomm_class/ui/dashboard/pages/favorit_page.dart';
import 'package:ecomm_class/ui/on_boarding/login_page.dart';
import 'package:ecomm_class/ui/on_boarding/sign_up_page.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/splash/splash_page.dart';

class AppRoutes{
  static final String route_splash = "/";
  static final String route_login = "/login";
  static final String route_sign_up= "/sign_up";
  static final String route_dashboard = "/dashboard";
  static final String route_detail_page = "/detail_page";
  static final String route_cart_page = "/cart_page";
  static final String route_favorit_page = "/favorit_page";


 static Map<String, WidgetBuilder> mRoutes = {
    AppRoutes.route_splash: (context) => SplashPage(),
    AppRoutes.route_login: (context) => LoginPage(),
    AppRoutes.route_sign_up: (context) => SignUpPage(),
    AppRoutes.route_dashboard: (context) => DashboardPage(),
    AppRoutes.route_detail_page: (context) => ProductDetailsPage(),
    AppRoutes.route_cart_page: (context) => CartPage(),
    AppRoutes.route_favorit_page: (context) => FavoritPage(),

  };
}
