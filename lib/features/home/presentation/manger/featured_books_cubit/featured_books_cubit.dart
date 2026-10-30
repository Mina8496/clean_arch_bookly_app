import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.featuredBooksUseCase})
    : super(FeaturedBooksInitialState());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoadingState());
    var result = await featuredBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        emit(FeaturedBooksFailureState(errorMessage: failure.message));
      },
      (books) {
        emit(FeaturedBooksSuccessState(books: books));
      },
    );
  }
}
