import 'package:lapp/models/userInfo.dart';
import 'package:lapp/screen/jolooch.dart';
import 'package:lapp/screen/vndsen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lapp/api & bloc/api_controller.dart';
import 'package:lapp/service/responsive_flutter.dart';
import 'package:lapp/widgets/alert_dialogs.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum Role { delivery, seller }

class _LoginPageState extends State<LoginPage> {
  Role? _role;
  Userinfo? data = Userinfo();
  final formKey = GlobalKey<FormState>();
  final loginName = TextEditingController();
  final loginpass = TextEditingController();
  String? role;
  bool isSeller = false;
  bool isDel = false;

  AjiltanEnum ajiltan = AjiltanEnum.seller;
  Future _loginButton() async {
    if (formKey.currentState!.validate()) {
      var map = new Map<String, dynamic>();
      map['phone'] = loginName.text;
      map['password'] = loginpass.text;
      var response = await ApiManager.login(map, context);
      if (response.role == role) {
        if (response.role == 'seller') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => HomePage()),
            ),
          );
        }
        if (response.role == 'delivery') {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => DeliveryPage())));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Нэвтрэх эрхээ зөв сонгоно уу")));
      }
    }
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: ResponsiveFlutter.of(context).hp(100),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.jpg'), fit: BoxFit.fill),
        ),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image(
                      image: AssetImage('images/baekseol.png'),
                      width: sizeWidth * 15,
                      height: sizeHeight * 0.17,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Radio<Role>(
                              value: Role.seller,
                              groupValue: _role,
                              onChanged: (Role? value) {
                                setState(() {
                                  _role = value;
                                  if (value == Role.seller) {
                                    isSeller = true;
                                    role = 'seller';
                                    print("role:::${role}");
                                  }
                                });
                              },
                            ),
                            Text(
                              "Борлуулагч",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<Role>(
                              value: Role.delivery,
                              groupValue: _role,
                              onChanged: (Role? value) {
                                setState(() {
                                  _role = value;
                                  if (value == Role.delivery) {
                                    role = 'delivery';
                                    print("role:::${role}");
                                  }
                                });
                              },
                            ),
                            Text(
                              "Жолооч",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: TextFormField(
                        controller: loginName,
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return "Нэвтрэх нэр/Утасны дугаар хоосон байна";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text("Нэвтрэх нэр/Утасны дугаар"),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                          border: InputBorder.none,
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
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: _loginButton,
                        child: Text(
                          "Нэвтрэх",
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _isSeller({String? text, String? value, bool isTap = false}) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              role = value;
              isSeller = !isSeller;
              print("object${role} ${isSeller}");
              setState(() {});
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(
                  width: 5,
                  color: isSeller ? Colors.cyanAccent : Colors.transparent,
                ),
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          text!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  _isDeliver({String? text, String? value, bool isTap = false}) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              role = value;
              isDel = !isDel;
              print("object${role} ${isDel}");
              setState(() {});
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(
                  width: 5,
                  color: isDel
                      ? !isSeller
                          ? Colors.green
                          : Colors.transparent
                      : Colors.transparent,
                ),
              ),
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          text!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

enum AjiltanEnum { seller, deliver }
