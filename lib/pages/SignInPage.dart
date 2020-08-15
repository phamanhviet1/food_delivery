

import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/Screen/MainScreen.dart';
import 'package:flutter_food_delivery/models/authgoogle.dart';
import 'package:flutter_food_delivery/pages/SignUpPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


class SignInPage extends StatefulWidget{

  @override
  _SignInPageState createState() => _SignInPageState();

}

class _SignInPageState extends State<SignInPage> {





  @override
  void initState (){

    super.initState();

        }
  bool _toggleVisibility = true;
  Widget _buildEmailTextField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: " Your email or username",
        hintStyle: TextStyle(
          color:Colors.grey,
          fontSize: 18.0
        )
      ),
    );
  }
  Widget _buildPassWordTextField(){
    return TextFormField(
      decoration: InputDecoration(
          hintText: " Your Password",
          hintStyle: TextStyle(
              color:Colors.grey,
              fontSize: 18.0
          ),
        suffixIcon: IconButton(
            onPressed: (){
              setState(() {
                _toggleVisibility =! _toggleVisibility;
              });
            },
          icon: _toggleVisibility ? Icon(Icons.visibility_off):Icon(Icons.visibility),
        )

      ),
      obscureText: _toggleVisibility,
    );
  }

  @override
  Widget build(BuildContext context) {
    Authentication authentication = Provider.of<Authentication>(context);
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
          body: Column(
            children: <Widget>[
             SizedBox(height: 100,),
             Center( child: Text("Sign In",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold)),),
             SizedBox(height: 100,),
             Row(
               mainAxisAlignment:  MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgotten Password ?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
          ],
        ),
             SizedBox(height: 20,),
              Card(
              child: Padding(
                   padding: const EdgeInsets.all(20.0),
                 child: Column(
                    children: <Widget>[
                    _buildEmailTextField(),
                    _buildPassWordTextField(),
              ],
            ),
          ),
        ),
              SizedBox(height: 50,),
              Container(height: 50,
                  decoration: BoxDecoration(
                   color: Colors.blue, borderRadius: BorderRadius.circular(20)
                  ),
                child: Center(child: FlatButton(
                  onPressed: (){
                          authentication.signInWithGoogle().whenComplete(() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MainScreen())));





                      },
                    child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20),)),),
                    ),
              SizedBox(height: 20,),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text("Don't have an account ?",style: TextStyle(fontSize: 12,color: Colors.grey)),
                GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                   },
                   child: Text("Sign Up ",style: TextStyle(fontSize: 15,color: Colors.blue,fontWeight: FontWeight.bold))),
          ],
        ),
              Center(child: Card(child: FlatButton(
                  onPressed: (){
                    authentication.signInWithGoogle().whenComplete(() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => MainScreen())));

                  },
                  child: Image(image: AssetImage("assets/images/google_logo.png"), height: 35.0)),))



      ],
    ));
  }



}