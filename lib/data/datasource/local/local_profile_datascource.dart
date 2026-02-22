import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:musa/const/const.dart';
import 'package:musa/data/models/profile_model.dart';

class ProfileDataSource {
  var profileBox = Hive.box<ProfileModel>(ProfileBox);
  bool checkProfileExists() {
    return profileBox.containsKey('currentUser');
  }

   ProfileModel? getProfile() {
    return profileBox.get('currentUser');
  }
  Future<void> saveProfile(ProfileModel profile)async{
   await profileBox.put('currentUser', profile);
  }
  getName()
  {
    return profileBox.get('currentUser')?.firstName;
  }
  Future<String?> pickImage() async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    return image.path;
  }
  return null;
}
}
