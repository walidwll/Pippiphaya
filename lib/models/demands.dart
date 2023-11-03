import 'dart:convert';
import 'dart:developer';

import 'package:carpooling/models/user.dart';
import 'package:carpooling/network_utils/api.dart';

class Demands {

  static List myDemands = [];
  static List _allDemands = [];

  Future<void> getAllMyDemands() async {
    var res = await Network().getData('/travelDemand');
    var body = json.decode(res.body);
    if(body['success'] == true){
      _allDemands = body['demands'];
      for(var i=0; i<_allDemands.length; i++){
        if(_allDemands[i]['passenger_ondemand'] == User.id){
          myDemands.add(_allDemands[i]);
        }
      }
    }
    else{
      log('Log From MyDemands fetcher: \n\t\t\t * Response Body: $body');
    }
  }

  Future<void> updateDemand(int demandID, bool status) async{
    log('Log from updateDemand : $demandID');
    var res = await Network().updateData({'isAccepted': status}, "/travelDemand/$demandID");
    var body = json.decode(res.body);
    log('Log from updateDemand : $body');
  }

  List getDemands(int carpoolingID){
    var demands = [];
    for(var i=0; i<_allDemands.length; i++){
      if(_allDemands[i]['carpooling_id'] == carpoolingID){
        demands.add(_allDemands[i]);
      }
    }
    return demands;
  }



  List getInProgressDemands(int carpoolingID){
    var inProgressDemands = [];
    for(var i=0; i<_allDemands.length; i++){
      if(_allDemands[i]['carpooling_id'] == carpoolingID && _allDemands[i]['isAccepted'] == null){
        inProgressDemands.add(_allDemands[i]);
      }
    }
    return inProgressDemands;
  }



  List getConfirmedDemands(int carpoolingID){
    var confirmedDemands = [];
    for(var i=0; i<_allDemands.length; i++){
      if(_allDemands[i]['carpooling_id'] == carpoolingID && _allDemands[i]['isAccepted'] == true){
        confirmedDemands.add(_allDemands[i]);
      }
    }
    return confirmedDemands;
  }

}