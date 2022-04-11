Future<void> wait({required int seconds}) async {
  await Future.delayed(Duration(seconds: seconds));
}
