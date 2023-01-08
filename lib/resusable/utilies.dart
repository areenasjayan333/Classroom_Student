import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../page/home_page.dart';
import '../page/placement_page.dart';
import '../page/result.dart';
import '../page/scholar_page.dart';

enum ProviderResponse {
  success,
  error,
  underMaintenance,
  wrongOtp,
  userExists,
  userDoesnotExist
}

void _onNavbarTap(int index, BuildContext context) {
  _currentIndex = index;
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: PageTransitionType.fade,
      child: _children[_currentIndex],
    ),
  );
}

int _currentIndex = 1;
final List<Widget> _children = [
  const Placementpage(),
  const HomePage(),
  const Scholarshippage(),
  const Resultpage(),
];

void handleBottomNavBar({required int index, required BuildContext context}) {
  _currentIndex = index;
  _onNavbarTap(index, context);
}

BottomNavigationBar bottomNavBar(BuildContext context) {
  return BottomNavigationBar(
    currentIndex: _currentIndex,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Theme.of(context).primaryColor,
    unselectedItemColor: Colors.white70,
    selectedItemColor: Colors.white,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.work,
        ),
        label: 'Placements',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book_sharp),
        label: 'Subjects',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school_sharp),
        label: 'Scholarship',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pending_actions_rounded),
        label: 'Result',
      ),
    ],
    onTap: (index) {
      _onNavbarTap(index, context);
    },
  );
}
