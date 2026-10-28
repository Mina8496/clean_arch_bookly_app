import 'package:clean_arch_bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_state.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/best_seller_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccessState) {
          return BestSellerListView();
        } else if (state is NewestBooksFailureState) {
          return Text(state.errorMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
