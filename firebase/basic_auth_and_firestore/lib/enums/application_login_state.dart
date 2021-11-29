enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

extension Methods on ApplicationLoginState {
  String simpleString() {
    switch (this) {
      case ApplicationLoginState.loggedIn:
        return 'logged in';
      case ApplicationLoginState.emailAddress:
        return 'entering email address';
      case ApplicationLoginState.register:
        return 'on registration';
      case ApplicationLoginState.password:
        return 'entering password';
      case ApplicationLoginState.loggedOut:
        return 'logged out';
    }
  }
}
