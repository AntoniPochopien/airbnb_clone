import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import './screens/main_page.dart';
import 'data/data_provider.dart';

StreamController<int> streamController = StreamController<int>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainPage(streamController.stream),
      ),
    );
  }
}
