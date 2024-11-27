import 'package:flutter/material.dart';
import 'package:store/pages/signin_page.dart';
import 'home_page.dart';
import 'main_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {

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

  _callSignInPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  _callMainPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainPage()));
  }
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

              //! SignUp:
              Container(
                margin: EdgeInsets.only(top: 60,),
                width: 388,
                height: 58,
                child: Column(
                  children: [
                    Text("Sign Up",style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              //! Fullname:
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
                    hintText: "Fullname",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: "poppins",
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //! Email_adress:
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
                    prefixIcon: Icon(Icons.email,size: 30,color: Colors.grey,),
                    hintText: "Email adress",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              //! Phone_number:
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
                    prefixIcon: Icon(Icons.phone,size: 30,color: Colors.grey,),
                    hintText: "Phone number",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
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

              SizedBox(height: 35,),

              //! SignUp_button:
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
                  child: Text("Sign Up",style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),

              SizedBox(height: 8,),

              //! Or:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 135,
                    color: Colors.grey,
                  ),

                  Text(" Or ",style: TextStyle(
                      fontSize: 21,
                      //fontWeight: FontWeight.bold,
                      color: Colors.grey
                  ),),

                  Container(
                    height: 1,
                    width: 135,
                    color: Colors.grey,
                  ),
                ],
              ),

              SizedBox(height: 8,),

              //! SignUp_with:
              Text("Sign Up with",style: TextStyle(
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

              SizedBox(height: 25,),

              //! Bottom_part:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.6),
                    fontWeight: FontWeight.bold,
                  ),),
                  GestureDetector(
                    onTap: (){
                      _callSignInPage();
                    },
                    child: ScaleTransition(
                      scale: _controller.drive(Tween(begin: 1, end: 1.13)),
                      child: Text(" Sign In",style: TextStyle(
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