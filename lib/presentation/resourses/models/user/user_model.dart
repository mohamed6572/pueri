class User_Model {
  String? name;
  String? id; // You can use either int or String, depending on your use case
  String? password;

  String? email;
  // Constructor
  User_Model({
    required this.name,

    required this.id,
    required this.password,
    required this.email,

  });

  // Factory method to create a User object from a JSON map
  factory User_Model.fromJson(Map<String, dynamic> json) {
    return User_Model(
      name: json['name'],
      id: json['id'],
      password: json['password'],
      email: json['email'],

    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,

      'id': id,
      'password': password,
      'email': email,


    };
  }
}

