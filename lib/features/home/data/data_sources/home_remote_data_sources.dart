import 'package:clean_arch_bookly_app/constants.dart';
import 'package:clean_arch_bookly_app/core/functions/save_books_data.dart';
import 'package:clean_arch_bookly_app/core/utils/api_service.dart';
import 'package:clean_arch_bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourcesImp extends HomeRemoteDataSources {
  final ApiService apiService;

  HomeRemoteDataSourcesImp(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items'] ?? []) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endPoint: 'volumes?filter=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }
}
