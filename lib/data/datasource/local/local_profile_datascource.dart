import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/profile_model.dart';

class ProfileDataSource {
  var profileBox = Hive.box<ProfileModel>(ProfileBox);
  bool checkProfileExists() {
    return profileBox.containsKey('currentUser');
  }

  getName() {
    var profile = profileBox.get('currentUser');
    if (profile != null) {
      return profile.firstName! + ' ' + profile.lastName!;
    }
    return 'Guest User';
  }

  ProfileModel? getProfile() {
    return profileBox.get('currentUser');
  }

  Future<void> saveProfile(ProfileModel profile) async {
    await profileBox.put('currentUser', profile);
  }

  
}
