import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar:
          GNav(
            iconSize: 25,
            textSize: 16,
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
            activeColor: Colors.black,
            gap: 8,
            tabBackgroundColor: Colors.white24,
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.add,
                text: 'Add',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
        //   BottomNavigationBar(
        // currentIndex: _page,
        // selectedItemColor: GlobalVariables.selectedNavBarColor,
        // unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        // backgroundColor: GlobalVariables.backgroundColor,
        // iconSize: 28,
        // onTap: updatePage,
        // items: [
        //   //Home

        //   BottomNavigationBarItem(
        //     icon: Container(
        //       width: bottomBarWidth,
        //       decoration: BoxDecoration(
        //           border: Border(
        //               top: BorderSide(
        //                   color: _page == 0
        //                       ? GlobalVariables.selectedNavBarColor
        //                       : GlobalVariables.backgroundColor,
        //                   width: bottomBarBorderWidth))),
        //       child: Icon(Icons.home_outlined),
        //     ),
        //     label: '',
        //   ),

        //   //Account or Profile

        //   BottomNavigationBarItem(
        //     icon: Container(
        //       width: bottomBarWidth,
        //       decoration: BoxDecoration(
        //           border: Border(
        //               top: BorderSide(
        //                   width: bottomBarBorderWidth,
        //                   color: _page == 1
        //                       ? GlobalVariables.selectedNavBarColor
        //                       : GlobalVariables.backgroundColor))),
        //       child: Icon(Icons.person_outlined),
        //     ),
        //     label: '',
        //   ),

        //   //Cart

        //   BottomNavigationBarItem(
        //     icon: Container(
        //       width: bottomBarWidth,
        //       decoration: BoxDecoration(
        //           border: Border(
        //               top: BorderSide(
        //                   width: bottomBarBorderWidth,
        //                   color: _page == 2
        //                       ? GlobalVariables.selectedNavBarColor
        //                       : GlobalVariables.backgroundColor))),
        //       child:
        //           // badges.Badge(
        //           //   badgeContent: Text('3'),
        //           //   child: Icon(Icons.settings),
        //           // )
        //           badges.Badge(
        //         badgeContent: const Text(
        //           "2",
        //           style: TextStyle(color: Colors.white),
        //         ),
        //         child: Icon(Icons.shopping_cart_outlined),
        //       ),
        //     ),
        //     label: '',
        //   ),
        ],
      ),
    );
  }
}
