
import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;  // place location
  String flag;  // path to location flag
  String time;  // location time
  String url;   // url endpoint
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

 Future <void> getTime() async {
   
   try {
     // make the request
     // Response response = await get("http://worldtimeapi.org/api/timezone/Africa/Nairobi");
     // Response responses = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Africa/Nairobi'));
     // Map data = jsonDecode(responses);
     var uri = Uri.http('worldtimeapi.org', '/api/timezone/$url');
     var response = await get(uri);
     var jsonResponse = jsonDecode(response.body);
     var abbr = jsonResponse['abbreviation'];

     // get properties
     String datetime = jsonResponse['datetime'];
     String offset = jsonResponse['utc_offset'].toString().substring(1, 3);

     // print('Time abbr : $abbr');
     print('datetime : $datetime');
     print('Time offset : $offset');

     //  create a date time object
     DateTime now = DateTime.parse(datetime);
     now = now.add(Duration(hours: int.parse(offset)));
     print('Current time : $now');

     //set time property
     time = now.toString();
     isDayTime = (now.hour > 5 && now.hour < 19) ? true : false;
     time = DateFormat.jm().format(now);
   }
   
   catch(e){
     print('error: $e');
     time = 'Unable to Obtain Time for the Location';
   }
  }
}