import 'package:clean_arch_bookly_app/features/home/presentation/pages/book_deatiles_page.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/home_page.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/pages/search_page.dart';
import 'package:clean_arch_bookly_app/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const khomePage = '/homePage';
  static const kBookDeatilesPage = '/BookDeatilesPage';
  static const kSearchPage = '/SearchPage';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashPage()),
      GoRoute(path: khomePage, builder: (context, state) => HomePage()),
      GoRoute(
        path: kBookDeatilesPage,
        builder: (context, state) => BookDeatilesPage(),
      ),
      GoRoute(path: kSearchPage, builder: (context, state) => SearchPage()),
    ],
  );
}
