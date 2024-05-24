import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engineer_ui_translation_test/presentation/screens/home.dart';

class InteractionsWidget extends StatefulWidget {
  const InteractionsWidget({super.key});

  @override
  State<InteractionsWidget> createState() => _InteractionsWidgetState();
}

class _InteractionsWidgetState extends State<InteractionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              color: const Color.fromRGBO(255, 245, 157, 1),
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'LIKE',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              height: 15,
              width: 15,
              color: Colors.white,
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'COOL',
              style: TextStyle(color: Colors.white // Change color to golden
                  ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.grey),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'LOVE',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.blue),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'FUNNY',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            )
          ],
        ),
        Align(
          // Align the pie chart to the left
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 150,
                width: 150,
                // width: double.infinity, // Occupy full width
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        value: 23,
                        title: '🙂',
                        color: Colors.white,
                        badgeWidget: Container(
                          height: 15,
                          width: 30,
                          color: Colors.white,
                          child: const Text(
                            '23%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 10,
                        title: '😍',
                        color: Colors.grey,
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '10%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 9,
                        title: '😬',
                        color: Colors.blue,
                        badgeWidget: Container(
                          height: 15,
                          width: 20,
                          color: Colors.white,
                          child: const Text(
                            '9%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 58,
                        title: '🤤',
                        color: const Color.fromRGBO(255, 245, 157, 1),
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '58%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                    ],
                    sectionsSpace: 0,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'FEELINGS RECEIVED',
                        style: TextStyle(
                          color: Colors.white, // Change color to golden
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '98',
                        style: TextStyle(
                          color: Color.fromRGBO(
                              255, 245, 157, 1), // Change color to golden
                        ),
                      ),
                    ],
                  ),
                  DottedTable1(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text(
                        'COMMENTS',
                        style: TextStyle(
                          color: Colors.white, // Change color to golden
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '8',
                        style: TextStyle(
                          color: Color.fromRGBO(
                              255, 245, 157, 1), // Change color to golden
                        ),
                      ),
                    ],
                  ),
                  DottedTable2(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
