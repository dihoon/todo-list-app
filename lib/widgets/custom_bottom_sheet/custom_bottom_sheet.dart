import 'package:flutter/material.dart';
import 'package:todo_list/styles/colors.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: '오늘의 할 일',
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2)),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_circle_up))
          ],
        ),
      ),
    );
  }
}
