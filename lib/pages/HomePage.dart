import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/Screen/MainScreen.dart';
import 'package:flutter_food_delivery/Widget/ProductFood.dart';
import 'package:flutter_food_delivery/Widget/categories.dart';
import 'package:flutter_food_delivery/models/authgoogle.dart';
import 'package:flutter_food_delivery/notifier/authNotifier.dart';
import 'package:flutter_food_delivery/pages/SignInPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{


  @override
  _HomePageState createState() => _HomePageState();

  }

class _HomePageState extends State<HomePage>{

  User user =User();
  void initState() {
    // TODO: implement initState


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Authentication authentication = Provider.of<Authentication>(context);
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RichText(text: TextSpan(children: [
                  TextSpan(text: 'What would\n',style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.w700)),
                  TextSpan(text: 'you like to eat?',style: TextStyle(fontSize: 23,color: Colors.black,fontWeight: FontWeight.w500))
                ]),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[

                    FlatButton(
                      onPressed: (){
                        if(authentication != null) { authentication.signOutOfGoogle().whenComplete(() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignInPage())));
                        }},
                      child: Card(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${user.email}'),
                      )),
                        ),
                     Icon(Icons.notifications_none,color: Theme.of(context).primaryColor),
                  ],
                ),


              )
            ],
          ),
          Container(
            
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 1),
                blurRadius: 4
              )],
              borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              leading: Icon(Icons.search,color: Colors.blueGrey,),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Search any Food",
                  border: InputBorder.none
                ),
              ),
            )
          ),
          SizedBox(height: 10,),
          Categories(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Frequently Bought Foods",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                GestureDetector(
                    onTap: (){},
                    child: Text("View All",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.orange),),

                )
              ],
            ),
          ),
          ProductFood(),






        ],
      ),
    );
  }

}



