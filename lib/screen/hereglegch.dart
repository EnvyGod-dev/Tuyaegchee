import 'package:flutter/services.dart';
import 'package:baekseolmtx/api%20&%20bloc/api_controller.dart';
import 'package:baekseolmtx/models/userInfo.dart';
import 'package:baekseolmtx/screen/vndsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baekseolmtx/service/responsive_flutter.dart';
import 'package:baekseolmtx/widgets/text_form_field.dart';

class UserCreate extends StatefulWidget {
  final String? name;
  const UserCreate({Key? key, this.name}) : super(key: key);

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  bool isValid = false;
  final _formkey = GlobalKey<FormState>();
  final _dugaar = TextEditingController();
  final _ner = TextEditingController();
  final _email = TextEditingController();
  final _gerinhayg = TextEditingController();
  String? userName;
  var res;
  getUserData() async {
    res = await ApiManager.getUserData();
    print("res:::${res.result?.name}");
    userName = res.result?.name;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {});
    getUserData();
  }

  _burtgeh() async {
    if (_formkey.currentState!.validate()) {
      var map = new Map<String, dynamic>();
      map['phone'] = _dugaar.text;
      map['name'] = _ner.text;
      map['email'] = _email.text;
      map['address'] = _gerinhayg.text;
      map['password'] = '0';

      var res = await ApiManager.userCreate(map, context);
      if (res == true) {
        print("response::::${res}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 78.0),
                    child: Text(
                      '${userName ?? ''}',
                      style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 253, 255, 217),
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 253, 255, 217),
            ),
            elevation: MaterialStatePropertyAll<double>(0),
          ),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
          },
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 253, 255, 217),
      ),
      body: Container(
        height: ResponsiveFlutter.of(context).hp(100),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/back1.jpg'), fit: BoxFit.fill)),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: sizeHeight * 0.02,
              ),
              const Text(
                "Xэрэглэгч бүртгэх",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 34),
              ),
              SizedBox(
                height: sizeHeight * 0.02,
              ),
              CustomTextField(
                controller: _dugaar,
                label: 'Утасны дугаар',
                onChanged: (value) async {
                  if (value.length == 8) {
                    var map = new Map<String, dynamic>();
                    map['phone_number'] = value;
                    var res = await ApiManager.checkUserValidate(map, context);
                    isValid = res;
                    print("valid ${res}");
                    setState(() {});
                  }
                },
              ),
              isValid == true
                  ? Text(
                      "Хэрэглэгч бүртгэлтэй байна",
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(),
              isValid == true
                  ? SizedBox(
                      height: 10,
                    )
                  : Container(),
              CustomTextField(
                controller: _email,
                label: 'Хэрэглэгчийн мейл хаяг',
              ),
              CustomTextField(
                controller: _ner,
                label: 'Хэрэглэгчийн нэр',
              ),
              CustomTextField(
                controller: _gerinhayg,
                label: 'Хэрэглэгчийн гэрийн хаяг',
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                decoration: BoxDecoration(border: Border.all(color: Colors.white), color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: _burtgeh,
                  child: const Text(
                    "Бүртгүүлэх",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
