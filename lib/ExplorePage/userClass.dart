class User {
  final String id;
  final String name;
  final String title;
  final String body;

  User(
      {required this.title,
      required this.body,
      required this.id,
      required this.name});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'body': body,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        title: json['title'],
        body: json['body'],
      );
}
