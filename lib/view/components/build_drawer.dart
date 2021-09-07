import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/components/build_drawer_list_tile.dart';
import 'package:shopping_app/view/screens/cart_screen.dart';
import 'package:shopping_app/view/screens/favourite_screen.dart';
import 'package:shopping_app/view/screens/home_screen.dart';
import 'package:shopping_app/view/screens/sign_in_screen.dart';
import 'package:shopping_app/view_model/cart_view_model.dart';
import 'package:shopping_app/view_model/favourite_view_model.dart';

class BuildDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/hm_black.jpg',
                width: 150.0,
                height: 150.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 15,),
          BuildDrawerListTile(
            icon: Icons.home,
            title: 'Home',
            onTap: () {
              Navigator.of(context).push(
                AnimatePage.createRoute(
                  HomeScreen(),
                ),
              );
            },
          ),
          GetBuilder<FavouriteViewModel>(
            init: FavouriteViewModel(),
            builder: (controller) => BuildDrawerListTile(
              icon: Icons.favorite_border,
              title: 'My Favourites',
              onTap: () {
                controller.resetFavourites();
                Navigator.of(context).push(
                  AnimatePage.createRoute(
                    FavouriteScreen(),
                  ),
                );
              },
            ),
          ),
          GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => BuildDrawerListTile(
              icon: Icons.shopping_cart,
              title: 'My Cart',
              onTap: () {
                controller.getCartProducts();
                Navigator.of(context).push(
                  AnimatePage.createRoute(
                    CartScreen(),
                  ),
                );
              },
            ),
          ),
          BuildDrawerListTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () {},
          ),
          BuildDrawerListTile(
            icon: Icons.logout,
            title: 'Sign out',
            onTap: () {
              Get.back();
              Get.offAll(() => SignInScreen());
            },
          ),
        ],
      ),
    );
  }
}
