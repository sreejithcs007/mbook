import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mbook/utils/colors.dart';

import 'package:mbook/view/blog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BRegister extends StatefulWidget {
  @override
  State<BRegister> createState() => _BRegisterState();
}

class _BRegisterState extends State<BRegister> {
  final valid = GlobalKey<FormState>();
  final usercntrll = TextEditingController();
  final pascntrll = TextEditingController();
  late SharedPreferences shrd;

  String? pwd;
  bool pwd1 = true;
  bool showpwd2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
              key: valid,
              child:Stack(
                  children: [
              Container(
              height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.5,
                  image: AssetImage("assets/image/lbg2.jpg"),
                  fit: BoxFit.fill),
            ),
          ),

                    Positioned(
                        top: 200,
                        bottom: 130,
                        left: 30,
                        right: 30,
                        child: ClipPath(
                          clipper: WaveClipperOne(),

                          child: Container(
                            height: 300,
                            width: 380,
                            decoration: BoxDecoration(
                                color: btton.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: textt.withOpacity(0.3),
                                      blurRadius: 1,
                                      spreadRadius: 5),
                                ]),
                          ),
                        )),
                    Positioned(
                      top: 240,
                      left: 70,
                      right: 50,
                      bottom: 500,
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Text(
                          "CREATE ACCOUNT",
                          style: TextStyle(
                              color: textt, fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 320,
                        left: 50,
                        right: 50,
                        bottom: 400,
                        child: Container(
                            height: 100,
                            width: 100,
                            child: Padding(
                              padding: const EdgeInsets.only(),
                              child: TextFormField(
                                controller: usercntrll,
                                validator: (email) {
                                  if (email!.isEmpty ||
                                      !email.contains("@") ||
                                      !email.contains("gmail.com")) {
                                    return "Invalid email";
                                  }
                                },
                                decoration: InputDecoration(
                                    label: const Text("EMAIL"),
                                    prefixIcon: const Icon(Icons.email_outlined),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.red,width: 2),
                                        borderRadius: BorderRadius.circular(20))),
                              ),
                            ))),
                    Positioned(
                        top:410 ,
                        bottom:300 ,
                        left: 50,
                        right: 50,
                        child: Container(
                          child: TextFormField(
                            controller: pascntrll,
                            obscureText: pwd1,
                            obscuringCharacter: "*",
                            validator: (password) {
                              pwd = password;
                              if (password!.isEmpty || password.length < 6) {
                                return "password must not be empty or length should be greater than 6";
                              }
                            },
                            decoration: InputDecoration(
                                label: const Text("PASSWORD"),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (pwd1 == true) {
                                          pwd1 = false;
                                        } else {
                                          pwd1 = true;
                                        }
                                      });
                                    },
                                    icon: Icon(pwd1 == true
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        )),
                    Positioned(
                      top: 510 ,
                      bottom: 200 ,
                      left: 50,
                      right: 50,
          
                      child: Container(child: TextFormField(
                        validator: (confirmpassword){
                          if(confirmpassword!.isEmpty || pwd != confirmpassword){
                            return "password must be same";
                          }
                        },
          
                        obscureText: showpwd2,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
          
                            suffixIcon: IconButton(onPressed: (){
          
                              setState(() {
                                if(showpwd2 == true){
                                  showpwd2 = false;
                                }
                                else{
                                  showpwd2 = true;
                                }
                              });
                            }, icon: Icon(showpwd2 == true ? Icons.visibility_off : Icons.visibility)),
                            labelText: "Confirm Password",
                            border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                            hintText: "Confirm Password"),
                      ),
                      ),
                    ),
          
          
          
                    Positioned(
                        top: 600 ,
                        bottom: 230,
                        left: 100,
                        right: 100 ,
                        child: Container(
                          height: 100,
                          width: 50,
                          child: MaterialButton(
                            height: 100,
                            minWidth: 50,
                            onPressed: () {
                              final validkey = valid.currentState!.validate();
                              if (validkey == true) {
                                storeData();
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BLog()));
          
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    backgroundColor: btton,
                                    content: const Text("Invalid email / password")));
                              }
                            },
                            color: btton,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text("CREATE"),
                          ),
                        )),
                    Positioned(
                      top: 650,
                      bottom: 190,
                      left: 40,
                      right: 40,
                      child: Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text("OR"),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ]),
                      // Divider(
                      //   color: textt,
                      // ),
                    ),
          
                    Positioned(
                        top: 660,
                        bottom: 140,
                        left: 50,
                        right: 50,
                        child: Container(child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => BLog()));
                            },
                            child: Text("Already an User? LOGIN!",)),))
                  ],
              ),
          ),
        ),

    );
  }
  void storeData() async{
    String email = usercntrll.text.trim();
    String password = pascntrll.text.trim();
    shrd = await SharedPreferences.getInstance();
    shrd.setString("username", email);
    shrd.setString("pass", password);
  }
}