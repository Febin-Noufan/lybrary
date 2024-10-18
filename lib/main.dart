
import 'package:book/features/home/data/book_bloc.dart';
import 'package:book/features/home/presentation/pages/bottom.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home:BlocProvider(
        create: (context) => BookBloc(),
        child: CustomBottomNavigationBar(), 
      ), );
  }
}
