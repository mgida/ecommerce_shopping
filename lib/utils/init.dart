class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {

    await Future.delayed(Duration(seconds: 2));
  }
}
