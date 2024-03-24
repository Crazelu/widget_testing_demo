import 'dart:async';
import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class ConnectivityPlatformStub
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {
  ConnectivityPlatformStub() {
    _connectivityResult = ConnectivityResult.none;
    _streamController.add([_connectivityResult]);
  }

  late ConnectivityResult _connectivityResult;

  final StreamController<List<ConnectivityResult>> _streamController =
      StreamController.broadcast();

  void setConnectivityResult(ConnectivityResult connectivityResult) {
    _streamController.add([connectivityResult]);
  }

  @override
  Future<List<ConnectivityResult>> checkConnectivity() {
    return Future.value([_connectivityResult]);
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged {
    return _streamController.stream;
  }
}
