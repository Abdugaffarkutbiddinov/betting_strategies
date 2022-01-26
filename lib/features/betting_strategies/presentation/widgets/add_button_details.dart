import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButtonDetails extends StatelessWidget {
  AddButtonDetails({required this.text, required this.onPressed});

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 259, height: 59),
      child: ElevatedButton(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                // fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: Colors.blueGrey)))),
        onPressed: onPressed,
      ),
    );
  }
}
