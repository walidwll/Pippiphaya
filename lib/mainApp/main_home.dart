import 'package:carpooling/mainApp/navigationPages/carpooling_pg.dart';
import 'package:carpooling/mainApp/navigationPages/driver_pg.dart';
import 'package:carpooling/mainApp/navigationPages/passenger_pg.dart';
import 'package:carpooling/mainApp/navigationPages/wallet_pg.dart';
import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';
import '../models/user.dart';
import '../utils/icons.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  int pageIndex = 0;
  final navigationItems = [
    const PassengerPage(),
    const DriverPage(),
    const CarpoolingPage(),
    const WalletPage()
  ];
  void _onItemTapped(int index){
    setState(() {
      pageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F9F9),
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          // ##### Row : the main action of the top menu
          Container(
            color: const Color(0xFFF3F9F9),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ====================
                // User-Profile section
                InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[100],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: CircleAvatar(
                      minRadius: 40.0,
                      maxRadius: 40.0,
                      backgroundImage: AssetImage(User.image),
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/main/profile');
                  },
                ),
                // ====================
                // Help-Chat section
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                  height: 45,
                  child: Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                          color: Colors.amber[500],
                          borderRadius: BorderRadius.circular(35),
                      ),

                        child: Wrap(
                          spacing: -5,
                          alignment: WrapAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [

                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.report_problem_outlined,
                                color: Colors.black87,
                                size: 22,
                              ),
                            ),
                            Text("Aide  ",style: Styles.headLineStyle6,)
                          ],
                        ),
                      ),
                      Container(
                        // color: const Color(0xFFFEC956),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chat,
                            color: Colors.black54,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                )
                // ====================
              ],
            ),
          )
          // ##### ######################################
        ],
      ),
      // ------------------------ ****************** ------------------------ //
      // ------------------------  The Body Section  ------------------------ //
      body: Container(
        color: const Color(0xFFF3F9F9),
        child: navigationItems[pageIndex],
      ),
      // ------------------------ ****************** ------------------------ //
      // ---------------------- The BTM_NavBar Section ---------------------- //
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: _onItemTapped,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.cyan,
          unselectedItemColor: const Color(0xFF526480),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Passager"),
            BottomNavigationBarItem(icon: Icon(MyFlutterApp.steering_wheel), label: "Conducteur"),
            BottomNavigationBarItem(icon: Icon(Icons.family_restroom) , label: "Covoiturages"),
            BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Wallet")
          ]),
      // ------------------------ ****************** ------------------------ //
    );
  }
}
