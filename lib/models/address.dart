class Address {
  final String placeFormattedAddress;
  final String placeName;
  final String placeId;
  final double latitude;
  final double longitude;

  Address({
    required this.placeFormattedAddress,
    required this.placeName,
    required this.placeId,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        placeFormattedAddress: json['placeFormattedAddress'],
        placeName: json['placeName'],
        placeId: json['placeId'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  Map<String, dynamic> toMap(){
    return {
      'placeFormattedAddress': this.placeFormattedAddress,
      'placeName': this.placeName,
      'placeId': this.placeId,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }


  Address copyWith({
    String? placeFormattedAddress,
    String? placeName,
    String? placeId,
    double? latitude,
    double? longitude,
  }) {
    return Address(
      placeFormattedAddress:
          placeFormattedAddress ?? this.placeFormattedAddress,
      placeName: placeName ?? this.placeName,
      placeId: placeId ?? this.placeId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
