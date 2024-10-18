import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_application/core/cart/cubit/cart_cubit.dart';
import 'package:food_application/core/home/cubit/home_cubit.dart';
import 'package:food_application/details/cart_provider.dart';
import 'package:food_application/homescreen/home.dart';
import 'package:food_application/loginscreen/login.dart';
import 'package:food_application/walkthroughapp/walk1.dart';
import 'package:food_application/welcomescreen/welcome.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CartCubit()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Walk1(),
      ),
    );
  }
}
