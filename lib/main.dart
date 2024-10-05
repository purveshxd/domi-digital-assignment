import 'package:domi_labs_assignment/card/cubit/card_view_cubit.dart';
import 'package:domi_labs_assignment/maps/cubit/maps_cubit.dart';
import 'package:domi_labs_assignment/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapsCubit(),
        ),
        BlocProvider(
          create: (context) => CardViewCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
