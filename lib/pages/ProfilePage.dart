import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/API/foodapi.dart';
import 'package:flutter_food_delivery/notifier/foodnotifier.dart';
import 'package:flutter_food_delivery/pages/UploadCard.dart';
import 'package:provider/provider.dart';
import 'DetailCard.dart';


class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {


  @override
  void initState() {
    // TODO: implement initState
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }
    // TODO: implement build
    return Scaffold(
      body:
      new RefreshIndicator(
          child: ListView.separated(
            itemBuilder: (BuildContext context , int index ){
            return ListTile(
              leading: Image.network(foodNotifier.foodList[index].image,width: 120,fit: BoxFit.fitWidth,),
              title: Text(foodNotifier.foodList[index].name),
              subtitle: Text(foodNotifier.foodList[index].category),
              onTap: (){
                foodNotifier.currentFood = foodNotifier.foodList[index];
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context ){
                  return DetailCard();
                }));

              },
            );
            },
              itemCount: foodNotifier.foodList.length,
              separatorBuilder: (BuildContext context, int index){
                return Divider(color: Colors.black);
              },

          ),
        onRefresh: _refreshList,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          foodNotifier.currentFood = null;
          Navigator.of(context).push((MaterialPageRoute(builder: (BuildContext context){
            return UploadCard(isUpdating: false,);
          })));
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),

    );
  }
}