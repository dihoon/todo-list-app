import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String content;
  final bool isCompleted;

  const Todo({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.black,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}'),
                    Text(
                        '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}')
                  ],
                ),
                SizedBox(width: 10),
                Expanded(child: Text('내용')),
                IconButton(
                    iconSize: 30,
                    color: Colors.red,
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Icon(Icons.check_box_outline_blank)),
              ],
            ),
          ),
        ));
  }
}
