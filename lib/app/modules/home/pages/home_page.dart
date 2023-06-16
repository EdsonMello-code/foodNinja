import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/app/core/extensions/theme_extensions.dart';
import 'package:foodninja/app/core/widgets/button_widget.dart';
import 'package:foodninja/app/core/widgets/text_field_widget.dart';
import 'package:foodninja/app/core/widgets/text_widget.dart';
import 'package:foodninja/app/modules/home/models/restaurant_model.dart';
import 'package:foodninja/app/modules/home/widgets/home_button_filter_widget.dart';
import 'package:foodninja/app/modules/home/widgets/home_card_widget.dart';
import 'package:foodninja/app/modules/home/widgets/home_popular_widget.dart';
import 'package:foodninja/app/modules/home/widgets/home_special_deal_card_widget.dart';

import '../widgets/notification_service_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final TextEditingController textEditingController;
  late final PageController pageController;

  final restaurants = [
    const RestaurantModel(
      url: 'assets/images/vegan.png',
      title: 'Vegan Resto',
      time: '12 Mins',
    ),
    const RestaurantModel(
      url: 'assets/images/heathly.png',
      title: 'Healthy Food',
      time: '8 Mins',
    ),
  ];

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    pageController = PageController(viewportFraction: 0.7);
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      body: Container(
        constraints: BoxConstraints(
          minHeight: size.height - padding.top,
          maxWidth: size.width,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage(
              'assets/images/background_sliced.png',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(
                top: padding.top + 60,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 233,
                      child: TextWidget.inter(
                        'Find Your Favorite Food',
                        style: const TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const NotificationServiceWidget()
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          boxShadow: const [],
                          height: 50,
                          contentPadding: const EdgeInsets.only(
                            left: 20,
                          ),
                          fillColor: const Color(0xFFFEF6ED),
                          prefix: SvgPicture.asset('assets/images/search.svg'),
                          hint: 'What do you want to order?',
                          hintColor: const Color(0xFFF2C2A2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 9.0,
                        ),
                        child: HomeButtonFilterWidget(
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: HomeSpecialDealCardWidget(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/ice_cream.png',
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: TextWidget.inter(
                                  'Special Deal for October',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: context.appTheme.white,
                                  ),
                                ),
                              ),
                              ButtonWidget(
                                text: 'Buy Now',
                                backgroundColor: context.appTheme.white,
                                textColor: context.appTheme.green,
                                onPressed: () {},
                                borderRadius: BorderRadius.circular(10),
                                fontSize: 12,
                                size: const Size(
                                  100,
                                  40,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget.inter(
                        'Nearest Restaurant',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextWidget.inter(
                        'View More',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFF7C32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 190,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: restaurants.length,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 20.0,
                        ),
                        child: HomeCardWidget(
                          url: restaurant.url,
                          time: restaurant.time,
                          title: restaurant.title,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                right: 31,
                left: 31,
              ),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget.inter(
                        'Popular Menu',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextWidget.inter(
                        'View More',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFF7C32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                top: 20,
                right: 31,
                left: 31,
              ),
              sliver: SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      bottom: 8.0,
                    ),
                    child: HomePopularWidget(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
