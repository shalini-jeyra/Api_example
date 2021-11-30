
import 'package:api_example/styles/styles.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required GlobalKey<FormState> formKey,
    required this.onpressed,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;
  final VoidCallback onpressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius:ButtonBorders.primaryButton,),
          primary: ButtonColors.primary,
          padding:
              const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        ),
        child:  Text(
          text,
          style:  const TextStyle(fontSize: 15.0, color: Colors.white),
        ),
        onPressed: onpressed
      ),
    );
  }
}