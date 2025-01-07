import 'dart:developer';

import 'package:centrifuge/centrifuge.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';

abstract class WebsocketRemoteDataSource {
  Future<void> connectWebSocket(Function(dynamic data) onListener);

  Future<void> closeWebSocket();
}

class WebsocketRemoteDataSourceImpl implements WebsocketRemoteDataSource {
  Client? _channel;

  @override
  Future<void> closeWebSocket() async {
    _channel?.disconnect();
  }

  @override
  Future<void> connectWebSocket(Function(dynamic location) onListener) async {
    _channel = createClient(UrlConstants.baseWebSocketUrl);

    await _channel?.connect();

    // Subscribe to a channel
    subscribeToChannel(_channel!, 'ws/fms-dev');
  }

  void subscribeToChannel(Client client, String channel) {
    final subscription = client.getSubscription(channel);

    subscription.subscribeSuccessStream.listen((event) {
      log('Subscribed to channel: $channel');
      // onListener(message);
    });

    subscription.subscribeErrorStream.listen((event) {
      log('Subscription error: ${event.message}');
      // onListener(message);
    });

    subscription.publishStream.listen((event) {
      log('Message received: ${event.data}');
      // onListener(message);
    });

    subscription.subscribe();
  }
}
