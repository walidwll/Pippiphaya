// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:carpooling/mainApp/main_home.dart';
import 'package:carpooling/models/car.dart';
import 'package:carpooling/models/carpooling.dart';
import 'package:carpooling/models/demands.dart';
import 'package:carpooling/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void collectingData() async {
    Car car = Car();
    log('Loading car makes data...');
    await car.getCarsMakes();
    log('End car makes data fetch.');
    log('Loading car models data...');
    await car.getCarsModels();
    log('End car model data fetch.');
    User user = User();
    log('Loading user data...');
    await user.loadUserData();
    log('End user data fetch');
    log('Loading all users data...');
    await user.loadAllUsersData();
    log('End user data fetch');
    Carpooling carpooling = Carpooling();
    log('Loading carpoolings data...');
    await carpooling.getAllCarpoolings();
    log('End carpoolings data fetch.');
    Demands demands = Demands();
    log('Loading myDemands data...');
    await demands.getAllMyDemands();
    log('End myDemands data fetch');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MainHome()
        )
    );
  }

  @override
  void initState() {
    super.initState();
    collectingData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFFF3F9F9),
        body: Center(
            child: SpinKitFadingCircle(
              color:  Color(0xFF01AB8E),
              size: 50.0,
            )
        )
    );
  }
}
