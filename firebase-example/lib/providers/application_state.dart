import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/enums/attending.dart';
import 'package:gtk_flutter/models/guest_book_message.dart';

import '../enums/application_login_state.dart';
import '../models/participant.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(); // reads constants file

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        print('logined with UID ${FirebaseAuth.instance.currentUser!.uid}');
        _subscribeForGuestBook();
        _subscribeForAttendees();
        _subscribeForParticipants();
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _unSubscribeForGuestBook();
        _unSubscribeForAttendees();
        _unSubscribeForParticipants();
        _guestBookMessages.clear();
        _participants.clear();
      }

      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void registerAccount(String email, String displayName, String password, void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // firestore-related since here
  List<GuestBookMessage> _guestBookMessages = [];
  List<GuestBookMessage> get guestBookMessage => _guestBookMessages;

  /// reference to our real-time listener.
  /// 새로운 데이터가 생길 때마다 접근해서 사용할 것이다.
  StreamSubscription<QuerySnapshot>? _guestBookSubscription;

  Future<DocumentReference> addMessageToGuestBook(String message) {
    if (_loginState != ApplicationLoginState.loggedIn) {
      throw Exception('Must be logged in');
    }

    return FirebaseFirestore.instance.collection('guestbook').add(<String, dynamic>{
      'text': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  List<Participant> _participants = [];
  List<Participant> get participants => _participants;

  StreamSubscription<QuerySnapshot>? _participantsSubscription;

  void register() {
    FirebaseFirestore.instance.collection('participants').add(<String, dynamic>{
      'name': FirebaseAuth.instance.currentUser!.displayName,
      'timestamp': FirebaseAuth.instance.currentUser!.displayName,
    });
  }

  void _subscribeForGuestBook() {
    _guestBookSubscription = FirebaseFirestore.instance //
        .collection('guestbook')
        .orderBy('timestamp', descending: true)
        .limit(3)
        .snapshots()
        .listen((snapshot) {
      _guestBookMessages = [];
      snapshot.docs.forEach((doc) {
        _guestBookMessages.add(GuestBookMessage(
          name: doc.data()['name'] as String,
          message: doc.data()['text'] as String,
        ));
      });
      notifyListeners();
    });
  }

  void _subscribeForParticipants() {
    _participantsSubscription = FirebaseFirestore.instance //
        .collection('participants')
        .snapshots()
        .listen((snapshot) {
      _participants.clear();
      snapshot.docs.forEach((doc) {
        _participants.add(Participant(
          name: doc.data()['name'] as String,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ));
      });
      notifyListeners();
    });
  }

  void _unSubscribeForGuestBook() {
    _guestBookSubscription?.cancel();
  }

  void _unSubscribeForParticipants() {
    _participantsSubscription?.cancel();
  }

  int _attendees = 0;
  int get attendees => _attendees;

  StreamSubscription<QuerySnapshot>? _attendingSubscription;

  Attending _attending = Attending.unknown;
  Attending get attending => _attending;
  set attending(Attending attending) {
    final userDoc = FirebaseFirestore.instance //
        .collection('attendees')
        .doc('${FirebaseAuth.instance.currentUser?.uid}');

    if (attending == Attending.yes) {
      userDoc.set(<String, bool>{'attending': true});
    } else {
      userDoc.set(<String, bool>{'attending': false});
    }
  }

  void _subscribeForAttendees() {
    _attendingSubscription = FirebaseFirestore.instance //
        .collection('attendees')
        .where('attending', isEqualTo: true)
        .snapshots()
        .listen((snapshot) {
      _attendees = snapshot.docs.length;

      notifyListeners();
    });
  }

  void _unSubscribeForAttendees() {
    _attendingSubscription?.cancel();
  }
}
