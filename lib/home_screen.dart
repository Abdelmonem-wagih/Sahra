// ignore_for_file: must_be_immutable

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sahar/features/movies/presentation/screens/movies_screen.dart';
import 'package:sahar/features/tvs/presentation/screens/tv_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key, required this.currentPageIndex});
   int currentPageIndex;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.currentPageIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        
        controller: _pageController,
        children: [
          MoviesScreen(),
          TVsScreen(),
        ],
       
      ),
      backgroundColor: Colors.black,
      
      bottomNavigationBar:CurvedNavigationBar(
        height: 60,
        index: widget.currentPageIndex,
        onTap: (index) {
         _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        backgroundColor: Colors.white12,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        items: [
           SvgPicture.asset(
              'assets/icons/movie.svg',
              color: Colors.white,
              height: 40,
              width: 40,
            ),
           SvgPicture.asset(
              'assets/icons/tv.svg',
              color: Colors.white,
              height: 40,
              width: 40,
            ),
        ],
      )
      //  BottomNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   currentIndex: widget.currentPageIndex,
        
      //   items: [
      //     BottomNavigationBarItem(
      //       tooltip: 'Movie',
      //       icon: SvgPicture.asset(
      //         'assets/icons/movie.svg',
      //         color: Colors.white,
      //         height: 40,
      //         width: 40,
      //       ),
      //       label: 'Movie',
      //     ),
      //     BottomNavigationBarItem(
      //       tooltip: 'TV',
      //       icon: SvgPicture.asset(
      //         'assets/icons/tv.svg',
      //         color: Colors.white,
      //         height: 40,
      //         width: 40,
      //       ),
      //       label: 'TV',
      //     ),
      //   ],
      //   onTap: (index) {
      //     _pageController.animateToPage(
      //       index,
      //       duration: Duration(milliseconds: 300),
      //       curve: Curves.easeInOut,
      //     );
      //   },
      // ),
    );
  }
}
