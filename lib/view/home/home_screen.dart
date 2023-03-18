import 'package:flutter/material.dart';
import 'package:news_app/view/home/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: TabBarView(
          children: [
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Bookmarked'),
            ),
          ],
        ),
      ),
    );
  }
}
