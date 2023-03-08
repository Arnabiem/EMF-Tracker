import 'package:flutter/material.dart';
import 'dart:math';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:vector_math/vector_math_64.dart';
class MagnitudeProvider extends ChangeNotifier{
  double x=0;
  double y=0;
  double z=0;
  double magnitude=0;
int time=0;
List<Livedata> value=[];

  Vector3 magnetometer=Vector3.zero();
  Vector3 accelerometer=Vector3.zero();
  Vector3 absoluteorientation2=Vector3.zero();
  int groupvalue=2;
  changeValues(){
    motionSensors.magnetometer.listen((MagnetometerEvent event) {
      magnetometer.setValues(event.x,event.y,event.z);
      var matrix=motionSensors.getRotationMatrix(accelerometer, magnetometer);
      absoluteorientation2.setFrom(motionSensors.getOrientation(matrix));
      x=magnetometer.x;
      y=magnetometer.y;
      z=magnetometer.z;
      magnitude=sqrt(pow(x, 2)+pow(y, 2)+pow(z, 2));
      value.add(Livedata(x,y,z,time++));
      if(value.length>40){
        value.removeAt(0);
      }
      notifyListeners();
  });
  }
  setupdateinterval(int? groupValue,int interval){
    motionSensors.magnetometerUpdateInterval=interval;
    groupvalue=groupValue!;
    print(groupvalue);
    notifyListeners();
  }
}
class Livedata{
  Livedata(this.x,this.y,this.z,this.time);
  final double x;
  final double y;
  final double z;
  final int time;
}