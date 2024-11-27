import 'package:flutter/material.dart';
import 'package:store/pages/main_page.dart';
import 'package:store/pages/signup_page.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  static const String id = "signin_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  _callMainPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  _callSignUpPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.black,),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //! Top_circle:
              Container(
                margin: EdgeInsets.only(top: 90, left: 5),
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF5C00),
                ),
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(Icons.shopping_cart_sharp,
                      color: Colors.white,
                      size: 45,
                    )
                ),
              ),
              SizedBox(height: 20,),

              //! SignIn:
              Container(
                margin: EdgeInsets.only(top: 60,),
                width: 388,
                height: 58,
                child: Column(
                  children: [
                    Text("Sign In",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 15,),

              //! Username:
              Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.only(top: 12,left: 15),
                height: 64,
                width: 366,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3)
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person,size: 30,color: Colors.grey,),
                    hintText: "username",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: "poppins",
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),


              //!Password:
              Container(
                margin: EdgeInsets.only(left: 5),
                padding: EdgeInsets.only(top: 12,left: 15),
                height: 64,
                width: 366,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3)
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline,size: 30,color: Colors.grey,),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 100,),

              //! SignIn_button:
              GestureDetector(
                onTap: (){
                  _callMainPage();
                },
                child: Container(
                  height: 64,
                  width: 366,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFF5C00),
                  ),
                  child: Text("Sign In",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),

              SizedBox(height: 15,),

              //! Or:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 133,
                    color: Colors.grey,
                  ),

                  Text(" Or ",style: TextStyle(
                      fontSize: 21,
                      color: Colors.grey
                  ),),

                  Container(
                    height: 1,
                    width: 133,
                    color: Colors.grey,
                  ),
                ],
              ),

              SizedBox(height: 8,),

              //! SignIn_with:
              Text("Sign In with",style: TextStyle(
                color: Color(0xFFFF5C00),
                fontSize: 16,
              ),),

              SizedBox(height: 8,),

              //! Bottom_icons:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook,size: 30,color: Colors.black,),
                  SizedBox(width: 25,),
                  Image(
                    image:
                    AssetImage("assets/images/amazon.png",),
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(width: 25,),
                  //Icon(FontAwesomeIcons.xTwitter,size: 30,color: Colors.black,),
                  Image(
                    image:
                    AssetImage("assets/images/x.png",),
                    height: 27,
                    width: 27,
                  ),
                ],
              ),

              SizedBox(height: 80,),

              //! Bottom_part:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),),
                  GestureDetector(
                    onTap: (){
                      _callSignUpPage();
                    },
                    child: ScaleTransition(
                      scale: _controller.drive(Tween(begin: 1, end: 1.13)),
                      child: Text(" Sign Up",style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFFF5C00),
                        fontWeight: FontWeight.bold,

                      ),),
                    ),
                  ),

                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
