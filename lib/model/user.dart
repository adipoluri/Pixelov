import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String email;
  String firstName;
  String lastName;

  String phoneNumber;

  bool active;

  Timestamp lastOnlineTimestamp;

  String userID;
  String profilePictureURL;

  bool selected;

  String appIdentifier;

  User({
    this.email = '',
    this.active = false,
    this.selected = false,
    lastOnlineTimestamp,
    this.userID = '',
  })  : this.lastOnlineTimestamp = lastOnlineTimestamp ?? Timestamp.now(),
        this.appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  String fullName() {
    return '$firstName $lastName';
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return new User(
      email: parsedJson['email'] ?? '',
      active: parsedJson['active'] ?? false,
      lastOnlineTimestamp: parsedJson['lastOnlineTimestamp'],
      userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'id': this.userID,
      'active': this.active,
      'lastOnlineTimestamp': this.lastOnlineTimestamp,
      'appIdentifier': this.appIdentifier
    };
  }
}
