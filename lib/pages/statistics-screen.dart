import 'package:bill_app/components/container-test.dart';
import 'package:bill_app/components/master-page.dart';
import 'package:bill_app/models/bill-model.dart';
import 'package:bill_app/pages/resources/app-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../services/local/shared_perferences.dart';

class StatisticsPage extends StatefulWidget {
    static const routerName = '/statistics-page';

  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  TextEditingController searchController = TextEditingController();
  List<BillModel> listBillData = [];
  final SharePrefs _prefs = SharePrefs();
  List<BillModel> findList = [];
  @override
  void initState() {
    super.initState();
    _getBills();
  }

  void runFlitter(String content) {
    print(content);
    List<BillModel> result = [];
    if (content.isEmpty) {
      result = listBillData;
    } else {
      result = listBillData
          .where((element) =>
              element.name!.toLowerCase().contains(content.toLowerCase()))
          .toList();
    }
    setState(() {
      findList = result;
    });
  }

  _getBills() async {
    _prefs.getBills().then((value) {
      listBillData = value ?? listBill;
      findList = listBillData;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasterPage(
      title: 'Thống kê',
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.salaColor,
                    offset: Offset(0, 1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    blurStyle: BlurStyle.normal,
                  )
                ]),
            // height: 100.0,
            child: TextField(
              onChanged: (value) => runFlitter(value),
              controller: searchController,
              decoration: const InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.salaColor,
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //     borderSide: BorderSide(color: AppColor.salaColor),
                  //     borderRadius: BorderRadius.all(Radius.circular(20)),
                  //    ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.salaColor),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: findList.length,
                itemBuilder: (context, index) {
                  String item = findList[index].toString();
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              setState(() {
                                print(index);
                                // findList.remove(index);
                                listBillData.remove(findList[index]);
                                _prefs.addBills(listBillData);
                              });
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                      child: CustomContainer(
                        billModel: findList[index],
                      ),
                    ),
                  );
                }),
          )),
        ],
      ),
    );
  }
}
