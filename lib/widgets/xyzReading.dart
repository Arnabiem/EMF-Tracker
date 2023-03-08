import 'package:emf_app/models/magnitudeProvider.dart';
import 'package:emf_app/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class xyzReading extends StatefulWidget {
  const xyzReading({Key? key}) : super(key: key);

  @override
  State<xyzReading> createState() => _xyzReadingState();
}

class _xyzReadingState extends State<xyzReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        Text("Update Interval"),
        Consumer<MagnitudeProvider>(
            builder: (context,model,child)=> Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 1,
                  groupValue: model.groupvalue,
                  onChanged: (dynamic value) => model.setupdateinterval(
                      1, Duration.microsecondsPerSecond ~/ 1),
                ),
                Text("1 FPS"),
                Radio(value: 2, groupValue: model.groupvalue,
                  onChanged: (dynamic value) => model.setupdateinterval(2, Duration.microsecondsPerSecond ~/ 30),
                ),
                Text("30 FPS"),
                Radio(value: 3, groupValue: model.groupvalue,
                  onChanged: (dynamic value)=>model.setupdateinterval(3, Duration.microsecondsPerSecond ~/ 60),
                ),
                Text("60 FPS"),
              ],
            )
        ),
        SizedBox(height: 20,),
        Consumer<MagnitudeProvider>(builder: (context,model,child)=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textWidget("x: ${model.x.toStringAsFixed(2)}"),
            textWidget("y: ${model.y.toStringAsFixed(2)}"),
            textWidget("z: ${model.z.toStringAsFixed(2)}"),
          ],
        ))
      ],
    );
  }
}
