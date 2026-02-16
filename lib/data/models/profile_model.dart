import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 1)
class ProfileModel extends HiveObject {
  @HiveField(0)
  final String fisrtName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String user;
  ProfileModel({
    required this.fisrtName,
    required this.lastName,
    required this.email,
    required this.user,
  });
}
