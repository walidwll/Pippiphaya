import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:flutter/material.dart';

class PassengersNBRSetter extends StatefulWidget {
  const PassengersNBRSetter({Key? key}) : super(key: key);

  @override
  State<PassengersNBRSetter> createState() => _PassengersNBRSetterState();
}

class _PassengersNBRSetterState extends State<PassengersNBRSetter> {
  var _nbrplace = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F9F9),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //------- Counter plus -------//
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFEC956))),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      if (_nbrplace < 4) {
                        setState(() {
                          _nbrplace++;
                          RoadDataCollector.passengersNBR = _nbrplace;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.exposure_plus_1,
                      size: 35,
                      color: Color(0xFFFEC956),
                    ),
                  ),
                ),
            ),
            //------- Counter display -------//
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFFEC956), width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      // color: Colors.green,
                      width: 35,
                      height: 35,
                      child: Icon(
                        Icons.people,
                        size: 35,
                        color: Color(0xFFFEC956),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: Center(
                        child: Text(
                          '$_nbrplace',
                          style: const TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 25,
                              color: Colors.black54),
                        ),
                      ),
                    )
                  ],
                )
            ),
            //------- Counter Minus -------//
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFFEC956))),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      if (_nbrplace > 1) {
                        setState(() {
                          _nbrplace--;
                          RoadDataCollector.passengersNBR = _nbrplace;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.exposure_neg_1,
                      size: 35,
                      color: Color(0xFFFEC956),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
