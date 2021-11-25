enum BuildType {
  development,
  production,
}

class Enviornment {
  static Enviornment _instance;
  final BuildType _buildType;

  static Enviornment get instance => _instance;
  static BuildType get buildType => instance._buildType;

  /// 환경에 따라 변화하는 필드
  static String get apiURL => instance._buildType == BuildType.development ? 'https://google.com' : 'https://naver.com';

  /// 내부적인 생성자
  const Enviornment._internal(this._buildType);

  /// 생성자 Wrapper
  factory Enviornment.newInstance(BuildType buildType) {
    assert(buildType != null);
    if (_instance == null) {
      _instance = Enviornment._internal(buildType);
    }

    return _instance;
  }
}
