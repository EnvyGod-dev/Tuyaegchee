import 'package:intl/intl.dart';
import 'package:baekseolmtx/api%20&%20bloc/api_controller.dart';
import 'package:baekseolmtx/models/order_list.dart';
import 'package:baekseolmtx/screen/login.dart';
import 'package:baekseolmtx/screen/vndsen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:baekseolmtx/service/responsive_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductSee extends StatefulWidget {
  final String? name;
  const ProductSee({Key? key, this.name}) : super(key: key);

  @override
  State<ProductSee> createState() => _ProductSeeState();
}

class _ProductSeeState extends State<ProductSee> {
  DateTime? dateTime = DateTime.now();
  DateTime date = DateTime.now();

  List<Order> orderList = [];
  var _refreshController = RefreshController(initialRefresh: false);

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

  getOrderList() async {
    var res = await ApiManager.getOrderList();
    print("object:::::::${res.result}");
    orderList = res.result!;
    print("ene::::${orderList.length}");
    setState(() {});
  }

  @override
  void initState() {
    getOrderList();
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((_) {});
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (date != DateTime.now()) {
      var map = new Map<String, dynamic>();
      map['order_date'] = DateFormat('yyyy-MM-dd').format(date);
      var res = await ApiManager.getOrderListByDate(map, context);
      if (res.status == 'error') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Тухайн өдөрт захиалга байхгүй байна")));
      }
      orderList = res.result!;
      setState(() {});
    } else {
      getOrderList();
    }
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 78.0),
                child: Text(
                  "${widget.name}",
                  // "widget.userName",
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: ResponsiveFlutter.of(context).hp(100),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/back1.jpg',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: false,
          header: const WaterDropHeader(
              complete: Icon(
            Icons.check,
            color: Colors.green,
          )),
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: SingleChildScrollView(
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
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white)),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: SingleChildScrollView(
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
                        ],
                        rows: <DataRow>[
                          for (var order in orderList)
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(order.product?.brandId != null ? "${order.product?.brandId}" : ''),
                                ),
                                DataCell(
                                  Text(order.product?.productName != null ? "${order.product?.productName}" : ''),
                                ),
                                DataCell(
                                  Text(order.productQty != null ? "${order.productQty}" : ''),
                                ),
                                DataCell(
                                  Text(order.product_price != null ? "${order.product_price}" : ''),
                                ),
                                DataCell(
                                  Text(order.ownerPhone != null ? "${order.ownerPhone}" : ''),
                                ),
                                DataCell(
                                  Text(order.ownerName != null ? "${order.ownerName}" : ''),
                                ),
                                DataCell(
                                  Text(order.owner_email != null ? "${order.owner_email}" : ''),
                                ),
                                DataCell(
                                  Text(order.ownerAddress != null ? "${order.ownerAddress}" : ''),
                                ),
                              ],
                            ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _rowTitle({String? text}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: ResponsiveFlutter.of(context).fontSize(2)),
      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black), color: Colors.white),
      child: Text(
        text!,
      ),
    );
  }
}
