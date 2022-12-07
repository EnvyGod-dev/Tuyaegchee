import 'package:lapp/screen/jolooch.dart';
import 'package:lapp/screen/vndsen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lapp/api & bloc/api_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final loginName = TextEditingController();
  final loginpass = TextEditingController();
  AjiltanEnum ajiltan = AjiltanEnum.Borluulagch;
  Future _loginButton() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    var map = new Map<String, dynamic>();
    // map['phone'] = loginName.text;
    // map['password'] = loginpass.text;
    // var response = await ApiManager.login(map);
    if (formKey.currentState!.validate()) {
      if (ajiltan == AjiltanEnum.Borluulagch) {
        // if (response.role == 'seller') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => HomePage()),
          ),
        );
      } else {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text("Aldaa")));
        // }

        // if (response.role == "delivery") {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => DeliveryPage())));
        // } else {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Aldaa")));
        // }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.jpg'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Image(
                        image: AssetImage('images/baekseol.png'),
                        width: sizeWidth * 15,
                        height: sizeHeight * 0.17,
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                            value: AjiltanEnum.Borluulagch,
                            groupValue: ajiltan,
                            onChanged: ((value) {
                              if (value != null) {
                                setState(() {
                                  ajiltan = value;
                                });
                              }
                            })),
                        Text("Борлуулагч",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                            value: AjiltanEnum.Hvrgegch,
                            groupValue: ajiltan,
                            onChanged: ((value) {
                              if (value != null) {
                                setState(() {
                                  ajiltan = value;
                                });
                              }
                            })),
                        Padding(
                          padding: const EdgeInsets.only(right: 45.0),
                          child: Text(
                            "Жолооч",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: TextFormField(
                            controller: loginName,
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "Нэвтрэх нэр Утасны дугаар хоосон байна";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Нэвтрэх нэр Утасны дугаар"),
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 28.0),
                          child: TextFormField(
                            controller: loginpass,
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "Нууц үг хоосон байна ";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              label: Text("Нууц үг"),
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 112.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: _loginButton,
                            child: Text(
                              "Нэвтрэх",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AjiltanEnum { Borluulagch, Hvrgegch }
