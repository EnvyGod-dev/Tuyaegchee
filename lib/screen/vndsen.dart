import 'package:lapp/screen/hereglegch.dart';
import 'package:lapp/screen/login.dart';
import 'package:lapp/screen/zahailga.dart';
import 'package:lapp/screen/zahialgaharah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeigth = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    _hereglegch() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserCreate(),
        ),
      );
    }

    _zahialgaharah() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductSee(),
        ),
      );
    }

    _zahialga() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ZahialgaPage(),
        ),
      );
    }

    _logout() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test",
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
              'БОРЛУУЛАГЧ',
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
            image: AssetImage('images/back1.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 68.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: sizeWidth * 0.45,
                          height: sizeHeigth * 0.24,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                  Color(0xffED5E92),
                                )),
                            onPressed: _zahialga,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 49.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.shoppingCart,
                                    size: sizeHeigth * 0.139,
                                  ),
                                ),
                                SizedBox(
                                  height: sizeHeigth * 0.01,
                                ),
                                Text(
                                  "Захиалга",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: sizeHeigth * 0.01,
                        ),
                        SizedBox(
                          width: sizeWidth * 0.45,
                          height: sizeHeigth * 0.24,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              foregroundColor: MaterialStateProperty.all(
                                Color(0xff9BF862),
                              ),
                            ),
                            onPressed: _hereglegch,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 49.0),
                                  child: Icon(
                                    Icons.person,
                                    size: sizeHeigth * 0.139,
                                  ),
                                ),
                                SizedBox(
                                  height: sizeHeigth * 0.01,
                                ),
                                Text(
                                  "Хэрэглэгчид",
                                  style: TextStyle(
                                    backgroundColor: Colors.white,
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizeHeigth * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: sizeWidth * 0.45,
                          height: sizeHeigth * 0.24,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Color(0xffD9D5F7)),
                            ),
                            onPressed: _zahialgaharah,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 49.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.eyeDropper,
                                    size: sizeHeigth * 0.139,
                                  ),
                                ),
                                SizedBox(
                                  height: sizeHeigth * 0.01,
                                ),
                                Text(
                                  "Захиалга харах",
                                  style: TextStyle(
                                    backgroundColor: Colors.white,
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: sizeHeigth * 0.01,
                        ),
                        SizedBox(
                          width: sizeWidth * 0.45,
                          height: sizeHeigth * 0.24,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              foregroundColor:
                                  MaterialStateProperty.all(Color(0xffB8D9EC)),
                            ),
                            onPressed: _logout,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.usersCog,
                                    size: sizeHeigth * 0.139,
                                  ),
                                ),
                                SizedBox(
                                  height: sizeHeigth * 0.01,
                                ),
                                Text(
                                  "Гарах",
                                  style: TextStyle(
                                    backgroundColor: Colors.white,
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
