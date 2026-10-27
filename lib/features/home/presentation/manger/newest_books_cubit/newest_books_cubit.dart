import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books._use_case.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.fetchNewestBooksUseCase})
    : super(NewestBooksInitialState());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoadingState());
    var result = await fetchNewestBooksUseCase.call();

    result.fold(
      (failure) {
        emit(NewestBooksFailureState(errorMessage: failure.message));
      },
      (books) {
        emit(NewestBooksSuccessState(books: books));
      },
    );
  }
}
