class User {
  final String id;
  final String name;
  final String title;
  final String body;
  final String timestamp;

  User(
      {required this.title,
      required this.body,
      required this.id,
      required this.name,
      required this.timestamp});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'body': body,
        'timestamp': timestamp,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: (json['id'] ?? '').toString(),
        name: (json['name'] ?? '').toString(),
        title: (json['title'] ?? '').toString(),
        body: (json['body'] ?? '').toString(),
        timestamp: (json['timestamp'] ?? '').toString(),
      );
}
