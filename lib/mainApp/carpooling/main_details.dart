import 'dart:convert';

import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/carpooling.dart';



class CarpoolingMainDetails extends StatefulWidget {
  const CarpoolingMainDetails({Key? key}) : super(key: key);

  @override
  State<CarpoolingMainDetails> createState() => _CarpoolingMainDetailsState();
}

class _CarpoolingMainDetailsState extends State<CarpoolingMainDetails> {

  Map carpoolingData = {};
  Map carData = {};
  Map baggageTypeMapper = {'heavy': 'Lourd', 'light': 'Léger', 'NaN': 'Pas', 'ordinary': 'Moyenne'};
  List confirmedPassengers = [];
  List confirmedDemands = [];
  int availablePlaces = 0;


  @override
  Widget build(BuildContext context) {
    carpoolingData = carpoolingData.isNotEmpty
                     ? carpoolingData
                     : ModalRoute.of(context)?.settings.arguments as Map;
    Map<String, dynamic> driver = User().findUserByID(carpoolingData['userId']);
    carData = json.decode(carpoolingData['carData']);
    confirmedDemands = Demands().getConfirmedDemands(carpoolingData['id']);
    availablePlaces = carpoolingData['passengersNBR'] - confirmedDemands.length;
    for(var i=0; i<confirmedDemands.length; i++){
      var confirmedPassenger = User().findUserByID(confirmedDemands[i]['passenger_ondemand']);
      confirmedPassengers.add(confirmedPassenger);
    }
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
        actions: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'X',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'NunitoMedium',
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
      // ------------------------ ****************** ------------------------ //
      // ------------------------ Main Deta_ils body ------------------------ //
      body: Container(
        color: const Color(0xFFF3F9F9),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ########### Date as title of page ########### //
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Le ${carpoolingData['leavingDate']}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'NunitoBold',
                      fontSize: 26.0,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              // ########### Destinations && times ########### //
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    // ----------> Expanded for the trip road design
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEC956),
                              border: Border.all(
                                color: Styles.primaryColor,
                                width: 3
                              ),
                              borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                          // *******************************
                          for(var j=0; j<20; j++)
                            Container(
                              width: 2,
                              height: 5,
                              color: Styles.primaryColor,
                              margin: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                          ),
                          // *******************************
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFEC956),
                              border: Border.all(
                                color: Styles.primaryColor,
                                width: 3
                              ),
                              borderRadius: BorderRadius.circular(15)
                            ),
                          )
                        ],
                      ),
                    ),
                    // -----------> Expanded for the stations box
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Container for the leaving station details
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black12,
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black12,
                                        width: 1
                                      )
                                    )
                                  ),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.location_pin,
                                          size: 25,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              carpoolingData['startingStation'],
                                              style: const TextStyle(
                                                fontFamily: 'NunitoBold',
                                                fontSize: 22,
                                              ),
                                            ),
                                            const Text(
                                              'autre',
                                              style: TextStyle(
                                                fontFamily: 'NunitoMedium',
                                                fontSize: 18,
                                                color: Colors.black38,
                                                letterSpacing: 1.5
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.black12,
                                        width: 1
                                      )
                                    )
                                  ),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.access_time_filled_outlined,
                                          size: 25,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          carpoolingData['leavingTime'],
                                          style: const TextStyle(
                                            fontFamily: 'NunitoBold',
                                            fontSize: 22,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Container for the arrival station details
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.black12,
                                width: 1
                              ),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12,
                                              width: 1
                                          )
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.location_pin,
                                          size: 25,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              carpoolingData['arrivalStation'],
                                              style: const TextStyle(
                                                fontFamily: 'NunitoBold',
                                                fontSize: 22,
                                              ),
                                            ),
                                            const Text(
                                              'autre',
                                              style: TextStyle(
                                                  fontFamily: 'NunitoMedium',
                                                  fontSize: 18,
                                                  color: Colors.black38,
                                                  letterSpacing: 1.5
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.black12,
                                              width: 1
                                          )
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.access_time_filled_outlined,
                                          size: 25,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          carpoolingData['arrivalTime'],
                                          style: const TextStyle(
                                            fontFamily: 'NunitoBold',
                                            fontSize: 22,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // ################ Other__data ################ //
              Container(
                color: Colors.white,
                height: 250,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.chair,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$availablePlaces",
                                    style: const TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18
                                    ),
                                  ),
                                  const Text(
                                    "restant(s)",
                                    style: TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    "${carpoolingData['passengersNBR']} Total",
                                    style: const TextStyle(
                                      fontFamily: 'NunitoBold',
                                      fontSize: 18,
                                      color: Colors.black38
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.directions_car_filled,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${carData['brand'].toString().characters.toUpperCase()}",
                                    style: const TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    "${carData['color'].toString().characters.toUpperCase()}",
                                    style: const TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18,
                                        color: Colors.black38
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.shopping_bag,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${baggageTypeMapper[carpoolingData['baggageType']]}",
                                    style: const TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.directions,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Covoiturage",
                                    style: TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    carpoolingData["isDirect"] == true ? "DIRECT" : "NON DIRECT",
                                    style: const TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18,
                                        color: Colors.black38
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // ############# Price of the trip ############# //
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.black12,
                      width: 1
                    )
                  )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Prix total pour 1 passager',
                      style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 18,
                        color: Colors.black38
                      ),
                    ),
                    Text(
                      "${carpoolingData['price']} DNT",
                      style: const TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 18,
                        fontWeight: FontWeight.w900
                      ),
                    )
                  ],
                ),
              ),
              // ########### User profile of driver ########## //
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Styles.primaryColor.withAlpha(50),
                            shape: BoxShape.circle
                        ),
                        child:
                        driver['image'] == 'NaN'
                        ?IconButton(
                          onPressed: () {  },
                          icon:  Icon(
                            Icons.person,
                            color: Styles.primaryColor,
                          ),
                        )
                        :ImageIcon(
                          AssetImage('${driver["image"]}'),
                          size: 20,
                        )
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            driver['firstName'],
                            style: const TextStyle(
                              fontFamily: 'NunitoBold',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: CupertinoColors.systemYellow,
                              ),
                              Text(
                                '4.3/5 - 3 avis',
                                style: TextStyle(
                                  fontFamily: 'NunitoBold',
                                  fontSize: 16,
                                  color: Colors.black38
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.navigate_next,
                          size: 20,
                          color: Colors.black38,
                        ),
                      )
                    ),
                  ],
                ),
        ),
              // ###### Confirmed passengers by driver ####### //
              Container(
                color: Colors.white,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Passager(s) confirmé(s)',
                      style: TextStyle(
                        fontFamily: 'NunitoBold',
                        fontSize: 22,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    confirmedPassengers.isNotEmpty ?
                    Container(
                      height: 150,
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(confirmedPassengers.length, (index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Styles.primaryColor.withAlpha(50),
                                          shape: BoxShape.circle
                                      ),
                                      child: confirmedPassengers[index]['image']== 'NaN' ?
                                      IconButton(
                                        onPressed: () {  },
                                        icon:  Icon(
                                          Icons.person,
                                          color: Styles.primaryColor,
                                        ),
                                      )
                                      :
                                      ImageIcon(
                                        AssetImage(confirmedPassengers[index]['image'])
                                      )
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      "${confirmedPassengers[index]['firstName']}",
                                      style: const TextStyle(
                                        fontFamily: 'NunitoBold',
                                        fontSize: 18.0
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.navigate_next,
                                        size: 20,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                        )
                      ),
                    )
                    :Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- The BTM_NavBar Section ---------------------- //
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0xFFF3F9F9),
          border: Border(
              bottom: BorderSide.none,
              left: BorderSide.none,
              right: BorderSide.none,
              top: BorderSide(
                  color: Colors.black26,
                  style: BorderStyle.solid,
                  width: 1
              )
          ),
        ),
        // ##### Row : the main row child of the btm menu
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/main/confirmCarpooling", arguments: carpoolingData);
          },
          child: Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: Styles.primaryColor,
              borderRadius: BorderRadius.circular(25)
            ),
            child: const Center(
              child: Text(
                "Réserver",
                style: TextStyle(
                  fontFamily: 'NunitoBold',
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),
        // ##### ########################################
      ),
      // ------------------------ ****************** ------------------------ //
    );
  }
}

