// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_developer_assessment/common/io/fetch_data.dart';
import 'package:mobile_developer_assessment/modules/widgets/app_utils.dart';

import '../../../common/io/shared_preferance.dart';
import '../../widgets/employee_ticket_widget.dart';
import '../../widgets/text_form_widget.dart';
import '../../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<dynamic> futureData;
  String _query = '';
  final session = SharedPreferencesService();
  bool isFilter = false;

  List<dynamic> modelList = [];
  List<String> designation = [];

  @override
  void initState() {
    fetchResponseData(context);

    super.initState();
  }

  onSetDataPreference() async {
    await Future.delayed(Duration(seconds: 3), () {
      getDesignation(session.usersData['userData']);
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    onSetDataPreference();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 221, 199),
        actions: [
          isFilter
              ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    modelList.clear();
                    isFilter = false;
                    setState(() {});
                  },
                  child: TextView(
                    text: 'Clear',
                    fontSize: 15.90,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 17, 47, 18),
                  ),
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: TextFormWidget(
              label: 'Search Employees',
              textCapitalization: TextCapitalization.words,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.2,
                color: Colors.black,
              ),
              fillColor: Colors.white.withOpacity(.4),
              isFilled: true,
              prefixWidget: Icon(Icons.search),
              suffixWidget: selectPopUpMenu(context, designation: designation),
              onChange: (o) {
                _query = o;
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 570,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                children: [
                  if (SharedPreferencesService.instance.usersData['userData'] !=
                      null)
                    if (_query != '')
                      !isFilter
                          ? Column(
                            children: [
                              ...session.usersData['userData']
                                  .where((w) {
                                    final firstName =
                                        w['first_name']
                                            ?.toString()
                                            .toLowerCase() ??
                                        '';
                                    final lastName =
                                        w['last_name']
                                            ?.toString()
                                            .toLowerCase() ??
                                        '';
                                    final query = _query.toLowerCase();
                                    return firstName.contains(query) ||
                                        lastName.contains(query);
                                  })!
                                  .map((o) {
                                    return EmployeeTicketWidget(o: o);
                                  }),
                            ],
                          )
                          : Column(
                            children: [
                              ...modelList
                                  .where((w) {
                                    final firstName =
                                        w['first_name']
                                            ?.toString()
                                            .toLowerCase() ??
                                        '';
                                    final lastName =
                                        w['last_name']
                                            ?.toString()
                                            .toLowerCase() ??
                                        '';
                                    final query = _query.toLowerCase();
                                    return firstName.contains(query) ||
                                        lastName.contains(query);
                                  })
                                  .map((o) {
                                    return EmployeeTicketWidget(o: o);
                                  }),
                            ],
                          )
                    else
                      !isFilter
                          ? Column(
                            children: [
                              ...session.usersData['userData']!.map((o) {
                                return EmployeeTicketWidget(o: o);
                              }),
                            ],
                          )
                          : Column(
                            children: [
                              ...modelList.map((o) {
                                return EmployeeTicketWidget(o: o);
                              }),
                            ],
                          )
                  else
                    Center(
                      child: CircularProgressIndicator(
                        padding: EdgeInsets.only(top: 40),
                        color: Colors.green,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> getDesignation(itemList) {
    designation.clear();
    for (var element in itemList) {
      if (designation.contains(element['designation'])) {
      } else {
        designation.add(element['designation']);
      }
    }
    return designation;
  }

  void _chache(data) {
    if (data != null) {
      session.usersData = {'userData': data['data']};
    }
  }

  void fetchResponseData(context) async {
    var v = await fetchData();
    if (v['statusCode'] == 200) {
      _chache(v);
    } else {
      AppUtils.snackbar(context, message: v['message'], error: true);
    }

    setState(() {});
  }

  selectPopUpMenu(context, {List<String>? designation}) =>
      PopupMenuButton<String>(
        itemBuilder:
            (context) => [
              if (designation!.isNotEmpty)
                ...designation.map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: TextView(
                      text: e,
                      fontSize: 15.90,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 17, 47, 18),
                    ),
                  ),
                ),
            ],
        offset: const Offset(0, 100),
        color: const Color.fromARGB(255, 253, 253, 253),
        elevation: 2,
        // on selected we show the dialog box
        onSelected: (value) {
          modelList.clear();
          isFilter = true;

          for (var emp in session.usersData['userData']) {
            if (emp['designation'] == value) {
              modelList.add(emp);
            }
          }
          setState(() {});
        },
        child: Icon(
          Icons.format_list_bulleted_rounded,
          size: 30,
          color: Colors.green,
        ),
      );
}
