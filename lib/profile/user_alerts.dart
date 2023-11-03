import 'package:flutter/material.dart';

class UserAlerts extends StatefulWidget {
  const UserAlerts({Key? key}) : super(key: key);

  @override
  State<UserAlerts> createState() => _UserAlertsState();
}

class _UserAlertsState extends State<UserAlerts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ------------------------ The AppBar Section ------------------------ //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
        children: [],
      ),
    );
  }
}
