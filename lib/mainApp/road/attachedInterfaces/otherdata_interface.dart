import 'dart:developer';

import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';



class OtherData extends StatefulWidget {
  const OtherData({Key? key}) : super(key: key);

  @override
  State<OtherData> createState() => _OtherDataState();
}

class _OtherDataState extends State<OtherData> {

  bool isDirect = false;
  bool isHeavy = false;
  bool isLight = false;
  bool isOrdinary = false;
  bool isNoBag = false;
  double priceValue = 15;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color(0xFFF3F9F9),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: [
            // -------------- Interface title -------------- //
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: const Text(
                "Informations complémentaires à ton covoiturage",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'NunitoBold',
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900
                ),
              ),
            ),
            // ------------ Is direction direct ------------ //
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              color: Colors.black12,
              child: Row(
                children: [
                  Checkbox(
                    value: isDirect,
                    onChanged: (value) {
                      setState(() {
                        isDirect = value!;
                        RoadDataCollector.isDirectRoad = value!;
                      });
                    },
                  ),
                  const Text(
                    'Covoiturage directe',
                    style: TextStyle(
                      fontFamily: 'NunitoRegular',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    )
                  )
                ],
              ),
            ),
            // -------------- Type of baggage -------------- //
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: const Text(
                      'Type de baggage',
                      style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0,
                          letterSpacing: 1.5
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        color: Colors.black12,
                        width: (MediaQuery.of(context).size.width / 2) - 50,
                        height: 100,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isHeavy,
                              onChanged: (value) {
                                setState(() {
                                  isHeavy = value!;
                                  isNoBag = false;
                                  isLight = false;
                                  isOrdinary = false;
                                  RoadDataCollector.baggageType = 'heavy';
                                });
                                log('baggage type : $value');
                              },
                            ),
                            const Icon(
                              Icons.card_travel_sharp,
                              size: 20,
                            ),
                            const Text(
                              'Lourd',
                              style: TextStyle(
                                  fontFamily: 'NunitoRegular',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        color: Colors.black12,
                        width: (MediaQuery.of(context).size.width / 2) - 50,
                        height: 100,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isLight,
                              onChanged: (value) {
                                setState(() {
                                  isLight = value!;
                                  isHeavy = false;
                                  isNoBag = false;
                                  isOrdinary = false;
                                  RoadDataCollector.baggageType = 'light';
                                });
                                log('baggage type : $value');
                              },
                            ),
                            const Icon(
                              Icons.card_travel_sharp,
                              size: 20,
                            ),
                            const Text(
                              'Léger',
                              style: TextStyle(
                                  fontFamily: 'NunitoRegular',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        color: Colors.black12,
                        width: (MediaQuery.of(context).size.width / 2) - 50,
                        height: 100,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isOrdinary,
                              onChanged: (value) {
                                setState(() {
                                  isOrdinary = value!;
                                  isHeavy = false;
                                  isLight = false;
                                  isNoBag = false;
                                  RoadDataCollector.baggageType = 'ordinary';
                                });
                                log('baggage type : $value');
                              },
                            ),
                            const Icon(
                              Icons.card_travel_sharp,
                              size: 20,
                            ),
                            const Text(
                              'Moyenne',
                              style: TextStyle(
                                  fontFamily: 'NunitoRegular',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        color: Colors.black12,
                        width: (MediaQuery.of(context).size.width / 2) - 50,
                        height: 100,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isNoBag,
                              onChanged: (value) {
                                setState(() {
                                  isNoBag = value!;
                                  isHeavy = false;
                                  isLight = false;
                                  isOrdinary = false;
                                  RoadDataCollector.baggageType = 'NaN';
                                });
                                log('baggage type : $value');
                              },
                            ),
                            const Icon(
                              Icons.card_travel_sharp,
                              size: 20,
                            ),
                            const Text(
                              'Pas',
                              style: TextStyle(
                                  fontFamily: 'NunitoRegular',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: const Text(
                      'Prix de covoiturage',
                      style: TextStyle(
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0,
                          letterSpacing: 1.5
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '$priceValue DNT',
                          style:  TextStyle(
                            fontFamily: 'NunitoBold',
                            fontSize: 20.0,
                            color: Styles.secondColor
                          ),
                        ),
                        SfSlider(
                          value: priceValue,
                          stepSize: 5,
                          min: 5.0,
                          max: 100.0,
                          interval: 10,
                          activeColor: Colors.blueGrey[300],
                          inactiveColor: Colors.black12,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: true,
                          minorTicksPerInterval: 1,
                          onChanged: (dynamic value){
                            setState(() {
                              RoadDataCollector.price = value;
                              priceValue = value;
                            });
                            log('Price = $value');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
        )
      ),
    );
  }
}
