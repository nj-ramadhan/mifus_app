import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './chart.dart';
// import 'package:fl_chart/fl_chart.dart';

class LocalPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LocalPage();

  @override
  // ignore: library_private_types_in_public_api
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  final double _dataFlow = 150.0;
  final double _dataVolume = 350.0;
  final int _dataAlarm = 1;

  var _dataTabelWaktu;
  var _dataTabelDevice;
  var _dataTabelAlarm;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/infus_selang.svg',
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    "$_dataFlow mL/s",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  MaterialButton(
                      color: const Color.fromARGB(255, 28, 43, 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text(
                            'Show Time Chart',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.line_axis,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TimeChartFlowPage()),
                        );
                      }),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/infus_tabung.svg',
                height: 200,
              ),
              Column(
                children: [
                  Text(
                    "$_dataVolume mL",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  MaterialButton(
                      color: const Color.fromARGB(255, 28, 43, 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text(
                            'Show Time Chart',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.line_axis,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TimeChartVolumePage()),
                        );
                      }),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Table(
            textBaseline: TextBaseline.alphabetic,
            children: [
              const TableRow(children: [
                Text('Waktu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text('Device',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                Text('Alarm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ]),
              TableRow(children: [
                Text('$_dataTabelWaktu'),
                Text('$_dataTabelDevice'),
                Text('$_dataTabelAlarm')
              ])
            ],
          )
        ],
      ),
    );
  }
}
