//screen height: 834 -1194
//screen width: 375-870

import 'package:flutter/material.dart';

extension DeviceSize on BuildContext{
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.width;
}