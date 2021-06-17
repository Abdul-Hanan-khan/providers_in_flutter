import 'package:flutter/cupertino.dart';

class TimerInfo extends ChangeNotifier{
  int _remainingTime=10;

  updateRemainingTime(){
    // _remainingTime--;
    if(_remainingTime!=0){
    _remainingTime--;
    }
    notifyListeners(); ///very important
  }

  int getRemainingTime(){
    return _remainingTime;
  }

}