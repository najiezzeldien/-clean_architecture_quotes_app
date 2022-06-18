import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NewworkInfo {
  Future<bool> get isConnected;
}

class NewworkInfoImpl implements NewworkInfo {
  final InternetConnectionChecker connectionChecker;
  NewworkInfoImpl({
    required this.connectionChecker,
  });
  @override
  Future<bool> get isConnected async => connectionChecker.hasConnection;
}
