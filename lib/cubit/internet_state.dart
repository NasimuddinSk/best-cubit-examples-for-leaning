part of 'internet_cubit.dart';

enum ConnectivityStatus { connected, disConnected }

class InternetState {
  final ConnectivityStatus status;
  InternetState(this.status);
}
