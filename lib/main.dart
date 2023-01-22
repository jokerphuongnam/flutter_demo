import 'package:flutter_demo/uis/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'uis/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale('en', 'US'),
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
