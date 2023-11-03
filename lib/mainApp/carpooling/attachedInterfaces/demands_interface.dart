import 'dart:developer';

import 'package:carpooling/mainApp/carpooling/attachedWidgets/demandcard_widget.dart';
import 'package:flutter/material.dart';

class CarpoolingDemands extends StatefulWidget {
  const CarpoolingDemands({Key? key}) : super(key: key);

  @override
  State<CarpoolingDemands> createState() => _CarpoolingDemandsState();
}

class _CarpoolingDemandsState extends State<CarpoolingDemands> {
  List data = [];
  Map<String, dynamic> carpoolingData = {};
  List demands = [];
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty? data : ModalRoute.of(context)?.settings.arguments as List;
    carpoolingData = data[0];
    demands = data[1];
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
      ),
      // ------------------------ ****************** ------------------------ //
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: const Color(0xFFF3F9F9),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "${carpoolingData['startingStation']}-${carpoolingData['arrivalStation']}",
                  style: const TextStyle(
                    fontFamily: 'NunitoBold',
                    fontSize: 20
                  ),
                ),
                Text(
                  "${carpoolingData['leavingDate']}",
                  style: const TextStyle(
                    fontFamily: 'NunitoBold',
                    fontSize: 18,
                    color: Colors.black38
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(demands.length, (index) {
                  return Container(
                    color: const Color(0xFFF3F9F9),
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: DemandCard(demands[index])
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
