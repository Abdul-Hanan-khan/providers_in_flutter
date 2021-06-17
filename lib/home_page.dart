import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_flutter/timer_info.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialValue = 60;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var timerInfo = Provider.of<TimerInfo>(context,listen: false);
      timerInfo.updateRemainingTime();

      // setState(() {
      //   initialValue--;
      //   // if(initialValue==0){
      //   //   exit(0);
      //   // }
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/clock.png'),
          SizedBox(
            height: 50,
            width: size.width,
          ),
          
          Consumer<TimerInfo>(builder: (context,data,child){
            return Text(data.getRemainingTime()?.toString()??"",style: TextStyle(fontSize: 65),);
          }
          ),
          // Text(
          //   initialValue.toString(),
          //   style: TextStyle(fontSize: 65),
          // )
        ],
      ),
    ));
  }
}
