import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;
  final String bio;
  final List followers;
  final List following;
  final String photoUrl;
  final String password;

  const User(
      {required this.bio,
      required this.email,
      required this.followers,
      required this.following,
      required this.photoUrl,
      required this.uid,
      required this.username,
      required this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'email': email,
        'photoUrl': photoUrl,
        'bio': bio,
        'followers': [],
        'following': [],
        'password': password
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        bio: snapshot['bio'],
        email: snapshot['email'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        photoUrl: snapshot['photoUrl'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        password: snapshot['password']);
  }
}
