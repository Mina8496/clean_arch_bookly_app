import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_state.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/featured_books_listView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatuedBooksListViewBlocBuilder extends StatefulWidget {
  const FeatuedBooksListViewBlocBuilder({super.key});

  @override
  State<FeatuedBooksListViewBlocBuilder> createState() =>
      _FeatuedBooksListViewBlocBuilderState();
}

class _FeatuedBooksListViewBlocBuilderState
    extends State<FeatuedBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState ||
            state is FeaturedBooksPaginationLoadingState) {
          return FeaturedBooksListViewItem(
            books: books,
          );
        } else if (state is FeaturedBooksFailureState) {
          return Text(state.errorMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
