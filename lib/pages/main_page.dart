import 'package:flutter/material.dart';

import 'addcard_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {

  static const String id = "main_page";

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  _callAddCardPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCardPage()),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Everything starts here",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.home,color: Colors.white,),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Color(0xFF004466),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            height: 120,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  padding: EdgeInsets.only(bottom: 10,right: 8),
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [Color(0xFF00C6FF), Color(0xFF0072FF)], // Ko'k gradient
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55,top: 65),
                    child: Stack(
                      children: [
                        Text("VIRTUAL CARD",style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("**** **** **** 9275",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black
                      ),),
                      Text("11/25",style: TextStyle(
                        fontSize: 18,
                      ),)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  _callAddCardPage();
                },
                child: Icon(Icons.add_circle_sharp,size: 36,
                color: Color(0xFF004466),
                ),
              ),
              Text("Add yours",style: TextStyle(
                color: Colors.black.withOpacity(0.4),
                fontSize: 30
              ),),
            ],
          ),
          SizedBox(height: 25,),
          Image(
            image: AssetImage("assets/images/qr.jpg",),
            height: 180,
            width: 180,
          ),

          //Bottom_button:
          Expanded(child: SizedBox.shrink()),
          GestureDetector(
            onTap: (){
              _callAddCardPage();
              },
            child: Container(
              margin: EdgeInsets.only(left: 15,right: 15,bottom: 40),
              //color: Colors.blue,
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF004466),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text("Add Card",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
