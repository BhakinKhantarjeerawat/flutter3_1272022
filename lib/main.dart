import 'package:flutter/material.dart';
import 'package:flutter3_1272022/const/productProvider.dart';
import 'package:provider/provider.dart';

import 'main_screens/customer_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MaterialApp(
        home: CustomerHomeScreen()
      ),
    );
  }
}

