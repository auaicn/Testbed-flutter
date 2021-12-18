import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:s3_service/auth_service.dart';
import 'package:s3_service/camera_flow.dart';
import 'package:s3_service/login_page.dart';
import 'package:s3_service/sign_up_page.dart';
import 'package:s3_service/verification_page.dart';

void main() {
  runApp(MyApp());
}

// 1
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _amplify = Amplify;
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    _authService.showLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery App',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      // 2
      home: StreamBuilder<AuthState>(
        stream: _authService.authStateController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Navigator(
              pages: [
                // 마지막 페이지가 처음에 뜨게 된다. 사실은, 순서대로 위에 쌓아지는 느낌이다.
                if (snapshot.data.authFlowStatus == AuthFlowStatus.login)
                  MaterialPage(
                    child: LoginPage(
                      shouldShowSignUp: _authService.showSignUp,
                      didProvideCredentials: _authService.loginWithCredentials,
                    ),
                  ),
                if (snapshot.data.authFlowStatus == AuthFlowStatus.signUp)
                  MaterialPage(
                    child: SignUpPage(
                      shouldShowLogin: _authService.showLogin,
                      didProvideCredentials: _authService.signUpWithCredentials,
                    ),
                  ),
                if (snapshot.data.authFlowStatus == AuthFlowStatus.verification)
                  MaterialPage(
                    child: VerificationPage(didProvideVerificationCode: _authService.verifyCode),
                  ),
                if (snapshot.data.authFlowStatus == AuthFlowStatus.session)
                  MaterialPage(
                    child: CameraFlow(shouldLogOut: _authService.logOut),
                  )
              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void _configureAmplify() async {
    try {
      // await _amplify.configure(amplifyconfig);
      print('Successfully configured Amplify 🎉');
    } catch (e) {
      print('Could not configure Amplify ☠️');
    }
  }
}
