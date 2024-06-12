// comment_model.dart

class Comment {
  int id;
  String body;
  int postId;
  int likes;
  User user;

  Comment({required this.id, required this.body, required this.postId, required this.likes, required this.user});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      likes: json['likes'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  int id;
  String username;
  String fullName;

  User({required this.id, required this.username, required this.fullName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
    );
  }
}
