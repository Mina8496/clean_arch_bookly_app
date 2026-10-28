import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookEntity> books;
  final bool isLoadingMore;
  final String? loadMoreErrorMessage;

  FeaturedBooksSuccessState({
    required this.books,
    this.isLoadingMore = false,
    this.loadMoreErrorMessage,
  });
}

class FeaturedBooksFailureState extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailureState({required this.errorMessage});
}
