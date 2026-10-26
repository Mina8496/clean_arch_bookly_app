import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSources {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourcesImp extends HomeLocalDataSources {
  @override
  fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
  
}