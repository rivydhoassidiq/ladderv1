import 'package:flutter/material.dart';
import 'package:ladder/app/modules/chat/views/chat_view.dart';
import 'package:ladder/app/modules/home/views/home_view.dart';
import 'package:ladder/app/modules/order/views/order_view.dart';
import 'package:ladder/app/modules/profile/views/profile_view.dart';
import 'package:ladder/app/utils/theme.dart';

class BottomNavBarr extends StatefulWidget {
  const BottomNavBarr({Key? key}) : super(key: key);

  @override
  _BottomNavBarrState createState() => _BottomNavBarrState();
}

class _BottomNavBarrState extends State<BottomNavBarr> {
  int _selectedIndex = 0;

  final _screens = [
    HomeView(),
    OrderView(),
    ChatView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
        ),
        bottomNavigationBar: Material(
          child: Container(
            height: 66,
            child: TabBar(
              indicatorColor: bottomBlueColor,
              indicatorWeight: 2,
              indicatorPadding:
                  const EdgeInsets.only(right: 29, top: 0, bottom: 0, left: 29),
              indicator: BoxDecoration(
                border: Border(
                  top: BorderSide(color: bottomBlueColor, width: 3),
                ),
              ),
              labelStyle: boldText8,
              labelColor: bottomBlueColor,
              unselectedLabelColor: sliderColor,
              onTap: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
              tabs: [
                Tab(
                  icon: Image.asset(
                    'assets/icons/home.png',
                    height: 24,
                    width: 24,
                    color: _selectedIndex == 0 ? bottomBlueColor : sliderColor,
                    // color: bottomBlueColor,
                  ),
                  text: "Home",
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/order.png',
                    color: _selectedIndex == 1 ? bottomBlueColor : sliderColor,
                    height: 24,
                    width: 24,
                  ),
                  text: "Order",
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/chat.png',
                    height: 24,
                    width: 24,
                    color: _selectedIndex == 2 ? bottomBlueColor : sliderColor,
                  ),
                  text: "Chat",
                ),
                Tab(
                  icon: Image.asset(
                    'assets/icons/profilepict.png',
                    height: 24,
                    width: 24,
                    color: _selectedIndex == 3 ? bottomBlueColor : sliderColor,
                  ),
                  text: "Profile",
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: _screens
                .asMap()
                .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    )))
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
