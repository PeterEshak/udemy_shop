import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeCodeScreen extends StatefulWidget {
  const NativeCodeScreen({Key? key}) : super(key: key);

  @override
  _NativeCodeScreenState createState() => _NativeCodeScreenState();
}

class _NativeCodeScreenState extends State<NativeCodeScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown battery level.';

  void _getBatteryLevel() {
    platform
        .invokeMethod('getBatteryLevel')
        .then((value) =>
            {setState(() => _batteryLevel = 'Battery level at $value % .')})
        .catchError((error) {
      setState(() =>
          _batteryLevel = "Failed to get battery level: '${error.message}'.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Get Battery Level'),
                onPressed: _getBatteryLevel,
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}
