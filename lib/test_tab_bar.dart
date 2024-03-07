import 'package:flutter/material.dart';

class TabBarTest extends StatefulWidget {
  const TabBarTest({super.key});

  @override
  State<TabBarTest> createState() => _TabBarTestState();
}

class _TabBarTestState extends State<TabBarTest>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Center(
        child: Column(
          children: [
            Text('Container 1'),
            Container(
              color: Colors.green,
              height: 150,
              width: 200,
            ),
            Text('Container 2'),
            Container(
              color: Colors.greenAccent,
              height: 150,
              width: 200,
            ),
            Text('Container 3'),
            Container(
              color: Colors.lightGreen,
              height: 150,
              width: 200,
            ),
            TabBar(controller: tabController, tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ]),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
     
    );
  }
}
