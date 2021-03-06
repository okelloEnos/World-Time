import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:world_time/Service/World_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'Loading';

  void setUpWorldTime() async{
    WorldTime instance = WorldTime(location: 'Nairobi', flag: 'germany.jpg', url: 'Africa/Nairobi');
    await instance.getTime();
    print(instance.time);

    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
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
      backgroundColor: Colors.amber,
      body: Center(
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 50.0,
      ),
      ),
    );
  }
}
