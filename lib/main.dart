import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sqflite/cubit/cubit.dart';
import 'package:local_sqflite/cubit/states.dart';
import 'package:local_sqflite/view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..initDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              primarySwatch: Colors.grey,
            ),
            home: ViewScreen() ,
          );
        },
      ),
    );
  }
}

