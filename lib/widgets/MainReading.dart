import 'package:emf_app/models/magnitudeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class mainReading extends StatefulWidget {
  const mainReading({Key? key}) : super(key: key);

  @override
  State<mainReading> createState() => _mainReadingState();
}

class _mainReadingState extends State<mainReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Consumer<MagnitudeProvider>(
            builder: (context,model,child)=> Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width,
                  // width:100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        model.magnitude.toStringAsFixed(2),
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  // width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' µTesla',
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            )
        )
      ],
    );
  }
}
