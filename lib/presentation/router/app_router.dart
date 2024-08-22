import 'package:flutter/material.dart';
import 'package:it_bookstore_bloc/presentation/screen/book_detail.dart';
import 'package:it_bookstore_bloc/presentation/screen/bookstore.dart';

class Routes {
  static const String bookstoreRoute = "/bookstore";
  static const String bookDetailRoute = "/bookDetail";
  static const String rootRoute = "/";
}

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.rootRoute:
      case Routes.bookstoreRoute:
        return MaterialPageRoute(
          builder: (_) => const BookstoreView(),
        );
      case Routes.bookDetailRoute:
        return MaterialPageRoute(
          builder: (_) => const BookDetailView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const BookstoreView(),
        );
    }
  }
}
