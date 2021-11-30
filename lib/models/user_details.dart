import 'dart:convert';

class UserDetails {
  String firstName;
  String lastName;
  String fatherName;
  String motherName;
  String dob;
  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.fatherName,
    required this.motherName,
    required this.dob,
  });

factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
    
      firstName: json['firstName'],
      lastName: json['lastName'],
      fatherName: json['fatherName'],
      motherName: json['motherName'],
      dob: json['dob'],
    );
  }
 
}
