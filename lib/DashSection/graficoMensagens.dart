import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'Constantes.dart';
import 'package:pcs/globals.dart' as globals;

class ChartMensagens extends StatelessWidget {
  const ChartMensagens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var num1 = globals.counter;
    double num2 = 20;
    double num3 = 10;
    double num4 = 30;
    double num5 = 25;
    double sum = num1 + num2 + num3 + num4 + num5;

    List<PieChartSectionData> paiChartSelectionDatas = [
      PieChartSectionData(
        color: primaryColor,
        value: num1,
        showTitle: false,
        radius: 25,
      ),
      PieChartSectionData(
        color: Color(0xFF26E5FF),
        value: num2,
        showTitle: false,
        radius: 22,
      ),
      PieChartSectionData(
        color: Color(0xFFFFCF26),
        value: num3,
        showTitle: false,
        radius: 19,
      ),
      PieChartSectionData(
        color: Color(0xFFEE2727),
        value: num4,
        showTitle: false,
        radius: 16,
      ),
      PieChartSectionData(
        color: primaryColor.withOpacity(0.3),
        value: 0,
        showTitle: false,
        radius: 13,
      )
    ];

    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  '$sum',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("em Marketing")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// List<PieChartSectionData> paiChartSelectionDatas = [
//   PieChartSectionData(
//     color: primaryColor,
//     value: globals.counter,
//     showTitle: false,
//     radius: 25,
//   ),
//   PieChartSectionData(
//     color: Color(0xFF26E5FF),
//     value: 20,
//     showTitle: false,
//     radius: 22,
//   ),
//   PieChartSectionData(
//     color: Color(0xFFFFCF26),
//     value: 10,
//     showTitle: false,
//     radius: 19,
//   ),
//   PieChartSectionData(
//     color: Color(0xFFEE2727),
//     value: 30,
//     showTitle: false,
//     radius: 16,
//   ),
//   PieChartSectionData(
//     color: primaryColor.withOpacity(0.1),
//     value: 25,
//     showTitle: false,
//     radius: 13,
//   ),
// ];
