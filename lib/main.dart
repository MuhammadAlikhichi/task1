import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.amber,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _fromkey = GlobalKey<FormState>();
  RegExp phone_valid =
      RegExp(r"^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$");
  bool validatePhone_no(String pass) {
    String _Phone_no = pass.trim();
    if (phone_valid.hasMatch(_Phone_no)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Login Page",
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _fromkey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.mail),
                      Text(
                        "Flutter",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Password", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLength: 13,
                    validator: (value) {
                      if (value!.isEmpty) {
                        print("please enter phone number");
                      } else {
                        bool result = validatePhone_no(value);
                        if (result) {
                          return null;
                        } else {
                          return "Just enter pakistan phone number";
                        }
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Phone_No", border: OutlineInputBorder()),
                  ),
                ),
                Text(
                  "forget password",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      _fromkey.currentState?.validate();
                    },
                    child: Text("Login")),
                // Container(
                //   height: 35,
                //   width: 200,
                //   child: Center(
                //     child: Text(
                //       "Login",
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //       ),
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.circular(10.0),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "new user? creat account",
                  style: TextStyle(
                      //color: Colors.blue,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
