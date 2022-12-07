import 'package:lapp/screen/vndsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZahialgaPage extends StatefulWidget {
  const ZahialgaPage({super.key});

  @override
  State<ZahialgaPage> createState() => _ZahialgaPageState();
}

class _ZahialgaPageState extends State<ZahialgaPage> {
  final _formkey1 = GlobalKey<FormState>();
  final btoo = TextEditingController();
  final zdugaar = TextEditingController();
  final zner = TextEditingController();
  final zgeriinhayg = TextEditingController();
  final zmail = TextEditingController();
  _zahialah() {
    if (_formkey1.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => HomePage())));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("амжилттай захиаллаа")));
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
              image: AssetImage('images/back1.jpg'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Form(
            key: _formkey1,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeHeight * 0.05,
                    ),
                    Text(
                      "Захиалга",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "            Хоосон байж болохгүй тул талбарыг гүйцээнэ үү!!";
                              } else {
                                return null;
                              }
                            },
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text("   Бренд 1"),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text("   Бараа бренд 1"),
                              ),
                            ],
                            onChanged: ((value) {})),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null || value.toString().isEmpty) {
                                return "            Хоосон байж болохгүй тул талбарыг гүйцээнэ үү!!";
                              } else {
                                return null;
                              }
                            },
                            items: [
                              DropdownMenuItem(
                                value: "1",
                                child: Text("   Бренд 1"),
                              ),
                              DropdownMenuItem(
                                value: "2",
                                child: Text("   Бараа бренд 1"),
                              ),
                            ],
                            onChanged: ((value) {})),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 9),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: btoo,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "            Бүтээгдэхүүнийн тоо хоосон байж болохгүй";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text("   Бүтээгдэхүүний тоо ширхэг"),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 9),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: zdugaar,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "            захиалагчийн дугаар хоосон байж болохгүй";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text("   Захиалагчийн дугаар"),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 9),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: zner,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "            Захиалагчийн нэр хоосон байж болохгүй";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text("   Захиалагчийн нэр"),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 9),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: zmail,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "            Захиалагчийн майл хаяг хоосон байж болохгүй";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text("   Захиалагчийн майл хаяг"),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        // padding: EdgeInsets.only(top: 9),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          controller: zgeriinhayg,
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "            Захиалагчийн гэрийн хаяг хоосон байж болохгүй";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            label: Text("   Захиалагчийн гэрийн хаяг"),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: _zahialah, child: Text("захиалах"))
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
