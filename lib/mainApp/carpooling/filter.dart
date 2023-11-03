import 'dart:developer';

import 'package:carpooling/models/carpooling.dart';
import 'package:intl/intl.dart';

class CarpoolingsFilter{

  final _initDate = DateTime.now();
  final _intiFormatter = DateFormat('dd MMMM yyy : dd/MM/yyyy');

  static bool priceFilter = false;
  static String dateFilter = '';

  static List filteredList = [];




  CarpoolingsFilter(){
    filteredList = [];
    dateFilter = _intiFormatter.format(_initDate);
    for(var i=0; i<Carpooling.carpoolingsToBrowse.length; i++){
      filteredList.add(Carpooling.carpoolingsToBrowse[i]);
    }
  }

  void updateFilteredList(String station1, String station2) {
    if (station1 != '' && station2 != '') {
      CarpoolingsFilter.filteredList.removeWhere((item) =>
      item['startingStation'] != station1 ||
          item['arrivalStation'] != station2);
    }
    else{
      CarpoolingsFilter.filteredList.isEmpty==false ? CarpoolingsFilter.filteredList = [] : CarpoolingsFilter.filteredList;
      for(var i=0; i<Carpooling.carpoolingsToBrowse.length; i++){
        CarpoolingsFilter.filteredList.add(Carpooling.carpoolingsToBrowse[i]);
      }
    }
  }

  void commitFilteredList(){
    CarpoolingsFilter.filteredList.removeWhere((item) => item['leavingDate'] != CarpoolingsFilter.dateFilter);
    if(priceFilter == true){
      CarpoolingsFilter.filteredList.sort((itemA, itemB) =>itemA['price'].compareTo(itemB['price']));
    }
  }


}