import 'package:flutter/material.dart';
import 'package:todo_list/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';

mixin HomeController {
  void onFloatingButtonPressed(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomBottomSheet();
        });
  }
}
