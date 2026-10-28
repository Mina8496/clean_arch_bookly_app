import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_state.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/featured_books_listView_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatuedBooksListViewBlocBuilder extends StatelessWidget {
  const FeatuedBooksListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return FeaturedBooksListViewItem(
            books: state.books,
            isLoadingMore: state.isLoadingMore,
            loadMoreErrorMessage: state.loadMoreErrorMessage,
            onRetry: context.read<FeaturedBooksCubit>().fetchNextPage,
          );
        } else if (state is FeaturedBooksFailureState) {
          return Text(state.errorMessage);
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
