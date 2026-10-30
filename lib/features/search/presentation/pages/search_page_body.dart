import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/pages/widgets/search_result_list_view_bloc_builder.dart';
import 'package:clean_arch_bookly_app/features/search/presentation/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: CustomSearchTextField(),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Search Result', style: Styles.textStyle18),
        ),
        SizedBox(height: 15),
        Expanded(child: SearchResultListViewBlocBuilder()),
      ],
    );
  }
}
