import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationLoadingState extends FeaturedBooksState {}

class FeaturedBooksPaginationFailureState extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksPaginationFailureState({required this.errorMessage});
}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccessState({required this.books});
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailureState({required this.errorMessage});
}
