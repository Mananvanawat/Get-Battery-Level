import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main()=>runApp(Myhomepage());
class Myhomepage extends StatefulWidget {
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_batteryLevel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Container(
              height: 75,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: RaisedButton(
                  elevation: 10,
                  color: Colors.cyanAccent ,
                  child: Text('Get Battery Level'),
                  onPressed: _getBatteryLevel,
                ),
              ),
            ),

          ],
        ),
      ),
        ) ) );
  }
}
