import 'package:flutter/material.dart';

const String notFoundImage = "assets/images/not_found.jpg";

double mqHeigth(BuildContext context, double percentage){
  return MediaQuery.of(context).size.height * (percentage/100);
}
double mqWidth(BuildContext context, double percentage){
  return MediaQuery.of(context).size.width * (percentage/100);
}