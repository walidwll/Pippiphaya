import 'dart:developer';

import 'package:carpooling/cnst_data/locales.dart';
import 'package:carpooling/mainApp/road/road_data.dart';
import 'package:carpooling/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';


class StartStationSetter extends StatefulWidget {

  const StartStationSetter({super.key});

  @override
  State<StartStationSetter> createState() => _StartStationSetterState();

}

class _StartStationSetterState extends State<StartStationSetter> {

  TextEditingController searchFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchFieldController.addListener(() {
      RoadDataCollector.startingStation = searchFieldController.text;
    });
  }

  // @override
  // void dispose() {
  //   searchFieldController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F9F9),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // ------------------------- The Main column -------------------------//
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ##############################
          // >>>>> The title main container
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              // StationsSetter.isArrival == false ? "Selectionner votre lieu de départ.": "Selectionner votre lieu d'arrivé.",
              "Selectionner votre lieu de départ.",
              style: Styles.headLineStyle1,
            ),
          ),
          // The title main container <<<<<
          //###############################
          // >>>>> The Search bar container
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Form(
              child: Row (
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton (
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextFieldSearch(
                      label: 'Start',
                      initialList: Locales.cities,
                      controller: searchFieldController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Chercher une ville de départ",
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
          // ################################
        ],
      ),
    );
    // ------------------------- *************** -------------------------//
  }
}
