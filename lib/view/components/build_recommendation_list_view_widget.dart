import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/components/custom_shimmer_widget.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view_model/home_view_model.dart';

class BuildRecommendationListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value == true
          ? CustomShimmerWidget(height: 420.0)
          : CarouselSlider.builder(
              options: CarouselOptions(
                height: 420.0,
                //instead of wrap stack with container and give it a height
                viewportFraction: 1.0,
                autoPlay: false,
                pauseAutoPlayInFiniteScroll: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  controller.changeIndex(index);
                },
              ),
              itemCount: controller.recommendations.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Stack(
                  children: [
                    ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              controller.recommendations[itemIndex].image!,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: 420.0,
                          memCacheHeight: (Get.height * 0.6).toInt(),
                          placeholder: (_, placeHolder) =>
                              CustomShimmerWidget(height: 420),
                          errorWidget: (context, x, y) =>
                              CustomShimmerWidget(height: 420),
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      left: 16.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'Recommendations',
                            color: Colors.white54.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          const SizedBox(
                            height: 0.0,
                          ),
                          CustomTextWidget(
                            title: controller.recommendations[itemIndex].name ??
                                '',
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 0.0,
                          ),
                          Row(
                            children: [
                              CustomTextWidget(
                                title:
                                    '\$${controller.recommendations[itemIndex].price ?? ''}',
                                color: Colors.blue.shade500,
                                fontWeight: FontWeight.w700,
                                fontSize: 27.0,
                              ),
                              const SizedBox(
                                width: 14.0,
                              ),
                              CustomTextWidget(
                                title:
                                    '\$${controller.recommendations[itemIndex].discount ?? ''}',
                                color: Colors.white54.withOpacity(0.7),
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}
