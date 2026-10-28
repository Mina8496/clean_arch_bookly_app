import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewItem extends StatefulWidget {
  const FeaturedBooksListViewItem({
    super.key,
    required this.books,
    this.isLoadingMore = false,
    this.loadMoreErrorMessage,
    this.onRetry,
  });

  final List<BookEntity> books;
  final bool isLoadingMore;
  final String? loadMoreErrorMessage;
  final VoidCallback? onRetry;

  @override
  State<FeaturedBooksListViewItem> createState() =>
      _FeaturedBooksListViewItemState();
}

class _FeaturedBooksListViewItemState extends State<FeaturedBooksListViewItem> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.maxScrollExtent > 0 &&
        position.pixels >= position.maxScrollExtent * 0.7) {
      context.read<FeaturedBooksCubit>().fetchNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount:
            widget.books.length +
            (widget.isLoadingMore || widget.loadMoreErrorMessage != null
                ? 1
                : 0),
        itemBuilder: (context, index) {
          if (index == widget.books.length) {
            if (widget.isLoadingMore) {
              return const SizedBox(
                width: 80,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final errorMessage = widget.loadMoreErrorMessage;
            if (errorMessage == null) return const SizedBox.shrink();

            return SizedBox(
              width: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    errorMessage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: widget.onRetry,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomBookItem(image: widget.books[index].image ?? ''),
          );
        },
      ),
    );
  }
}
