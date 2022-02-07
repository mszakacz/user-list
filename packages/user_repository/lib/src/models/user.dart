class User {
  // {"id":44,"last_name":"Swift","first_name":"Jasen","status":"active","created_at":"2022-01-04T16:00:48.304Z","updated_at":"2022-01-05T14:26:10.961Z"}
  final int id;
  final String lastname;
  final String firstname;
  final String status;
  final String updatedAt;
  final String url;
  final String createdAt;

  const User({
    this.id = 0,
    this.lastname = '',
    this.firstname = '',
    this.status = 'active',
    this.createdAt = '',
    this.updatedAt = '',
    this.url = '',
  });

  User copyWith({
    int? id,
    String? lastname,
    String? firstname,
    String? status,
    String? updatedAt,
    String? url,
    String? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      lastname: lastname ?? this.lastname,
      firstname: firstname ?? this.firstname,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }

  factory User.fromJson(Map<String, dynamic> data) {
    int id = data['id'];
    String lastname = data['last_name'];
    String firstname = data['first_name'];
    String status = data['status'];
    String createdAt = data['created_at'];
    String updatedAt = data['updated_at'];

    final User user = User(
      id: id,
      lastname: lastname,
      firstname: firstname,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      url:
          'https://assessment-users-backend.herokuapp.com/users/${id.toString()}.json',
    );
    return user;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_name": lastname,
        "first_name": firstname,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
