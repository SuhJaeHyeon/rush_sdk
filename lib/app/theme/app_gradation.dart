import 'package:flutter/material.dart';

class AppGradation {
  static const bluePurple = LinearGradient(
    begin: Alignment(-0.7142742872238159, 0.5750824213027954),
    end: Alignment(-0.5750824213027954, -0.46846237778663635),
    colors: [
      Color.fromRGBO(130, 94, 245, 1),
      Color.fromRGBO(103, 123, 241, 1),
      Color.fromRGBO(86, 162, 237, 1),
      Color.fromRGBO(89, 195, 235, 1),
    ],
  );

  static const blue = LinearGradient(
    begin: Alignment(6.123234262925839e-17, 1),
    end: Alignment(-1, 6.123234262925839e-17),
    colors: [
      Color.fromRGBO(97, 159, 255, 1),
      Color.fromRGBO(56, 134, 255, 1),
    ],
  );
}
