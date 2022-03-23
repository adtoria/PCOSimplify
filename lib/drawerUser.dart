class Users {
  final String id;
  final String name;

  Users(
      {required this.id,
        required this.name});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

  static Users fromJson(Map<String, dynamic> json) => Users(
    id: json['id'],
    name: json['name'],
  );
}
