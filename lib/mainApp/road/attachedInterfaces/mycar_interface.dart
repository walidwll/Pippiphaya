import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:carpooling/models/car.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';


class MyCarSetter extends StatefulWidget {
  const MyCarSetter({Key? key}) : super(key: key);

  @override
  State<MyCarSetter> createState() => _MyCarSetterState();
}

class _MyCarSetterState extends State<MyCarSetter> {

  final List pallet = [
                       Colors.yellow, Colors.black, Colors.white, Colors.grey,
                       Colors.blue, Colors.purple, Colors.red, Colors.brown
                      ];

  final List palletMapper = ["yellow", "black", "white", "grey", "blue", "purple", "red", "brown"];

  int palletIndicator = 1;

  int carMakeIndex = Car.makes.indexWhere((element) => element['value'] == 'BMW');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F9F9),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ---------- Car Brand && Model ---------- //
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    RoadDataCollector.myParsedCar['brand'] == '' ? '....' : "${RoadDataCollector.myParsedCar['brand']}",
                    style: const TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 24.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5
                    ),
                  ),
                  const Text(
                    ' | ',
                    style: TextStyle(
                        fontFamily: 'NunitoRegular',
                        fontSize: 24.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5
                    ),
                  ),
                  Text(
                    RoadDataCollector.myParsedCar['model'] == '' ? '..' : "${RoadDataCollector.myParsedCar['model']}",
                    style: const TextStyle(
                        fontFamily: 'NunitoRegular',
                        fontSize: 24.0,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5
                    ),
                  ),
                ],
              ),
            ),
            // ---------- Car Brand Logo img ---------- //
            Container(
              height: 200,
              width: 300,
              child: Image.asset(
                'images/${palletMapper[palletIndicator]}-car.png',
                fit: BoxFit.cover,
              )
            ),
            // ------- Available Col.ors pallet ------- //
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Extérieur',
                    style: TextStyle(
                      fontFamily: 'NunitoBold',
                      fontSize: 18.0,
                      letterSpacing: 1.5
                    ),
                  ),
                  Column(
                    children: List.generate(2, (i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (j) {
                          return Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: pallet[i*4+j],
                                border: Border.all(
                                    color: Colors.black
                                ),
                                shape: BoxShape.circle
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  palletIndicator = i*4+j;
                                  RoadDataCollector.myParsedCar["color"] = palletMapper[palletIndicator];
                                });
                              },
                              child: Text(
                                '#${(i*4+j)+1}',
                                style: TextStyle(
                                    fontFamily: 'NunitoBold',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: (i*4+j)+1 == 2 ? Colors.white : Colors.black
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  )
                ],
              ),
            ),
            // ---------- Car Brand Selector ---------- //
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Marque du voiture',
                    style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 18.0,
                        letterSpacing: 1.5
                    ),
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    initialValue: 'BMW',
                    items: Car.makes,
                    style: const TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 16.0,
                      letterSpacing: 1.5,
                      color: Colors.black54
                    ),
                    onChanged: (value) => {
                      setState(() {
                        carMakeIndex = Car.makes.indexWhere((element) => element['value'] == value);
                        RoadDataCollector.myParsedCar['brand'] = value;
                        RoadDataCollector.myParsedCar['model'] = '';
                      })
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Modèle du voiture',
                    style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 18.0,
                        letterSpacing: 1.5
                    ),
                  ),
                  SelectFormField(
                    type: SelectFormFieldType.dropdown,
                    initialValue: 'Z3',
                    items: Car.models[79 - carMakeIndex],
                    style: const TextStyle(
                        fontFamily: 'NunitoRegular',
                        fontSize: 16.0,
                        letterSpacing: 1.5,
                        color: Colors.black54
                    ),
                    onChanged: (value) => {
                      setState(() {
                        RoadDataCollector.myParsedCar['model'] = value;
                      })
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
