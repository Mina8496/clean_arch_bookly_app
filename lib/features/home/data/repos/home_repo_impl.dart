import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_sources.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSources;
  final HomeLocalDataSources homeLocalDataSources;

  HomeRepoImpl({
    required this.homeRemoteDataSources,
    required this.homeLocalDataSources,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSources.fetchFeaturedBooks();

      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSources.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSources.fetchNewestBooks();

      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSources.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
