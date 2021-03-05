import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    //make the request
    // Response response = await get("http://worldtimeapi.org/api/timezone/Africa/Nairobi");
    // Response responses = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
    // Map data = jsonDecode(responses);
    var uri = Uri.http('worldtimeapi.org', '/api/timezone/Africa/Nairobi');
    var response = await get(uri);
    var jsonResponse = jsonDecode(response.body);
    var abbr = jsonResponse['abbreviation'];

    // get properties
    String datetime = jsonResponse['datetime'];
    String offset = jsonResponse['utc_offset'].toString().substring(1,3);

    // print('Time abbr : $abbr');
    print('datetime : $datetime');
    print('Time offset : $offset');

  //  create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print('Current time : $now');

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("Loading Screen")),
    );
  }
}
