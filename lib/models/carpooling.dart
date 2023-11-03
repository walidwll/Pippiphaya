import 'dart:convert';
import 'dart:developer';

import 'package:carpooling/models/user.dart';
import 'package:carpooling/network_utils/api.dart';

class Carpooling {
  // static String startingStation = '';
  // static String arrivalStation = '';
  // static String leavingTime = '';
  // static String arrivalTime = '';
  // static int passengersNBR = 1;
  // static String baggageType = '';
  // static bool isDirectRoad = false;
  // static double price = 15.0;
  // static String leavingDate = '';
  // final _myCar = '{"brand": "BMW", "model": "Z3", "color": "black", "isW": "false", "registrationNBR": "", "registrationNBR_1nbr": "", "registrationNBR_2nbr": ""}';
  static var carData;
  static List carpoolingsToBrowse = [];
  static List carpoolings = [];
  static List availableDestinations = [];


  Future<void> getAllCarpoolings() async {
    var res = await Network().getData('/carpooling/getAll');
    var body = json.decode(res.body);
    if(body['success'] == true){
      carpoolings = body['carpoolings'];
      // if(carpoolings.isNotEmpty){
      //   carpoolings = [];
      // }
      for(var i=0; i<carpoolings.length; i++){
        if(carpoolings[i]['userId'] != User.id){
          carpoolingsToBrowse.add(carpoolings[i]);
        }
      }
      for(var i=0; i<carpoolingsToBrowse.length; i++){
       availableDestinations.add("${carpoolingsToBrowse[i]['startingStation']}-${carpoolingsToBrowse[i]['arrivalStation']}");
      }
    }
    else{
      log('Log From Carpoolings fetcher: \n\t\t\t * Response Body: $body');
    }
  }


  Future<void> updateCarpoolingStatus(int carpoolingID, String status) async{
    var res = await Network().updateData({'status': status}, "/carpooling/updateStatus/$carpoolingID");
    var body = json.decode(res.body);
    log('Log from updateCarpoolingStatus : $body');
  }


  List myCarpoolings() {
    var myCarpoolings = [];
    for(var i=0; i<carpoolings.length; i++){
      if(carpoolings[i]['userId'] == User.id){
        myCarpoolings.add(carpoolings[i]);
      }
    }
    return myCarpoolings;
  }


  Map<String, dynamic> findCarpoolingByID(int carpoolingID) {
    var index = carpoolings.indexWhere((element) => element['id']==carpoolingID);
    return carpoolings[index];
  }

  // int availablePlaces(){
  //
  //   return 0;
  // }

}