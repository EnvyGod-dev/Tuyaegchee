import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapp/screen/login.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  // Userinfo? data = Userinfo();
  DateTime dateTime = DateTime.now();
  final _formkey = GlobalKey<FormState>();

  void _onsar() {
    final date = showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1800),
      lastDate: DateTime(2200),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
  //       .then((_) {});

  //   _getUserData();
  // }

  // _getUserData() async {
  //   data = await ApiManager.getUserData();
  //   setState(() {});
  // }

  void savebutton() {
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Амжилттай Хадгаллаа"),
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DeliveryPage()));
    }
  }

  void LogOutButton() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //   [
    //     DeviceOrientation.landscapeLeft,
    //     DeviceOrientation.landscapeRight,
    //     // DeviceOrientation.portraitDown,
    //     DeviceOrientation.portraitUp,
    //   ],
    // );
    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //     padding: const EdgeInsets.only(top: 28.0, left: 8),
        //     child: Text(
        //       data?.result?.firstName ?? '',
        //       style: const TextStyle(
        //         backgroundColor: Color.fromARGB(255, 253, 255, 217),
        //         color: Colors.black,
        //         fontSize: 26,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     )),

        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 253, 255, 217),
            ),
            elevation: MaterialStatePropertyAll<double>(0),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Tester",
          // data?.result?.lastName ?? '',
          style: const TextStyle(
            backgroundColor: Color.fromARGB(255, 253, 255, 217),
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        backgroundColor: Color.fromARGB(255, 253, 255, 217),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0, right: 9),
            child: Text(
              'ЖОЛООЧ',
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 253, 255, 217),
                color: Color.fromARGB(255, 11, 115, 117),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/back1.jpg'), fit: BoxFit.fitWidth),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 408.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 288.0),
                      child: Text(
                        "Он сар",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 128.0,
                        top: 10,
                        left: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: ElevatedButton(
                              onPressed: _onsar, child: Text('$dateTime')),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Center(
                        child: DataTable(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                "З.Огноо",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Х.Огноо",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Б.Бренд",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Б.Нэр",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Т/ширхэг",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Б.үнэ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "У.Дугаар",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "З.Нэр",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "З.мэйл",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "З.хаяг",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Төлбөр",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              cells: [
                                DataCell(
                                  Text("2022/01/12"),
                                ),
                                DataCell(
                                  Text("2022/01/13"),
                                ),
                                DataCell(
                                  Text("Бренд"),
                                ),
                                DataCell(
                                  Text("Нэр"),
                                ),
                                DataCell(
                                  Text("12"),
                                ),
                                DataCell(
                                  Text("120000₮"),
                                ),
                                DataCell(
                                  Text("89111145"),
                                ),
                                DataCell(
                                  Text("Бат"),
                                ),
                                DataCell(
                                  Text("Bat123@gmail.com"),
                                ),
                                DataCell(
                                  Text("БЗФ 26 хороо энканто"),
                                ),
                                DataCell(DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null ||
                                          value.toString().isEmpty) {
                                        return "Хоосон байж болохгүй";
                                      }
                                      return null;
                                    },
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    hint: Text("Төлбөр"),
                                    items: [
                                      DropdownMenuItem(
                                        value: "1",
                                        child: Text("Бэлэн"),
                                      ),
                                      DropdownMenuItem(
                                        value: "2",
                                        child: Text("Данс"),
                                      ),
                                      DropdownMenuItem(
                                        value: "3",
                                        child: Text("Карт"),
                                      ),
                                      DropdownMenuItem(
                                        value: '4',
                                        child: Text("Хойшлогдсон"),
                                      ),
                                      DropdownMenuItem(
                                        value: '5',
                                        child: Text("Цуцалсан"),
                                      )
                                    ],
                                    onChanged: (value) {}))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                              ),
                              onPressed: savebutton,
                              child: Text("Хадгалах"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     padding: EdgeInsets.only(left: 10, right: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         border: Border.all(color: Colors.white),
                        //         borderRadius: BorderRadius.circular(30)),
                        //     child: ElevatedButton(
                        //       style: ButtonStyle(
                        //         elevation: MaterialStateProperty.all(0),
                        //         backgroundColor:
                        //             MaterialStateProperty.all(Colors.white),
                        //         foregroundColor:
                        //             MaterialStateProperty.all(Colors.black),
                        //       ),
                        //       onPressed: LogOutButton,
                        //       child: Text("Гарах"),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1800),
        lastDate: DateTime(2200),
      );
}
