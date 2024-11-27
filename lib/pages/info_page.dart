import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_page.dart';

class InfoPage extends StatefulWidget {
  static const String id = "info_page";
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  // void _launchURL(String url) async {
  //   final Uri uri = Uri.parse(url); // URLni Uri ga aylantiramiz
  //   if (await canLaunchUrlString(uri.toString())) {
  //     await launchUrlString(uri.toString());
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informations',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFF5C00),
        elevation: 0,
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
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFA726), // Gradientning yuqori qismi (yorqinroq rang)
              Color(0xFFFF7043),
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 35, top: 35),
                child: Text(
                  "About us:",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  '''
EvoStore:

- Open hours: 8:00-1:00
- Close hours: 1:00-7:00
- Temporarily closed: The store is closed due to maintenance, holidays, renovations, or unforeseen circumstances.
- Sanitation in Progress: Closed temporarily for deep cleaning.
- Fully Stocked: All items are available for purchase.
- Out of Stock: Specific items or categories are unavailable.
- Limited Services: Some services, like online delivery, may be unavailable.
- Special Services Available: Exclusive discounts or loyalty rewards are active.
                  ''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Container(
                margin: EdgeInsets.only(left: 22),
                child: Column(
                  children: [
                    Text("Vibe",style: TextStyle(
                      color: Colors.teal,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e3.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e1.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    Text("Minimalistic",style: TextStyle(
                      color: Colors.limeAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e2.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e4.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e5.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    Text("Quality",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e6.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 225,
                        width: 350,
                        child: Image.asset(
                          "assets/images/e7.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: 150,),


                    Text("Follow us on social media",style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                          iconSize: 30,
                          onPressed: (){} //!=> _launchURL('https://youtube.com'),
                        ),
                        SizedBox(width: 15,),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                          iconSize: 30,
                          onPressed: () {}//!=> _launchURL('https://facebook.com'),
                        ),
                        SizedBox(width: 15,),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
                          iconSize: 30,
                          onPressed: () {}//! => _launchURL('https://instagram.com'),
                        ),
                      ],
                    ),
                    Text("All rights reserved",style: TextStyle(
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 10,
                      //fontWeight: FontWeight.bold,
                    ),),



                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
