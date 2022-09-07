import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widgets/Big_Text.dart';
import 'package:food_delivery_app/Widgets/Small_Text.dart';
import 'package:food_delivery_app/home/food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
           Container(
      
      child:
       Container(
        margin: EdgeInsets.only(top: 45,bottom: 15),
        padding: EdgeInsets.only(left: 20,right: 20),
        
        child:
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              
              children: [
             // BigText(text: "Pakistan", color: Colors.cyan, size: 10,),
            
              BigText(text: "Pakistan", color: Colors.cyan, size: 20,),
              Row(
                children: [
                  SmallText(text: "Karachi",color: Colors.black54,),
                  Icon(Icons.arrow_drop_down_rounded)
                ],
              )

            ],
            ),


          
          Center(
            child: Container(
              width: 45,
              height: 45,
              child: Icon(Icons.search , color:Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.cyan
              ),
            ),
          )
          ],
        
          
        
        ),
        
      ),
      
       
      
    )
       
        , FoodPageBody() ],
    
    ),

    );
  }
}

class MyBigText extends StatelessWidget {

   String   text;
   double size;
   Color? color;
   MyBigText({
    Key? key,
     required this.text,
     
     this.size = 30,
     this.color = Colors.black
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Text( text, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: size  ,color: color, fontWeight: FontWeight.bold));
  }
}