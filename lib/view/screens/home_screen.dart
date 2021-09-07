import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/components/build_drawer.dart';
import 'package:shopping_app/view/components/build_indicator_widget.dart';
import 'package:shopping_app/view/components/build_recommendation_list_view_widget.dart';
import 'package:shopping_app/view/components/build_trending_list_view_widget.dart';
import 'package:shopping_app/view/components/custom_list_tile_person_widget.dart';
import 'package:shopping_app/view/components/custom_show_all_row_widget.dart';
import 'package:shopping_app/view/screens/man_screen.dart';
import 'package:shopping_app/view/screens/trending_screen.dart';
import 'package:shopping_app/view/screens/woman_screen.dart';
import 'package:shopping_app/view_model/home_view_model.dart';
import 'package:shopping_app/view_model/men_view_model.dart';
import 'package:shopping_app/view_model/women_view_model.dart';
import '../../utils/custom_icons_icons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: BuildDrawer(),
        backgroundColor: Colors.grey.shade50,
        body: GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder: (controller) => Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildRecommendationListViewWidget(),
                  BuildIndicatorWidget(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomShowAllRowWidget(
                    typeText: 'Trending',
                    onTap: () {
                      Navigator.of(context).push(
                        AnimatePage.createRoute(
                          TrendingScreen(),
                        ),
                      );
                    },
                  ),
                  controller.loading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : BuildTrendingListViewWidget(),
                  CustomShowAllRowWidget(
                    typeText: 'Categories',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        AnimatePage.createRoute(
                          WomanScreen(),
                        ),
                      );
                    },
                    child: GetBuilder<WomenViewModel>(
                      init: Get.find<WomenViewModel>(),
                      builder: (controller) => CustomListTilePersonWidget(
                        personIcon: CustomIcons.avatar,
                        personTitle: 'Woman',
                        itemsCount: controller.women.length,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        AnimatePage.createRoute(
                          ManScreen(),
                        ),
                      );
                    },
                    child: GetBuilder<MenViewModel>(
                      init: Get.find<MenViewModel>(),
                      builder: (controller) => CustomListTilePersonWidget(
                        personIcon: CustomIcons.user,
                        personTitle: 'Man',
                        itemsCount: controller.men.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20.0,
              left: 6.0,
              child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
