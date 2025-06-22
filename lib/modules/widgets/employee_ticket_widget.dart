// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mobile_developer_assessment/modules/widgets/text_widget.dart';

class EmployeeTicketWidget extends StatelessWidget {
  EmployeeTicketWidget({super.key, this.o});
  dynamic o;

  showCaseDialog(
    context, {
    String? name,
    double? proScore,
    int? level,
    String? salary,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          // To display the title it is optional
          title: TextView(
            text: 'Hello $name,',
            fontSize: 20.90,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 17, 47, 18),
          ),
          // Message which will be pop up on the screen
          content: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Your productive score is ',
                  style: TextStyle(fontSize: 16.80),
                ),
                TextSpan(
                  text: '$proScore',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.80),
                ),

                TextSpan(text: ' at level ', style: TextStyle(fontSize: 16.80)),
                TextSpan(
                  text: '$level,',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.80),
                ),

                TextSpan(
                  text: ' and your salary rate is ',
                  style: TextStyle(fontSize: 16.80),
                ),
                TextSpan(
                  text: '$salary ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.80),
                ),

                TextSpan(text: 'naira. ', style: TextStyle(fontSize: 16.80)),
                double.parse(proScore!.toString()) > 79
                    ? TextSpan(
                      text:
                          'At the end of the year you will receive a promotion and consequential pay increase',
                      style: TextStyle(fontSize: 16.80),
                    )
                    : double.parse(proScore.toString()) < 50 &&
                        double.parse(proScore.toString()) > 49
                    ? TextSpan(
                      text:
                          'At the end of the year you will demoted with no pay increase',
                      style: TextStyle(fontSize: 16.80),
                    )
                    : double.parse(proScore.toString()) < 39
                    ? TextSpan(
                      text:
                          'At the end of the year your appointment will be terminated.',
                      style: TextStyle(fontSize: 16.80),
                    )
                    : TextSpan(text: ''),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextView(
                text: 'CANCEL',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 17, 47, 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextView(
                text: 'OK',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 17, 47, 18),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => showCaseDialog(
            context,
            name: o['first_name'],
            proScore: o['productivity_score'],
            level: o['level'],
            salary: o['current_salary'],
          ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 227, 236, 228),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: '${o['first_name']} ${o['last_name']}',
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Work Level: ${o['level']}',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w200,
                ),
                TextView(
                  text: '${o['designation']}',
                  fontSize: 15.90,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 17, 47, 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
