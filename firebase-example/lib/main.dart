import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtk_flutter/enums/application_login_state.dart';
import 'package:provider/provider.dart';

import 'application_state.dart';
import 'src/authentication.dart';
import 'src/guest_book.dart';
import 'src/widgets.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, _) => App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Meetup',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          SizedBox(height: 40),
          Header('Authentication Status'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Paragraph('You are now ${appState.loginState.simpleString()}!'),
                SizedBox(height: 8),
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
          SizedBox(height: 40),
          const Header("What we planed to do"),
          const Paragraph('Join us for a day full of Firebase Workshops and Pizza!'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Paragraph('You wanna join?, for now ${appState.participants.length} participants'),
                Row(
                  children: [
                    SizedBox(width: 8),
                    StyledButton(
                        child: Text('Yes!'),
                        onPressed: () {
                          appState.register();
                        }),
                    SizedBox(width: 8),
                    StyledButton(child: Text('Nope'), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  Header('Chats'),
                  GuestBook(
                    addMessage: (String message) => appState.addMessageToGuestBook(message),
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
