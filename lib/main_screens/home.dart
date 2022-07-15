import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter3_1272022/categories/store_screen.dart';
import '../widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const CupertinoSearchTextField(),
          // const Fake_Search(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.red,
            // indicatorWeight: 3,
            tabs: [
              // ElevatedButton(onPressed: (){},
              //     child: Text('test tab bar')),
              // ElevatedButton(onPressed: (){},
              //     child: Text('test tab bar')),
              RepeatedTap(label:"Men"),
              RepeatedTap(label:"Women"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StoreScreen(selectedCategory: 'men'),
            StoreScreen(selectedCategory: 'women'),
            // WomenCategory(),
          ],
        ),
      ),
    );
  }
}


class RepeatedTap extends StatelessWidget {
  const RepeatedTap({ required this.label,
    Key? key,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
      label,
      style: const TextStyle(color: Colors.grey),
    ));
  }
}
