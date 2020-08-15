import 'package:flutter/material.dart';

import 'package:flutter_food_delivery/Screen/MainScreen.dart';
import 'package:flutter_food_delivery/models/authgoogle.dart';
import 'package:flutter_food_delivery/notifier/foodnotifier.dart';
import 'package:flutter_food_delivery/pages/HomePage.dart';
import 'package:flutter_food_delivery/pages/OrderPage.dart';
import 'package:flutter_food_delivery/pages/ProfilePage.dart';
import 'package:flutter_food_delivery/pages/SignInPage.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'notifier/authNotifier.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => Authentication(),
    ),
    ChangeNotifierProvider(
      create: (context) => FoodNotifier(),
    ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Consumer<Authentication>(
        builder: (context, notifier, child) {
          print(notifier.signInWithGoogle().toString());
          return notifier.signInWithGoogle() != null ? MainScreen() : SignInPage() ;
        },
      ),
    );
  }
}

