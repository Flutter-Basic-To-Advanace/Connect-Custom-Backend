class User {
  final String id;
  final String name;
  final String email;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  //method to convert the json data in dart object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      age: json["age"],
    );
  }

  //method to convert the dart obj in to json obj
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "age": age};
  }
}
