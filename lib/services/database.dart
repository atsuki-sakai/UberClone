import 'package:firebase_database/firebase_database.dart';
import 'package:uber_clone/models/rider.dart';
import 'package:uber_clone/services/api_path.dart';

abstract class Database {
  Future<void> save(Rider rider);

  Future<void> remove(Rider rider);
}

class RidersDatabase implements Database {
  final _reference = FirebaseDatabase.instance.reference();

  @override
  Future<void> save(Rider rider) async {
    await _reference.child(ApiPath.rider(rider.uid)).set(rider.toMap());
  }

  @override
  Future<void> remove(Rider rider) async {
    await _reference.child(ApiPath.rider(rider.uid)).remove();
  }
}
