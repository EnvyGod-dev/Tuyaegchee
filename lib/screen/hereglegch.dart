import 'package:lapp/screen/vndsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserCreate extends StatefulWidget {
  const UserCreate({super.key});

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  final _formkey = GlobalKey<FormState>();
  final _dugaar = TextEditingController();
  final _ner = TextEditingController();
  final _email = TextEditingController();
  final _gerinhayg = TextEditingController();

  _burtgeh() {
    if (_formkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => HomePage()),
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Амжилттай бүртгэлээ")));
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
                      "tester",
                      // "${widget.userName}",
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/back1.jpg'), fit: BoxFit.fill)),
        child: Form(
          key: _formkey,
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 48.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeHeight * 0.02,
                    ),
                    Text(
                      "Xэрэглэгч бүртгэх",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 34),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _dugaar,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "  Утасны дугаар хоосон байна";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('   Утасны дугаар'),
                            labelStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _email,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "  Хэрэглэгчийн майл хоосон байна";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('   Хэрэглэгчийн майл хаяг'),
                            labelStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _ner,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "  Хэрэглэгчийн нэр хоосон байна";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('   Хэрэглэгчийн нэр'),
                            labelStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextFormField(
                          controller: _gerinhayg,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "  Хэрэглэгчийн гэрийн хаяг хоосон байна";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text('   Хэрэглэгчийн гэрийн хаяг'),
                            labelStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: _burtgeh,
                          child: Text(
                            "Бүртгүүлэх",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
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
