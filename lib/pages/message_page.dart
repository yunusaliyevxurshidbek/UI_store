import 'package:flutter/material.dart';

import 'home_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back,color: Colors.white,),
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
        ],
        title: Text("Messages",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),),
        centerTitle: true,
        //backgroundColor: Color(0xFFFF5C00),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 300),
              child: Center(
                child: Text("There no messages yet",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18
                ),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 25),
                    child: Text("Call-center",style: TextStyle(color: Colors.black.withOpacity(0.5)),)),
                Container(
                  margin: EdgeInsets.only(right: 20,bottom: 35),
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.support_agent_sharp),
                    iconSize: 40,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
