import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

double _dataFlow = 0.0;
double _dataVolume = 0.0;

var colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
];

class TimeChartFlowPage extends StatefulWidget {
  const TimeChartFlowPage({Key key}) : super(key: key);

  @override
  _TimeChartFlowPage createState() => _TimeChartFlowPage();
}

class _TimeChartFlowPage extends State<TimeChartFlowPage> {
  final limitCount = 50;
  final flowPoints = <FlSpot>[];
  final volumePoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.5;

  Timer timer;
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      while (flowPoints.length > limitCount) {
        flowPoints.removeAt(0);
        volumePoints.removeAt(0);
      }
      setState(() {
        flowPoints.add(FlSpot(xValue, _dataFlow));
        volumePoints.add(FlSpot(xValue, _dataVolume));
      });
      xValue += step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                width: double.infinity,
                child: Stack(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Flow Time Chart',
                          style: TextStyle(
                            color: Color.fromARGB(255, 28, 43, 54),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 6.0),
                          child: LineChart(
                            LineChartData(
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                // The red line
                                LineChartBarData(
                                  spots: flowPoints,
                                  isCurved: true,
                                  barWidth: 2,
                                  color: colors[0],
                                ),
                              ],
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  axisNameWidget: const Text('Flow [mL/m]',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 0,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    reservedSize: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                        const Text(
                          'Time [s]',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ])
                ]))));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

class TimeChartVolumePage extends StatefulWidget {
  const TimeChartVolumePage({Key key}) : super(key: key);

  @override
  _TimeChartVolumePage createState() => _TimeChartVolumePage();
}

class _TimeChartVolumePage extends State<TimeChartVolumePage> {
  final limitCount = 50;
  final flowPoints = <FlSpot>[];
  final volumePoints = <FlSpot>[];

  double xValue = 0;
  double step = 0.5;

  Timer timer;
  // Generate some dummy data for the cahrt
  // This will be used to draw the red line

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      while (flowPoints.length > limitCount) {
        flowPoints.removeAt(0);
        volumePoints.removeAt(0);
      }
      setState(() {
        flowPoints.add(FlSpot(xValue, _dataFlow));
        volumePoints.add(FlSpot(xValue, _dataVolume));
      });
      xValue += step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                width: double.infinity,
                child: Stack(children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text(
                          'Volume Time Chart',
                          style: TextStyle(
                            color: Color.fromARGB(255, 28, 43, 54),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 6.0),
                          child: LineChart(
                            LineChartData(
                              borderData: FlBorderData(show: false),
                              lineBarsData: [
                                // The red line
                                LineChartBarData(
                                  spots: volumePoints,
                                  isCurved: true,
                                  barWidth: 2,
                                  color: colors[1],
                                ),
                              ],
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  axisNameWidget: const Text('Volume [mL]',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 0,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                    reservedSize: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                        const Text(
                          'Time [s]',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ])
                ]))));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
