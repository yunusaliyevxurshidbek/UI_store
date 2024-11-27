import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/pages/main_page.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});


  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {


  _callCardList(){
    Navigator.of(context).pushReplacementNamed(MainPage.id);
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Card",style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 180,
                    width: 320,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00C6FF), Color(0xFF0072FF)], // Ko'k gradient
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 110),
                    child: Text(
                      "xxxx xxxx xxxx xxxx",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 160),
                    child: Text(
                      "DD/YY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
        
            ),
        
        
            Container(
              margin: EdgeInsets.all(50),
              //color: Colors.grey,
              child: Text("Enter expiration date",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
            ),
        
            SizedBox(height: 10,),
        
            // Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "**** **** **** ****",
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number, // Raqamli klaviatura
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  _AutoSlashFormatter(),
                ],
                decoration: InputDecoration(
                  hintText: "dd/yy",
                  hintStyle: TextStyle(fontSize: 30,
                    color: Colors.black.withOpacity(0.4),),
                ),
                textAlign: TextAlign.center,
              ),
            ),
        
            //!Expanded(child: SizedBox.shrink()),
            GestureDetector(
              onTap: (){
                _callCardList();

        
              },
              child: Container(
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 40,top: 100),
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
      ),
    );
  }
}

class _AutoSlashFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Yangi matn
    final text = newValue.text;

    // Slash formatini yaratish
    if (text.length > 2 && !text.contains('/')) {
      final formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }

    // Slash joyida qoladi, faqat boshqa harakatlar
    return newValue;
  }
}