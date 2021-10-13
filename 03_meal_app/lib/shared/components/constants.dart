import 'package:flutter/material.dart';

BorderRadius myBorderRadius({double num = 15.0}) => BorderRadius.circular(num);

EdgeInsets myEdgeInsets({double num = 15.0}) => EdgeInsets.all(num);

TextStyle titleStyle(BuildContext context) => Theme.of(context).textTheme.headline6!;
// ! cuz iam sure it will not be null
