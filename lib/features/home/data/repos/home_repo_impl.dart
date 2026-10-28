import 'package:clean_arch_bookly_app/core/errors/failure.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_sources.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSources;
  final HomeLocalDataSources homeLocalDataSources;

  HomeRepoImpl({
    required this.homeRemoteDataSources,
    required this.homeLocalDataSources,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  }) async {
    try {
      if (pageNumber == 0) {
        final books = homeLocalDataSources.fetchFeaturedBooks();
        if (books.isNotEmpty) {
          return right(books);
        }
      }
      final books = await homeRemoteDataSources.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } catch (e) {
      print('REPO ERROR: $e');
      if (e is DioException) {
        print('STATUS: ${e.response?.statusCode}');
        print('BODY: ${e.response?.data}');
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSources.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSources.fetchNewestBooks();
      return right(books);
    } catch (e) {
      print('REPO ERROR: $e');
      if (e is DioException) {
        print('STATUS: ${e.response?.statusCode}');
        print('BODY: ${e.response?.data}');
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
