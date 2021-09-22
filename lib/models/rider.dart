class Rider {
  final String uid;
  final String name;
  final String email;
  final int phone;

  Rider(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone});

  factory Rider.fromMap(Map<dynamic, dynamic> data) {
    final String uid = data['uid'];
    final String name = data['name'];
    final String email = data['email'];
    final int phone = data['phone'];
    return Rider(uid: uid, name: name, email: email, phone: phone);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'phone': this.phone,
    };
  }
}
