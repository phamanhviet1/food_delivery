import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/pages/FavoritePage.dart';
import 'package:flutter_food_delivery/pages/HomePage.dart';
import 'package:flutter_food_delivery/pages/OrderPage.dart';
import 'package:flutter_food_delivery/pages/ProfilePage.dart';
import 'package:flutter_food_delivery/pages/SignInPage.dart';
class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
  }

class _MainScreenState extends State<MainScreen>{


  int currentTabIndex = 0;
  List <Widget> pages;
  Widget currentPage;
  HomePage homePage;
  OrderPage orderPage;
  FavoritePage  favoritePage;
  ProfilePage profilePage;
  SignInPage signInPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage = HomePage();
    orderPage = OrderPage();
    favoritePage = FavoritePage();
    profilePage = ProfilePage();
    signInPage = SignInPage();
    pages=[ homePage , orderPage, profilePage , signInPage ];
    currentPage = homePage;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
              }
          );
        },
          currentIndex: currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text("Order")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Favorite")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile")),

          ]
        ),
    );
  }
}

