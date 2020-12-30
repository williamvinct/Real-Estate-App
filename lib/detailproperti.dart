import 'package:flutter/material.dart';

class DetailProperti extends StatefulWidget {
  @override
  _DetailPropertiState createState() => _DetailPropertiState();
}

class _DetailPropertiState extends State<DetailProperti> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBar(
        title: Text("Detail Properti"),
      ),
    );
  }
}
