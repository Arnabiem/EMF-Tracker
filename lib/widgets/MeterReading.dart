import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:emf_app/models/magnitudeProvider.dart';
class meterReading extends StatefulWidget {
  const meterReading({Key? key}) : super(key: key);

  @override
  State<meterReading> createState() => _meterReadingState();
}

class _meterReadingState extends State<meterReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Consumer<MagnitudeProvider>(builder: (context,model,child)=> SfRadialGauge(axes:<RadialAxis>[
          RadialAxis(
            minimum: 0,maximum: 1000,labelOffset: 20,tickOffset: 20,
            ranges: [
              GaugeRange(startValue: 0, endValue: 200,color: Colors.green,label: 'SAFE',startWidth: 25,endWidth: 25,
              labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              GaugeRange(startValue: 200, endValue: 500,color: Colors.orange,label: 'MODERATE',startWidth: 25,endWidth: 25,
                labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              GaugeRange(startValue: 500, endValue: 1000,color: Colors.red,label: 'DANGER',startWidth: 25,endWidth: 25,
                labelStyle: GaugeTextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
            ],
            pointers: [
              NeedlePointer(value: model.magnitude),
            ],
            annotations: [
              GaugeAnnotation(widget: Container(
                child: Text(model.magnitude.toStringAsFixed(2),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
                angle: 90,positionFactor: 0.5,
              )
            ],
          )
        ]))
      ],
    );
  }
}
