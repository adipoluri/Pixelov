import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pixelov/model/time.dart';
import 'package:pixelov/model/user.dart';
import 'package:pixelov/widgets/mainMenuScreen/dailyRewardsPopup/dailyReward.dart';

class DBHandler {
  User currentUser;

  initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(TimeAdapter());
    Hive.registerAdapter(DailyAdapter());
  }

  updateUser(User user) async {
    final box = await Hive.openBox<User>('currentUser');
    await box.add(user);
    currentUser = user;
  }

  updateCurrentUser() async {
    this.currentUser.save();
    //FireStoreUtils.updateCurrentUser(currentUser);
  }

  Future<User> getUser() async {
    final box = await Hive.openBox<User>('currentUser');
    return box.getAt(0);
  }

  setCurrentUser() async {
    final box = await Hive.openBox<User>('currentUser');
    currentUser = box.getAt(0);
  }

  clearDb() async {
    final box = await Hive.openBox<User>('currentUser');
    box.deleteAt(0);
  }
}

class FireStoreUtils {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference storage = FirebaseStorage.instance.ref();
}
