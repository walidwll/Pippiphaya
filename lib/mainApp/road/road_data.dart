import 'dart:convert';

import 'package:carpooling/models/user.dart';

class RoadDataCollector {
  static String startingStation = '';
  static String arrivalStation = '';
  static String leavingTime = '';
  static String arrivalTime = '';
  static int passengersNBR = 1;
  static String baggageType = '';
  static bool isDirectRoad = false;
  static double price = 15.0;
  static String leavingDate = '';
  final _myCar = '{"brand": "BMW", "model": "Z3", "color": "black", "isW": "false", "registrationNBR": "", "registrationNBR_1nbr": "", "registrationNBR_2nbr": ""}';
  static var myParsedCar;

  RoadDataCollector(){
    myParsedCar = jsonDecode(_myCar);
  }

  static String getRoadData(){
    return "Road data : \n"
        "\t\t* Publisher ID : ${User.id}\n"
        "\t\t* Leaving Station : ${RoadDataCollector.startingStation}\n"
        "\t\t* Arrival Station : ${RoadDataCollector.arrivalStation}\n"
        "\t\t* Passenger NBR : ${RoadDataCollector.passengersNBR}\n"
        "\t\t* Leaving Time : ${RoadDataCollector.leavingTime}\n"
        "\t\t* Arrival Time : ${RoadDataCollector.arrivalTime}\n"
        "\t\t* Leaving Date : ${RoadDataCollector.leavingDate}\n"
        "\t\t* Car data : ${RoadDataCollector.myParsedCar}\n"
        "\t\t* Road is direct ? : ${RoadDataCollector.isDirectRoad}\n"
        "\t\t* Baggage type: ${RoadDataCollector.baggageType}\n"
        "\t\t* Carpooling price : ${RoadDataCollector.price}\n";
  }

  static List<String> validateData() {
    List<String> errors = [];
    if(startingStation == ''){
      errors.add("Le point de départ non fixer!");
    }
    if(arrivalStation == ''){
      errors.add("Le point d'arrivé non fixer!");
    }
    if(leavingTime == ''){
      errors.add("Le temp de départ est obligatoire!");
    }
    if(arrivalTime == ''){
      errors.add("Le temp d'arrivé est obligatoire!");
    }
    if(leavingDate == ''){
      errors.add("La date d'arrivé est obligatoire!");
    }
    if(myParsedCar["registrationNBR"]=="" && (myParsedCar["registrationNBR_1nbr"]=="" && myParsedCar["registrationNBR_2nbr"]=="")){
      errors.add("Immatriculation est obligatoire!");
    }
    return errors;
  }


}