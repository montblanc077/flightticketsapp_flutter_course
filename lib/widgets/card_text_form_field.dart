import 'package:flutter/material.dart';
import 'package:flighttickets/constants/constants.dart';

class CardTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final Function changeData;
  final Function tapData;

  CardTextFormField(
      {@required this.hintText,
      @required this.labelText,
      this.changeData,
      this.tapData});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: TextInputType.text,
          cursorColor: mainColor,
          decoration: InputDecoration(
            hintText: hintText, // 'Munich (MUC)'
            labelText: labelText, // 'From'
          ),
          onChanged: changeData,
          onTap: tapData,
        ),
      ),
    );
  }
}
