import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/custom_shimmer_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view_model/home_view_model.dart';

class BuildTrendingListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('trending rebuilding ...');
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value == true
          ? CustomShimmerWidget(height: 200.0)
          : Container(
              padding: const EdgeInsets.all(16.0),
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.trending.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 140,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: controller.trending[index].image!,
                            height: 110,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            placeholder: (_, placeHolder) =>
                                CustomShimmerWidget(height: 110),
                            errorWidget: (context, x, y) =>
                                CustomShimmerWidget(height: 110),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: CustomTextWidget(
                            title: controller.trending[index].name!,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: CustomTextWidget(
                              title: '\$${controller.trending[index].price}',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 12,
                ),
              ),
            ),
    );
  }
}
