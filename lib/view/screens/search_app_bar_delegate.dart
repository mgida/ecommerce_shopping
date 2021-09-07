import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/utils/animate_page.dart';
import 'package:shopping_app/view/components/custom_text_widget.dart';
import 'package:shopping_app/view/screens/search_screen.dart';
import 'package:shopping_app/view_model/search_view_model.dart';

class SearchAppBarDelegate extends SearchDelegate<String?> {
  List<Item> _allItemsToSearch = [
    Item(title: 'Hoodie'),
    Item(title: 'Shirts'),
    Item(title: 'Shoes'),
    Item(title: 'Blouse'),
    Item(title: 'Women'),
    Item(title: 'Women Shirts'),
    Item(title: 'Men Shirts'),
    Item(title: 'Women Jacket'),
    Item(title: 'Jacket Buffer'),
    Item(title: 'Jacket Men'),
    Item(title: 'Jacket Women'),
    Item(title: 'Men'),
    Item(title: 'Caps'),
    Item(title: 'Accessories'),
    Item(title: 'Men Accessories'),
    Item(title: 'Women Accessories'),
    Item(title: 'Boys'),
    Item(title: 'Kids'),
    Item(title: 'Baby'),
  ];

  List<Item> _trendingItemsToSearch = [
    Item(title: 'Hoodie'),
    Item(title: 'Shirts'),
    Item(title: 'Shoes'),
    Item(title: 'Blouse'),
  ];

  @override
  String get searchFieldLabel => 'What are you looking for?';

  @override
  TextStyle get searchFieldStyle => TextStyle(fontSize: 25, color: Colors.red);

  @override
  void showSuggestions(BuildContext context) {}

  @override
  void showResults(BuildContext context) {
    print('');
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              child: IconButton(
                onPressed: () {
                  query = '';
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
              ),
              visible: query.isEmpty || query == '' ? false : true,
            ),
            const SizedBox(
              width: 2,
            ),
            GestureDetector(
              child: CustomTextWidget(
                title: 'Cancel',
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.grey.shade50, //new AppBar color
        elevation: 0,
      ),
      hintColor: Colors.black.withOpacity(0.5),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
      ),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.brown),
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.search,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: CustomTextWidget(
          title: query,
          color: Colors.blue,
          fontWeight: FontWeight.w900,
          fontSize: 30),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Item> suggestionList = query.isEmpty
        ? _trendingItemsToSearch
        : isExisted()
            ? _allItemsToSearch
                .where((element) =>
                    element.title.isCaseInsensitiveContainsAny(query))
                .toList()
            : [];

    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: SingleChildScrollView(
        child: GetBuilder<SearchViewModel>(
          init: SearchViewModel(),
          builder: (controller) => suggestionList.isEmpty
              ? Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Your search "$query" did not match any results.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomTextWidget(
                          title: 'Trending Searches',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      visible: query.isNotEmpty ? false : true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: ListTile(
                                title: CustomTextWidget(
                                  title: suggestionList[index].title,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.navigate_next,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    print('${suggestionList[index].title}');
                                  },
                                ),
                                onTap: () {
                                  showResults(context);
                                  String title = suggestionList[index].title;
                                  controller.toggleSearchBy(title);
                                  Navigator.of(context).push(
                                    AnimatePage.createRoute(
                                      SearchScreen(),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          itemCount: suggestionList.length,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  bool isExisted() {
    bool existed = false;
    _allItemsToSearch.forEach((item) {
      if (item.title.toLowerCase().contains(query.toLowerCase())) {
        existed = true;
      }
    });
    return existed;
  }
}
