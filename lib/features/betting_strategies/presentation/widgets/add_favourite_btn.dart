import 'package:flutter/material.dart';

import '../../../../constants.dart';

class AddFavouriteButton extends StatelessWidget {
  Function() onPressed;
  AddFavouriteButton({
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Material(
        color: CustomColors.boxColor,
        elevation: 2,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 56,
        ),
      ),
    );
  }
}