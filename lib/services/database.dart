import 'package:firebase_database/firebase_database.dart';
import 'package:uber_clone/models/rider.dart';
import 'package:uber_clone/services/api_path.dart';

abstract class Database {
  Future<void> save(Rider rider);

  Future<void> remove(Rider rider);

  Future<Rider> get(String uid);
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

  @override
  Future<Rider> get(String riderUid) async {
    final _snapShot = await _reference.child(ApiPath.rider(riderUid)).get();
    final _data = _snapShot.value;
    final Rider rider = Rider.fromMap(_data);
    return rider;
  }
}
