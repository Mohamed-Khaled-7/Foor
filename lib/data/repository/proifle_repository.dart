// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/datasource/local/local_profile_datascource.dart';
import 'package:musa/data/models/profile_model.dart';

class ProfileRepository {
  ProfileDataSource profileDataSource;
  ProfileRepository({required this.profileDataSource});
  var profileBox = Hive.box<ProfileModel>(ProfileBox);
  ProfileModel? getProfile() {
    return profileDataSource.getProfile();
  }


  void saveProfile(ProfileModel profile) {
    profileDataSource.saveProfile(profile);
  }

  bool hasProfile() {
    return profileDataSource.checkProfileExists();
  }
  getName()
  {
    return profileDataSource.getName();
  }
  pickImage(){
    return profileDataSource.pickImage();
  }

}
