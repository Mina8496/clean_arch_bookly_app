import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';

abstract class NewestBooksState {}

class NewestBooksInitialState extends NewestBooksState {}

class NewestBooksLoadingState extends NewestBooksState {}

class NewestBooksSuccessState extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccessState({required this.books});
}

class NewestBooksFailureState extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailureState({required this.errorMessage});
}
