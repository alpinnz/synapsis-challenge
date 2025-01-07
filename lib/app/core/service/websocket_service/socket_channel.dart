abstract class SocketChannel {
  Future<void> initialize();

  Future<void> subscribe(String subscribe, Function(String data) onEvent);

  Future<void> close();
}
