import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class Native extends StatefulWidget {
  Native({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _NativeState createState() => _NativeState();
}

class _NativeState extends State<Native> {
  static const platform = const MethodChannel('flutter.native/helper');
  String _responseFromNativeCode = 'Response from native';

  Future<void> _accessNativeCode() async {
    String response = "Native response text";
    try {
      final String result = await platform.invokeMethod('accessFromNativeCode');
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    setState(() {
      _responseFromNativeCode = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Access native android and ios code')),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Call Native Method'),
                onPressed: _accessNativeCode,
              ),
              Text(_responseFromNativeCode)
            ],
          ),
        ),
      ),
    );
  }
}
