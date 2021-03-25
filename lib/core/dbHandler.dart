import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelov/model/time.dart';
import 'package:pixelov/model/user.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';

class DBHandler {
  static User currentUser;
  static Box box;

  initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(TimeAdapter());
    Hive.registerAdapter(DailyAdapter());
    box = await Hive.openBox('currentUser');
  }

  updateUser(User user) async {
    await box.put('user', user);
    currentUser = user;
  }

  updateCurrentUser() async {
    await box.put('user', currentUser);
    //FireStoreUtils.updateCurrentUser(currentUser);
  }

  User getUser() {
    return box.get('user');
  }

  setCurrentUser() {
    currentUser = box.get('user');
  }
}

class FireStoreUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();
}
