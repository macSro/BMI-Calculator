import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets/bloc_wrapper.dart';
import 'widgets/home/home_bloc_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocWrapper(
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeBlocWrapper(),
      ),
    );
  }
}
