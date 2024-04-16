import 'package:flutter/material.dart';

class PreviewProfilePictDialog extends StatelessWidget {

  String imgFile;

  PreviewProfilePictDialog({required this.imgFile});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(this.imgFile),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}