import 'package:hive_flutter/adapters.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 1)
class ProfileModel extends HiveObject {
  @HiveField(0)
  final String? firstName;
  @HiveField(1)
  final String? lastName;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? user;
  @HiveField(4)
  ProfileModel({this.firstName, this.lastName, this.email, this.user});
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'user': user,
    };
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['firstName']?.toString(),
      lastName: json['lastName']?.toString(),
      email: json['email']?.toString(),
      user: json['user']?.toString(),
    );
  }
  ProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? user,
  }) {
    return ProfileModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      user: user ?? this.user,
    );
  }
}
