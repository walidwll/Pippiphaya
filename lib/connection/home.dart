import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
class ConnectionHome extends StatefulWidget {
  const ConnectionHome({Key? key}) : super(key: key);

  @override
  State<ConnectionHome> createState() => _ConnectionHomeState();
}

class _ConnectionHomeState extends State<ConnectionHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF3F3F9F9),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  // color: Colors.red,
                  child: Image.asset(
                    'images/pippip.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  // color: Colors.blue,
                  child: Image.asset(
                    'images/Car1.png',
                    width: 215,
                    height: 215,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      'Voyager confortablement et au prix les plus bas',
                      textAlign: TextAlign.center,
                      style: Styles.headLineStyle1.copyWith(fontWeight: FontWeight.w600)
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Des certaines d'offres de covoiturage publiées chaque jour",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                          fontFamily: 'NunitoMedium'),
                    ),
                  ),
                ),
              ),
              const Expanded(flex: 3, child: SizedBox(height: 200.0)),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Styles.secondColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                            color: Color(0xF3F3F9F9),
                            fontSize: 16,
                            fontFamily: "NunitoBold",
                            letterSpacing: 1.5),
                      )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.purple,
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xE0E0E0E0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          )
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: "NunitoBold",
                            letterSpacing: 1.5
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
