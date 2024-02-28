class Hospital_Model {
  dynamic? rate;
  String? id; // You can use either int or String, depending on your use case
  String? avilable;

  bool? supported;
  String? location;
  String? hospital_name;
  bool? topRated;

  // Constructor
  Hospital_Model({
    required this.hospital_name,
    required this.location,
    required this.id,
    required this.supported,
    required this.topRated,
    required this.avilable,
    required this.rate,
  });

  // Factory method to create a User object from a JSON map
  factory Hospital_Model.fromJson(Map<String, dynamic> json) {
    return Hospital_Model(
      avilable: json['avilable'],
      hospital_name: json['hospital_name'],
      id: json['id'],
      location: json['location'],
      rate: json['rate'],
      topRated: json['topRated'],
      supported: json['supported'],
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'supported': supported,
      'rate': rate,
      'location': location,
      'hospital_name': hospital_name,
      'id': id,
      'topRated': topRated,
      'avilable': avilable,
    };
  }
}
