// it's declard aas class but, can be used as mixin when used with `with` keyword

class ImplicitShoutMixin {
  String a = 'a';
  String b = 'b';
  void shoutOut() {
    print("I'm a legal implicit Alien~\n");
  }
}
