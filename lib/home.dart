import 'package:emf_app/pages/visuals.dart';
import 'package:emf_app/utils/colors.dart';
import 'package:emf_app/widgets/MainReading.dart';
import 'package:emf_app/widgets/MeterReading.dart';
import 'package:emf_app/widgets/xyzReading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/magnitudeProvider.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              mainReading(),
              xyzReading(),
              meterReading(),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(color: Colors.white))),
                        backgroundColor: MaterialStateProperty.all(
                            AppColors.primarycolor)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Visuals()));
                    },
                    child: Text('Visualize')
              ),
              ),
              SizedBox(height: 10,),
              Consumer<MagnitudeProvider>(
                builder: (context, model, child) => Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: BorderSide(color: Colors.white))),
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primarycolor)),
                      onPressed: () {
                        model.changeValues();
                      },
                      child: Text('Start')
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
