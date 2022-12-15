import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lapp/api%20&%20bloc/api_controller.dart';
import 'package:lapp/models/order_list.dart';
import 'package:lapp/screen/login.dart';
import 'package:intl/intl.dart';
import 'package:lapp/service/responsive_flutter.dart';
import 'package:lapp/widgets/alert_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({Key? key}) : super(key: key);

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  // Userinfo? data = Userinfo();
  DateTime? dateTime = DateTime.now();
  DateTime date = DateTime.now();
  final reasonCtrl = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  List<Order> orderList = [];
  String? status;
  int? id;
  String? name;

  _onsar() async {
    dateTime = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
    );
    if (dateTime == null) {
      return;
    }
    setState(() {
      date = dateTime!;
    });
    var map = new Map<String, dynamic>();
    map['order_date'] = DateFormat('yyyy-MM-dd').format(date);
    var res = await ApiManager.getOrderListByDate(map, context);
    if (res.status == 'error') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Тухайн өдөрт захиалга байхгүй байна")));
    }
    orderList = res.result!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {});

    getOrderList();
    _getUserData();
  }

  _getUserData() async {
    var data = await ApiManager.getUserData();
    name = data.result?.name;
    setState(() {});
  }

  getOrderList() async {
    var res = await ApiManager.getOrderList();
    print("object:::::::${res.result}");
    orderList = res.result!;
    print("ene::::${orderList.length}");
    setState(() {});
  }

  void savebutton() async {
    var map = new Map<String, dynamic>();
    map['status'] = status;
    var res = await ApiManager.paymentStatusChange(map, id!, context);
    print("res::::${res}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(
              Color.fromARGB(255, 253, 255, 217),
            ),
            elevation: MaterialStatePropertyAll<double>(0),
          ),
          onPressed: () async {
            final SharedPreferences _prefs = await SharedPreferences.getInstance();
            WarningAlert().showDialog(
              context: context,
              text: "Та гарахдаа итгэлтэй байна уу?",
              button2Text: "Үгүй",
              button1Text: "Tийм",
              isNavigate: true,
            );
            var token = _prefs.clear();
          },
          child: FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        title: Text(
          "${name}",
          style: const TextStyle(
            backgroundColor: Color.fromARGB(255, 253, 255, 217),
            color: Colors.black,
            fontSize: 24,
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
        height: ResponsiveFlutter.of(context).hp(100),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/back1.jpg'), fit: BoxFit.fitWidth),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 408.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Он сар",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: _onsar,
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(dateTime!),
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        columns: <DataColumn>[
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
                              "З.Дугаар",
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
                              "Төлбөр",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Тайлбар",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Үйлдэл",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        rows: <DataRow>[
                          for (var order in orderList)
                            DataRow(
                              cells: [
                                DataCell(
                                  Text("${order.product?.brandId}"),
                                ),
                                DataCell(
                                  Text("${order.product?.productName}"),
                                ),
                                DataCell(
                                  Text("${order.productQty}"),
                                ),
                                DataCell(
                                  Text("${order.product?.productPrice}"),
                                ),
                                DataCell(
                                  Text("${order.seller?.phone}"),
                                ),
                                DataCell(
                                  Text("${order.seller?.name}"),
                                ),
                                DataCell(
                                  Text("${order.seller?.email}"),
                                ),
                                DataCell(
                                  Text("${order.seller?.address}"),
                                ),
                                DataCell(
                                  Text(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.parse(order.createdAt!))),
                                ),
                                DataCell(
                                  order.deliveryDate != null
                                      ? Text(DateFormat('yyyy-MM-dd hh:mm').format(DateTime.parse(order.deliveryDate!)))
                                      : Text(''),
                                ),
                                DataCell(DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null || value.toString().isEmpty) {
                                        return "Хоосон байж болохгүй";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(border: InputBorder.none),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      size: 35,
                                      color: Colors.black,
                                    ),
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                    hint: Text(order.paymentStatus ?? "..."),
                                    items: [
                                      DropdownMenuItem(
                                        value: "Бэлэн",
                                        child: Text("Бэлэн"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Данс",
                                        child: Text("Данс"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Хойшлуулсан',
                                        child: Text("Хойшлуулсан"),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Цуцлагдсан',
                                        child: Text("Цуцлагдсан"),
                                      )
                                    ],
                                    onChanged: (value) {
                                      status = value.toString();
                                      id = order.id;
                                      setState(() {});
                                      if (status == 'Хойшлуулсан') {
                                        print("object");
                                        _addComment(id: id);
                                      }
                                    })),
                                DataCell(
                                  Text(order.comment != null ? "${order.comment}" : ""),
                                ),
                                DataCell(
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                      foregroundColor: MaterialStateProperty.all(Colors.black),
                                    ),
                                    onPressed: savebutton,
                                    child: Text(
                                      "Хадгалах",
                                      style: TextStyle(color: Color.fromARGB(255, 15, 67, 42)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addComment({int? id}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Хойшлогдсон шалтгаанаа оруулна уу",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    controller: reasonCtrl,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      'Хадгалах',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var map = new Map<String, dynamic>();

                      map['order_id'] = id.toString();
                      map['comment'] = reasonCtrl.text;

                      var res = await ApiManager.addReasonDelayed(map, context);
                      if (res['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Амжилттай"), backgroundColor: Colors.green));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Амжилтгүй")));
                      }
                      Navigator.pop(context);
                      initState();
                    },
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Цуцлах',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
