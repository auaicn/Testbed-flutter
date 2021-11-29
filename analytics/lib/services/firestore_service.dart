import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compound/models/post.dart';
import 'package:compound/models/user.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference = FirebaseFirestore.instance.collection('users');
  final CollectionReference _postsCollectionReference = FirebaseFirestore.instance.collection('posts');

  final StreamController<List<Post>> _postsController = StreamController<List<Post>>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.doc(uid).get();
      return User.fromData(userData.data());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future addPost(Post post) async {
    try {
      await _postsCollectionReference.add(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future getPostsOnceOff() async {
    try {
      var postDocumentSnapshot = await _postsCollectionReference.get();
      if (postDocumentSnapshot.docs.isNotEmpty) {
        return postDocumentSnapshot.docs.map((snapshot) => Post.fromMap(snapshot.data(), snapshot.id)).where((mappedItem) => mappedItem.title != null).toList();
      }
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
    _postsCollectionReference.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.docs.isNotEmpty) {
        var posts = postsSnapshot.docs.map((snapshot) => Post.fromMap(snapshot.data(), snapshot.id)).where((mappedItem) => mappedItem.title != null).toList();

        // Add the posts onto the controller
        _postsController.add(posts);
      }
    });

    return _postsController.stream;
  }

  Future deletePost(String documentId) async {
    await _postsCollectionReference.doc(documentId).delete();
  }

  Future updatePost(Post post) async {
    try {
      await _postsCollectionReference.doc(post.documentId).update(post.toMap());
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }
}
