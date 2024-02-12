import 'package:flutter/material.dart';
import 'package:mbook/view/Mainpage.dart';
import 'package:mbook/view/breg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../utils/colors.dart';

class BLog extends StatefulWidget {
  const BLog({super.key});

  @override
  State<BLog> createState() => _BLogState();
}

class _BLogState extends State<BLog> {
  final usercntrll = TextEditingController();

  final pascntrll = TextEditingController();

  late bool newUser;

  String? pwd;

  bool pwd1 = true;

  bool showpwd2 = true;

  final valid = GlobalKey<FormState>();

  late SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: valid,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.5,
                      image: AssetImage("assets/image/lbg2.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
              Positioned(
                  top: 200,
                  bottom: 150,
                  left: 30,
                  right: 30,
                  child: ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 200,
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
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                        color: textt,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                  top: 350,
                  left: 50,
                  right: 50,
                  bottom: 400,
                  child: SizedBox(
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
                            return null;
                          },
                          decoration: InputDecoration(
                              label: const Text("EMAIL"),
                              prefixIcon: const Icon(Icons.email_outlined),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ))),
              Positioned(
                  top: 450,
                  bottom: 300,
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
                        return null;
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
                  top: 550,
                  bottom: 280,
                  left: 100,
                  right: 100,
                  child: SizedBox(
                    height: 100,
                    width: 50,
                    child: MaterialButton(
                      height: 100,
                      minWidth: 50,
                      onPressed: () {
                        final validkey = valid.currentState!.validate();
                        if (validkey == true) {
                          validateInputs();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: btton,
                              content: const Text("Invalid email / password")));
                        }
                      },
                      color: btton,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: const Text("LOGIN"),
                    ),
                  )),
              Positioned(
                top: 570,
                bottom: 180,
                left: 40,
                right: 40,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  const Text("OR"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: const Divider(
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
                  top: 630,
                  bottom: 160,
                  left: 50,
                  right: 50,
                  child: Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BRegister()));
                        },
                        child: const Text(
                          "Not an User? SIGN UP!",
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void validateInputs() async {
    String uname = usercntrll.text;
    String upass = pascntrll.text;

    preferences = await SharedPreferences.getInstance();

    //if a user is logged in then mark it as not a new user
    preferences.setBool("newuser", false);

    String? storedUname = preferences.getString("username");
    String? storedUpass = preferences.getString("pass");

    if (storedUname == uname && storedUpass == upass) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const MainPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: btton,
          content: const Text("Invalid email / password")));
    }
  }
}
