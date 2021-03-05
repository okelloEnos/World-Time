import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/Service/World_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Loading';

  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.jpg', url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);

    setState(() {
      time = instance.time;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(50.0),
          child: Text(time),
          ),
      ),
    );
  }
}
