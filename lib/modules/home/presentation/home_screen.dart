// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile_developer_assessment/common/io/fetch_data.dart';

import '../../../common/io/shared_preferance.dart';
import '../../widgets/employee_ticket_widget.dart';
import '../../widgets/text_form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<dynamic> futureData;
  String _query = '';
  final session = SharedPreferencesService();

  @override
  void initState() {
    fetchResponseData();
    super.initState();
  }

  onSetDataPreference() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    onSetDataPreference();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 196, 221, 199)),
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
              suffixWidget: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.format_list_bulleted_rounded,
                  size: 30,
                  color: Colors.green,
                ),
              ),
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
                      ...session.usersData['userData']
                          .where((w) {
                            final firstName =
                                w['first_name']?.toString().toLowerCase() ?? '';
                            final lastName =
                                w['last_name']?.toString().toLowerCase() ?? '';
                            final query = _query.toLowerCase();
                            return firstName.contains(query) ||
                                lastName.contains(query);
                          })!
                          .map((o) {
                            return EmployeeTicketWidget(o: o);
                          })
                    else
                      ...session.usersData['userData']!.map((o) {
                        return EmployeeTicketWidget(o: o);
                      })
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

  void _chache(data) {
    if (data != null) {
      session.usersData = {'userData': data['data']};
    }
  }

  void fetchResponseData() async {
    var v = await fetchDAta();
    _chache(v);
    setState(() {});
  }
}
