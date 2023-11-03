import 'package:flutter/material.dart';
Color primary = const Color.fromRGBO(20,197,229,1.0);
class Styles{
  static Color primaryColor =primary;
  static Color secondColor =const Color(0xFFFF9412);
  static Color textColor =const Color.fromRGBO(0, 0, 0, 1.0);
  static Color textColor2 =const Color.fromRGBO(20, 18, 22, 0.65);
  static Color textColor3 =const Color.fromRGBO(128, 121, 128, 0.8);
  static Color bgColor =const Color.fromRGBO(255, 255, 255, 1);
  static Color bgColor2 =const Color.fromRGBO(99,231,255,0.15);
  static TextStyle textStyle = TextStyle(fontSize: 18,color: textColor,fontWeight: FontWeight.w600,fontFamily: 'OpenSans',height: 10 );
  static TextStyle headLineStyle1 = TextStyle(fontSize: 24,color: textColor,fontWeight: FontWeight.w700,fontFamily: 'Poppins');
  static TextStyle headLineStyle2 = TextStyle(fontSize: 20,color: textColor,fontWeight: FontWeight.w500,fontFamily: 'Poppins');
  static TextStyle headLineStyle3 = TextStyle(fontSize: 14,color: textColor2,fontWeight: FontWeight.w600,fontFamily: 'Poppins' );
  static TextStyle headLineStyle4 = TextStyle(fontSize: 13,color: textColor3,fontWeight: FontWeight.w600,fontFamily: 'OpenSans' );
  static TextStyle headLineStyle5 = const TextStyle(fontSize: 19,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Inter');
  static TextStyle headLineStyle6 = TextStyle(fontSize: 16,color: textColor,fontWeight: FontWeight.normal,fontFamily: 'Poppins' );
}