import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../utils/app_styles.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController phoneInputController = TextEditingController();
  String initialCountry = 'TN';
  PhoneNumber number = PhoneNumber(isoCode: 'TN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F9F9),
        foregroundColor: Colors.black54,
        title: Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ The title container ---------------------- //
            Container(

              padding: const EdgeInsets.fromLTRB(0, 0, 100, 10),
              child: Text(
                'Connecter à votre compte',
                style: Styles.headLineStyle1
              ),
            ),
            // ----------------- The login form container ------------------ //
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ----------- Text 1 container --------- //
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child:  Text(
                      'Quel est votre numéro de téléphone ?',
                      style: Styles.headLineStyle6,
                    ),
                  ),
                  // ------------- Text field container ----------- //
                  Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Form(
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          countries: const ['TN'],
                          hintText: '00 000 000',
                          ignoreBlank: true,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: phoneInputController,
                          formatInput: true,
                          keyboardType:
                          const TextInputType.numberWithOptions(signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      )
                  ),
                  // --------------- Text 2 container ----------------- //
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      'Nous vous enverrons un code pour vérifier ton numéro',
                      style: Styles.headLineStyle4,
                    ),
                  ),
                  // ---------------- Login btn container ------------------ //
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      color: Styles.secondColor,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: TextButton(
                      onPressed: () { 
                        Navigator.pushNamed(context, '/main/home');
                      },
                      child: const Text(
                        'Connecter',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NunitoBold',
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  ),
                  Wrap(alignment: WrapAlignment.center,
                    children: [Text('ou',style: Styles.headLineStyle3,)],
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: FloatingActionButton.extended(
                      label: const Text(
                        'Continuer avec Facebook',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NunitoBold',
                            fontSize: 18.0
                        ),
                      ), // <-- Text
                      backgroundColor: Colors.transparent,
                      splashColor:Colors.transparent,
                      elevation: 0,
                      icon: const Icon( // <-- Icon
                        Icons.facebook_rounded,
                        size: 24.0,
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/main/home');},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                        color: Colors.blue[500],
                        borderRadius: BorderRadius.circular(25)
                    ),
                    child: FloatingActionButton.extended(
                      label: const Text(
                        'Continuer avec Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NunitoBold',
                            fontSize: 18.0
                        ),
                      ), // <-- Text
                      backgroundColor: Colors.transparent,
                      splashColor:Colors.transparent,
                      elevation: 0,
                      icon: const Icon( // <-- Icon
                        Icons.g_mobiledata_outlined,
                        size: 40.0,
                      ),
                      onPressed: () {Navigator.pushNamed(context, '/main/home');},
                    ),
                  ),
                ],
              ),
            )
            // --------------- ** End login container ** ------------------- //
          ],
        ),
      ) // ----------------- ** End main container ** -------------------- //
    );
  }
}
