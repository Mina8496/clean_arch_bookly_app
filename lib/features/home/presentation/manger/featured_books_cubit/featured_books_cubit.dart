import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.featuredBooksUseCase})
    : super(FeaturedBooksInitialState());

  static const int _pageSize = 10;

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  List<BookEntity> _books = [];
  int _nextPageNumber = 1;
  bool _isFetching = false;
  bool _hasMore = true;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (_isFetching) return;

    _isFetching = true;
    try {
      emit(FeaturedBooksLoadingState());
      final result = await featuredBooksUseCase.call(param: pageNumber);

      result.fold(
        (failure) {
          emit(FeaturedBooksFailureState(errorMessage: failure.message));
        },
        (books) {
          _books = books;
          _nextPageNumber = (books.length + _pageSize - 1) ~/ _pageSize;
          _hasMore = books.length >= _pageSize;
          emit(FeaturedBooksSuccessState(books: _books));
        },
      );
    } finally {
      _isFetching = false;
    }
  }

  Future<void> fetchNextPage() async {
    if (_isFetching || !_hasMore || state is! FeaturedBooksSuccessState) {
      return;
    }

    _isFetching = true;
    try {
      emit(FeaturedBooksSuccessState(books: _books, isLoadingMore: true));

      final result = await featuredBooksUseCase.call(param: _nextPageNumber);
      result.fold(
        (failure) {
          emit(
            FeaturedBooksSuccessState(
              books: _books,
              loadMoreErrorMessage: failure.message,
            ),
          );
        },
        (books) {
          _books = [..._books, ...books];
          _nextPageNumber++;
          _hasMore = books.length >= _pageSize;
          emit(FeaturedBooksSuccessState(books: _books));
        },
      );
    } finally {
      _isFetching = false;
    }
  }
}
