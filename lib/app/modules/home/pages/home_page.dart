import 'package:flutter/material.dart';
import 'package:foodninja/app/modules/chat/pages/chat_message_page.dart';
import 'package:foodninja/app/modules/home/pages/initial_page.dart';
import 'package:foodninja/app/modules/home/pages/widgets/home_bottom_navigation_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final PageController pageController;

  final pages = [
    const InitialPage(),
    const InitialPage(),
    const InitialPage(),
    const ChatMessagePage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFF),
      bottomNavigationBar: HomeBottomNavigationBarWidget(
        onChanged: (currentPageIndex) {
          pageController.animateToPage(
            currentPageIndex,
            duration: const Duration(
              milliseconds: 600,
            ),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
        items: const [
          CustomBottomNavigationBarItem(
            title: 'Home',
            enabled: true,
            iconUrl: 'assets/images/home.png',
          ),
          CustomBottomNavigationBarItem(
            title: 'Profile',
            enabled: true,
            iconUrl: 'assets/images/profile.png',
          ),
          CustomBottomNavigationBarItem(
            title: 'Store',
            enabled: true,
            iconUrl: 'assets/images/cart.png',
          ),
          CustomBottomNavigationBarItem(
            title: 'Chat',
            enabled: true,
            iconUrl: 'assets/images/chat.png',
          ),
        ],
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pages.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
