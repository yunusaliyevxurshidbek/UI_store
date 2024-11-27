import 'package:flutter/material.dart';
import 'package:store/pages/info_page.dart';
import 'package:store/pages/message_page.dart';
import 'package:store/pages/signin_page.dart';
import 'package:store/pages/signup_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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

  String? _selectedLanguage;

  final List<String> _languages = ['O‘zbekcha', 'Русский', 'English'];

  String? _selectedCountry;

  final List<String> _countries = ['O‘zbekiston', 'Россия', 'USA', "Canada"];

  _callSignUpPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  _callSignInPage(){
    Navigator.of(context).pushReplacementNamed(SignInPage.id);
  }

  _callInfoPage(){
    Navigator.of(context).pushReplacementNamed(InfoPage.id);
  }

  _callMessagePage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MessagePage()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EvoStore",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {

            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              _callMessagePage();
            },
            icon: Icon(
              Icons.notifications,
              size: 27,
            ),
            color: Colors.white,
          ),
        ],
        backgroundColor: Color(0xFFFF5C00),
      ),
      drawer: Builder(
        builder: (BuildContext context) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Drawer Header',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {

                  },
                ),
              ],
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //! top_circle:
              Container(
                margin: EdgeInsets.only(top: 70, left: 30),
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

              SizedBox(height: 50),

              //! DropDown_language:
              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3)
                      ),
                    ],
                    color: Colors.white, // Oq fon
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.lightBlue, width: 2),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Select a language',style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.6),
                      ),),
                      value: _selectedLanguage,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                      iconSize: 30,
                      isExpanded: true,
                      style: TextStyle(color: Colors.black,fontSize: 18,),
                      items: _languages.map((language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          _selectedLanguage = newValue;
                        });
                      },
                    ),
                  ),
                ) ,
              ),
              SizedBox(height: 30,),
              //! DropDown_location:
              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3)
                      ),
                    ],
                    color: Colors.white, // Oq fon
                    borderRadius: BorderRadius.circular(10), // Burchaklarni yumaloqlash
                    border: Border.all(color: Colors.lightBlue, width: 2), // Chegara dizayni
                  ),

                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Text('Select a country',style: TextStyle(
                        fontSize: 17,
                        color: Colors.black.withOpacity(0.6),
                      ),),
                      value: _selectedCountry,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                      iconSize: 30,
                      isExpanded: true,
                      style: TextStyle(color: Colors.black,fontSize: 18,),
                      items: _countries.map((country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          _selectedCountry = newValue;
                        });
                      },
                    ),
                  ),
                ) ,
              ),
              SizedBox(height: 50),

              Container(
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                ),
                child: Text(
                  "Welcome to new era",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5C00),
                  ),
                ),
              ),
              SizedBox(height: 25),

              //! Image:
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 225,
                      width: 350,
                      child: Image.asset(
                        "assets/images/es.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 225,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),

              //! More_info:
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: (){
                        _callInfoPage();
                      },
                      child: Text("More info",style: TextStyle(
                        //color: Color(0xFFFF5C00),
                        color: Colors.lightBlue,
                        fontSize: 15,
                      ),),
                    ),
                    Transform.translate(
                      offset: Offset(-18, 0),
                      child: Icon(Icons.keyboard_arrow_right_sharp,
                      color: Colors.lightBlue,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),


              //! SignUp:
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  "Sign Up now",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF5C00),
                  ),
                ),
              ),
              SizedBox(height: 18),

              //! Animated_button:
              Container(
                margin: EdgeInsets.only(left: 30),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animation.value, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          _callSignUpPage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF5C00), // Tugma rangi
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        ),
                        child: Text(
                          "Press me",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),

              //! Chart:
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 225,
                      width: 350,
                      child: Image.asset(
                        "assets/images/chart1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 225,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.2),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),



              //!Already:
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),),
                    ScaleTransition(
                      scale: _controller.drive(Tween(begin: 1, end: 1.13)),
                      child: MaterialButton(
                        onPressed: (){
                          _callSignInPage();
                        },
                        child: Transform.translate(
                          offset: Offset(-13, 0),
                          child: Text("Sign In",style: TextStyle(
                            color: Color(0xFFFF5C00),
                          ),),
                        ),
                      ),
                    ),
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
