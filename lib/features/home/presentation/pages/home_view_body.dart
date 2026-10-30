import 'package:clean_arch_bookly_app/core/utils/app_router.dart';
import 'package:clean_arch_bookly_app/core/utils/styles.dart';
import 'package:clean_arch_bookly_app/core/utils/assets_data.dart';
import 'package:clean_arch_bookly_app/core/widgets/custom_app_bar.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/best_seller_listview_bloc_builder.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/pages/widgets/featued_books_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomAppBar(
                  showBackButton: false,
                  actions: [
                    Image.asset(AssetsData.logo, height: 18),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kSearchPage);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              FeatuedBooksListViewBlocConsumer(),
              SizedBox(height: 50),
              // Best Seller
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Best Result', style: Styles.textStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        // Best Seller List View
        SliverFillRemaining(child: BestSellerListViewBlocBuilder()),
      ],
    );
  }
}
