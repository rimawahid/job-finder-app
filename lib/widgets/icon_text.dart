import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconText extends StatelessWidget {
  //const IconText({Key? key}) : super(key: key);
  final IconData icon;
  final String text;
  IconText(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.yellow,
        ),
        SizedBox(width: 18,),
        Text(
          text,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        )
      ],
    );
  }
}
