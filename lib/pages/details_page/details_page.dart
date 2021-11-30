import 'package:api_example/common_widgets/common_widgets.dart';
import 'package:api_example/models/user_details.dart';
import 'package:api_example/services/global.dart';
import 'package:api_example/services/locator.dart';
import 'package:api_example/services/user_details.dart';
import 'package:api_example/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(Global.boxes[BOX_NAME.USER_ACCESS]!.get('access_token'));
    
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
            
              TextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
 
UserDetailsService userDetailsService = locator<UserDetailsService>();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserDetails>(
        future: userDetailsService.fetchUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CupertinoActivityIndicator(
              radius: 20,
            ));
          }
          if (snapshot.hasData) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    color: TextColors.ternary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('first name',style:BoldHeader.primaryText),
                        Text(snapshot.data!.firstName,style:BoldHeader.secondaryText,)
                      ],
                    ),
                  ),
                   Card(
                      color: TextColors.ternary,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('last name',style:BoldHeader.primaryText),
                        Text(snapshot.data!.lastName,style:BoldHeader.secondaryText,)
                      ],
                                     ),
                   ),
                   Card(
                      color: TextColors.ternary,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('father name',style:BoldHeader.primaryText),
                        Text(snapshot.data!.fatherName,style:BoldHeader.secondaryText,)
                      ],
                                     ),
                   ),
                   Card(
                      color: TextColors.ternary,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('mother name',style:BoldHeader.primaryText),
                        Text(snapshot.data!.motherName,style:BoldHeader.secondaryText,)
                      ],
                                     ),
                   ),
                   Card(
                      color: TextColors.ternary,
                     child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Dob',style:BoldHeader.primaryText),
                        Text(snapshot.data!.dob,style:BoldHeader.secondaryText,)
                      ],
                                     ),
                   ),
                ],
              ),
            );
          }else {
            return  const Text('Error occured while fetching user data');
          }
          
        });
  }
}
