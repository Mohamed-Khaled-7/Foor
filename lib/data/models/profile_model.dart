import 'package:hive_flutter/adapters.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 1)
class ProfileModel extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String user;
  @HiveField(4)
  final String? image;
  ProfileModel({
    this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.user,
  });
  Map<String ,dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'user': user,
      'image': image,
    };
  }
  factory ProfileModel.fromJson(Map<String ,dynamic> json){
    return ProfileModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      user: json['user'],
      image: json['image'],
    );
  }
ProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? user,
    String? image,
  }) {
    return ProfileModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      user: user ?? this.user,
      image: image ?? this.image,
    );
  }
}
