import 'package:api_example/common_widgets/common_widgets.dart';
import 'package:api_example/pages/pages.dart';
import 'package:api_example/services/auth.dart';
import 'package:api_example/services/locator.dart';
import 'package:api_example/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Loginpage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Loginpage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isLogged=false;
    AuthService authService = locator<AuthService>();
    TextEditingController userTextController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(
                  255,
                  242,
                  123,
                  2,
                ),
                Color.fromARGB(
                  255,
                  255,
                  155,
                  21,
                )
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                " Log in with",
                style: SmallHeader.primaryText,
              ),
              TextFieldWidget(
                text: 'User Name',
                controller: userTextController,
              ),
              TextFieldWidget(text: 'Password', controller: passwordController),
              ButtonWidget(
                text: 'Login',
                formKey: _formKey,
                onpressed: ()async {
                  isLogged=await 
                  authService.login(
                      userTextController.text, passwordController.text);
                  if(isLogged){
                     Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(),
                    ),
                  );
                  }
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
