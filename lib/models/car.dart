import 'dart:convert';
import 'dart:developer';

import 'package:carpooling/network_utils/api.dart';

class Car {

  static List<Map<String, dynamic>> makes = [{'value' : 'other', 'label':'other'}];
  static List models = [];

  Future<void> getCarsMakes() async {
    var res = await Network().getData('/getMakes');
    var body = json.decode(res.body);
    if(body['success'] == true){
      for(final item in body['makes']){
        Car.makes.insert(0,{'value': item['make'], 'label': item['make']});
      }
    }
    else{
      log("getCarsMakes() : No data to return.");
    }
    // log('MAKES : ${Car.makes}\n\n');
  }

  Future<void> getCarsModels() async {
    List<Map<String, dynamic>> list = [{'value' : 'other', 'label':'other'}];
    var res = await Network().getData("/getModels");
    var body = json.decode(res.body);
    if (body['success'] == true) {
      for(final make in Car.makes) {
        for (final item in body['models']) {
          if(item['make'] == make['value']){
            if(list.indexWhere((element) => element['value'] == item['model']) == -1) {
              list.insert(0, {'value': item['model'], 'label': item['model']});
            }
          }
        }
        Car.models.insert(0, list);
        list = [{'value' : 'other', 'label':'other'}];
      }
    }
    else {
      log('Body inspection : $body');
    }
    // log('Car.makes length : ${Car.makes.length}');
    // log('Car.models length : ${Car.models.length}');
    // log('Audi Index : ${Car.makes.indexWhere((element) => element['value'] == 'Volvo')}\n\n');
    // log('MODELS : ${Car.models[5]}\n\n');
  }

}