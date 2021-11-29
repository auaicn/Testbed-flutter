import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/enums/application_login_state.dart';
import 'package:gtk_flutter/enums/attending.dart';
import 'package:provider/provider.dart';

import 'providers/application_state.dart';
import 'src/authentication.dart';
import 'src/guest_book.dart';
import 'src/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Meetup'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/codelab.png'),
          const SizedBox(height: 8),
          const IconAndDetail(Icons.calendar_today, 'October 30'),
          const IconAndDetail(Icons.location_city, 'San Francisco'),
          const Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
          const SizedBox(height: 40),
          const Header('Authentication Status'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Paragraph('You are now ${appState.loginState.simpleString()}!'),
                const SizedBox(height: 8),
                Authentication(
                  email: appState.email,
                  loginState: appState.loginState,
                  startLoginFlow: appState.startLoginFlow,
                  verifyEmail: appState.verifyEmail,
                  signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                  cancelRegistration: appState.cancelRegistration,
                  registerAccount: appState.registerAccount,
                  signOut: appState.signOut,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Header("What we planed to do"),
          const Paragraph('Join us for a day full of Firebase Workshops and Pizza!'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Paragraph('You wanna join?, for now ${appState.attendees} participants'),
                Row(
                  children: [
                    const SizedBox(width: 8),
                    StyledButton(
                        child: const Text('Yes!'),
                        onPressed: () {
                          appState.attending = Attending.yes;
                        }),
                    const SizedBox(width: 8),
                    StyledButton(
                        child: const Text('Nope'),
                        onPressed: () {
                          appState.attending = Attending.no;
                        }),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  const Header('Chats'),
                  GuestBook(
                    addMessage: (message) => appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessage,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
