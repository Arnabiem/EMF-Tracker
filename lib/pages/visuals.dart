import 'package:emf_app/models/magnitudeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class Visuals extends StatefulWidget {
  const Visuals({Key? key}) : super(key: key);

  @override
  State<Visuals> createState() => _VisualsState();
}

class _VisualsState extends State<Visuals> {
  late ChartSeriesController chartSeriesController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(title: Text("Visuals"),centerTitle: true,),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Card(
                  color: Colors.grey.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<MagnitudeProvider>(
                    builder: (context,model,child)=> SfCartesianChart(
                      title: ChartTitle(text: 'x,y,z with Time'),
                      legend: Legend(
                        isVisible:true,title: LegendTitle(text: "Legend"),
                      ),
                      series: <LineSeries<Livedata,int>>[

                        LineSeries<Livedata,int>(
                          legendItemText: 'x',
                            onRendererCreated: (ChartSeriesController controller){
                            chartSeriesController=controller;
                            },
                            dataSource: model.value,
                            color: Colors.red,
                            xValueMapper: (Livedata value, _)=> value.time,
                            yValueMapper: (Livedata value, _)=> value.x),
                        LineSeries<Livedata,int>(
                            legendItemText: 'y',
                            onRendererCreated: (ChartSeriesController controller){
                              chartSeriesController=controller;
                            },
                            dataSource: model.value,
                            color: Colors.blue,
                            xValueMapper: (Livedata value, _)=> value.time,
                            yValueMapper: (Livedata value, _)=> value.y),
                        LineSeries<Livedata,int>(
                            legendItemText: 'z',
                            onRendererCreated: (ChartSeriesController controller){
                              chartSeriesController=controller;
                            },
                            dataSource: model.value,
                            color: Colors.green,
                            xValueMapper: (Livedata value, _)=> value.time,
                            yValueMapper: (Livedata value, _)=> value.z),


                      ],
                      primaryXAxis: NumericAxis(
                        isVisible:true,
                        majorGridLines: MajorGridLines(width: 0),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        interval: 3,
                        title: AxisTitle(text: 'Time(sec)'),
                      ),
                      primaryYAxis: NumericAxis(
                        axisLine: AxisLine(width: 0),
                        majorTickLines: MajorTickLines(width: 0),
                        title: AxisTitle(text: 'µTesla'),
                      ),
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
