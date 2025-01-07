import 'dart:convert';
import 'dart:developer';

import 'package:centrifuge/centrifuge.dart';
import 'package:synapsis/app/core/constants/url_constants.dart';
import 'package:synapsis/app/core/service/websocket_service/socket_channel.dart';

class SocketChannelImpl implements SocketChannel {
  Client? _client;

  @override
  Future<void> initialize() async {
    _client = createClient(UrlConstants.baseSocketUrl);
    _client?.connectStream.listen((_) {
      log("connect", name: "Websocket");
    });

    _client?.disconnectStream.listen((_) {
      log("disconnect", name: "Websocket");
    });
    await _client?.connect();
  }

  @override
  Future<void> subscribe(String channel, Function(String data) onEvent) async {
    final subscription = _client?.getSubscription(channel);

    subscription?.subscribeSuccessStream.listen((SubscribeSuccessEvent event) {
      log('success', name: "Websocket-$channel");
    });

    subscription?.subscribeErrorStream.listen((SubscribeErrorEvent event) {
      log('failure: ${event.toString()}', name: "Websocket-$channel");
    });

    subscription?.publishStream.listen((PublishEvent event) {
      final data = utf8.decode(event.data);
      log(data, name: "Websocket-$channel");
      onEvent(data);
    });

    subscription?.subscribe();
  }

  @override
  Future<void> close() async {
    log('close - disconnect', name: "Websocket");
    _client?.disconnect();
  }
}
