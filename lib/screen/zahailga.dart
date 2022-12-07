import 'package:flutter/services.dart';
import 'package:lapp/api%20&%20bloc/api_controller.dart';
import 'package:lapp/models/brand_list.dart';
import 'package:lapp/models/getproductname.dart';
import 'package:lapp/models/product_list.dart';
import 'package:lapp/models/userInfo.dart';
import 'package:lapp/screen/vndsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZahialgaPage extends StatefulWidget {
  final String? userName;
  ZahialgaPage({
    Key? key,
    this.userName,
  }) : super(key: key);

  @override
  State<ZahialgaPage> createState() => _ZahialgaPageState();
}

class _ZahialgaPageState extends State<ZahialgaPage> {
  Userinfo? data = Userinfo();
  final _formkey1 = GlobalKey<FormState>();
  final btoo = TextEditingController();
  final zdugaar = TextEditingController();
  final zner = TextEditingController();
  final zgeriinhayg = TextEditingController();
  final zmail = TextEditingController();
  List<Brands>? _brandList = [];
  List<Product>? _prodList = [];

  _getUserData() async {
    data = await ApiManager.getUserData();
    setState(() {});
  }

  String? prodId;
  String? brandId;
  _zahialah() async {
    if (_formkey1.currentState!.validate()) {
      var map = new Map<String, dynamic>();
      map['product_id'] = prodId;
      map['owner_name'] = zner.text;
      map['owner_phone'] = zdugaar.text;
      map['owner_address'] = zgeriinhayg.text;
      map['product_qty'] = btoo.text;
      var res = await ApiManager.orderCreate(map, context);
      print("response${res}");
      // Navigator.push(context, MaterialPageRoute(builder: ((context) => HomePage())));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("амжилттай захиаллаа")));
    }
  }

  @override
  void initState() {
    super.initState();
    getBrands();
    _getUserData();
  }

  getBrands() async {
    var brandRes = await ApiManager.getBrands();
    _brandList = brandRes.brandList;
    var prodRes = await ApiManager.getProducts();
    _prodList = prodRes.productList;
    setState(() {});
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
                      // "tester",
                      data?.result?.lastName ?? '',
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/back1.jpg'), fit: BoxFit.fill),
          ),
          child: Form(
            key: _formkey1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: sizeHeight * 0.05,
                  // ),
                  SingleChildScrollView(
                    child: Text(
                      "Захиалга",
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: sizeHeight * 0.03,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Бүтээгдэхүүний бренд"),
                          labelStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.toString().isEmpty) {
                            return "Хоосон байж болохгүй тул талбарыг гүйцээнэ үү!!";
                          } else {
                            return null;
                          }
                        },
                        items: _brandList?.map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val.id.toString(),
                              child: Text(val.brand_name ?? ''),
                            );
                          },
                        ).toList(),
                        onChanged: ((value) {
                          brandId = value.toString();
                          setState(() {});
                        })),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            label: Text("Бүтээгдэхүүний нэр"),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          validator: (value) {
                            if (value == null || value.toString().isEmpty) {
                              return "Хоосон байж болохгүй тул талбарыг гүйцээнэ үү!!";
                            } else {
                              return null;
                            }
                          },
                          items: _prodList?.map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val.id.toString(),
                                child: Text(val.product_name ?? ''),
                              );
                            },
                          ).toList(),
                          onChanged: ((value) {
                            prodId = value.toString();
                            setState(() {});
                          }))),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: btoo,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return "Бүтээгдэхүүнийн тоо хоосон байж болохгүй";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        counter: Container(),
                        border: InputBorder.none,
                        label: Text("Бүтээгдэхүүний тоо ширхэг"),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        counter: Container(),
                        border: InputBorder.none,
                        label: Text("   Захиалагчийн дугаар"),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        counter: Container(),
                        border: InputBorder.none,
                        label: Text("   Захиалагчийн нэр"),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
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
                        counter: Container(),
                        border: InputBorder.none,
                        label: Text("   Захиалагчийн майл хаяг"),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: zgeriinhayg,
                      validator: (value) {
                        if (value == null || value.toString().isEmpty) {
                          return "Захиалагчийн гэрийн хаяг хоосон байж болохгүй";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        counter: Container(),
                        border: InputBorder.none,
                        label: Text("Захиалагчийн гэрийн хаяг"),
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, elevation: 0.0),
                      onPressed: _zahialah,
                      child: const Center(
                          child: Text(
                        "Захиалах",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
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
