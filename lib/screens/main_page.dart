import 'package:flutter/material.dart';

import 'discover_screen.dart';
import 'mail_box_screen.dart';
import 'profile_screen.dart';
import 'trips_screen.dart';
import 'wish_list_screen.dart';

class MainPage extends StatefulWidget {
  final Stream<int> stream;

  MainPage(this.stream);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.stream.listen((value) {
      changeIndex(value);
    });
  }

  void changeIndex(value) {
    setState(() {
      currentIndex = value;
    });
  }

  final screens = [
    DiscoverScreen(),
    WishList(),
    TripsScreen(),
    const MailBoxScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Wish List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trip_origin),
              label: 'trips',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.messenger_outline),
              label: 'Mail Box',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ]),
    );
  }
}
