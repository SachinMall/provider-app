import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app_provider/res/app_colors.dart';
import 'package:shopping_app_provider/view/cart/cart.dart';
import 'package:shopping_app_provider/view/home_page.dart/home_screen.dart';
import 'package:shopping_app_provider/view/search/search.dart';
import 'package:shopping_app_provider/view/settings/settings.dart';
import 'package:shopping_app_provider/view/wishlist/fit_page.dart';

final rootPageScrollController = ScrollController(initialScrollOffset: 0.0);

class RootPage extends StatefulWidget {
  final int selectedIndex;

  const RootPage({super.key, this.selectedIndex = 0});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    if (rootPageScrollController.hasClients) {
      rootPageScrollController.animateTo(1,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
    setState(() {
      _selectedIndex = index;
      HapticFeedback.lightImpact();
    });
  }

  void _onFabPressed() {
    switch (_selectedIndex) {
      case 0: // Home
        // Optionally, navigate to a different page or perform an action
        // For example:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartPage()),
        );
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      default:
        break;
    }
  }

  final pageOptions = [
    const HomeScreen(),
     FitPage(),
    const CartPage(),
    const SearchPage(),
    const SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageOptions[_selectedIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.kwhite,
              elevation: 0,
              selectedLabelStyle: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w600, color: Colors.red),
              unselectedLabelStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              unselectedFontSize: 12,
              // unselectedItemColor: AppColor.bottomlightgrey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: AppColors.kred,
                  ),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    CupertinoIcons.heart,
                    color: AppColors.kred,
                  ),
                  icon: Icon(CupertinoIcons.heart),
                  label: 'Fit',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox.shrink(),
                  label: "",
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.kred,
                  ),
                  icon: Icon(CupertinoIcons.search),
                  label: 'wishlist',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings, color: AppColors.kred),
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          onPressed: _onFabPressed,
          child: Icon(CupertinoIcons.shopping_cart),
          backgroundColor: AppColors.kwhite,
          elevation: 4,
          shape: CircleBorder(),
          tooltip: 'Cart',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
