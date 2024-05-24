import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engineer_ui_translation_test/presentation/screens/home.dart';

class SourceWidget extends StatefulWidget {
  const SourceWidget({super.key});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
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
              'HOME',
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
              'DISCOVER',
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
              'SEARCH',
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
              'PROFILE',
              style: TextStyle(
                color: Colors.white, // Change color to golden
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(height: 15, width: 15, color: Colors.purple),
            const SizedBox(
              width: 2,
            ),
            const Text(
              'NOTIFICATION',
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
                        value: 26,
                        title: '',
                        color: Colors.white,
                        badgeWidget: Container(
                          height: 15,
                          width: 30,
                          color: Colors.white,
                          child: const Text(
                            '26%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 18,
                        title: '',
                        color: Colors.grey,
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '18%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 12,
                        title: '',
                        color: Colors.blue,
                        badgeWidget: Container(
                          height: 15,
                          width: 20,
                          color: Colors.white,
                          child: const Text(
                            '12%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 35,
                        title: '',
                        color: const Color.fromRGBO(255, 245, 157, 1),
                        badgeWidget: Container(
                          height: 15,
                          width: 25,
                          color: Colors.white,
                          child: const Text(
                            '35%',
                            style: TextStyle(
                              color: Colors.black, // Change color to golden
                            ),
                          ),
                        ),
                      ),
                      PieChartSectionData(
                        value: 9,
                        title: '',
                        color: Colors.white,
                        badgeWidget: Container(
                          height: 15,
                          width: 30,
                          color: Colors.white,
                          child: const Text(
                            '9%',
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
                        'VIEWS',
                        style: TextStyle(
                          color: Colors.white, // Change color to golden
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '3123',
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
                  const Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'VIEWING',
                            style: TextStyle(
                              color: Color.fromRGBO(
                                  255, 245, 157, 1), // Change color to golden
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'VIEW LAST 7 DAYS',
                            style: TextStyle(
                              color: Colors.white, // Change color to golden
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'VIEW LAST 30 DAYS',
                    style: TextStyle(
                      color: Colors.white, // Change color to golden
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'VIEW LAST 90 DAYS',
                    style: TextStyle(
                      color: Colors.white, // Change color to golden
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'VIEW LAST YEAR',
                    style: TextStyle(
                      color: Colors.white, // Change color to golden
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
