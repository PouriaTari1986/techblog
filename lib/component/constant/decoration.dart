


import 'package:flutter/widgets.dart';
import 'package:my_blog/component/constant/my_colors.dart';

class MyDecoration {

  MyDecoration._();

  static BoxDecoration mainGradiant = BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              gradient: LinearGradient(colors: GradiantColors.bottomNavigation),
            );


}