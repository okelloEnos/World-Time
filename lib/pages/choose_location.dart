import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData(){
    Future.delayed(Duration(seconds: 3),() {
      print('OKELLO');
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text("Choosing Location Screen"),
    );
  }

}
