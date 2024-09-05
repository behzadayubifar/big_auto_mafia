import 'dart:developer';

import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dart:async';

import 'package:universal_html/html.dart' as html;

import '../../offline/db/shared_prefs/shared_prefs.dart';
import '../data/endpoints.dart';

part 'sse.g.dart';

class Sse {
  final html.EventSourceOutsideBrowser eventSource;
  final StreamController<String> streamController;

  Sse._internal(this.eventSource, this.streamController);

  factory Sse.connect({
    required Uri uri,
    required String token,
    bool withCredentials = false,
    bool closeOnError = true,
  }) {
    //
    log('Sse.connect');
    //
    final streamController = StreamController<String>();
    final eventSource =
        html.EventSource(uri.toString(), withCredentials: withCredentials);

    if (eventSource is html.EventSourceOutsideBrowser) {
      eventSource.onHttpClientRequest = (eventSource, request) {
        request.headers.set("Authorization", token);
      };

      eventSource.addEventListener('message', (html.Event message) {
        streamController.add((message as html.MessageEvent).data as String);
      });

      ///close if the endpoint is not working
      if (closeOnError) {
        eventSource.onError.listen((event) {
          eventSource.close();
          streamController.close();
        });
      }
      return Sse._internal(eventSource, streamController);
    } else {
      throw Exception('EventSource is not supported');
    }
  }

  Stream get stream => streamController.stream;

  bool isClosed() => this.streamController.isClosed;

  void close() {
    this.eventSource.close();
    this.streamController.close();
  }
}

@riverpod
Stream<List<AppEvent>> appEvents(AppEventsRef ref) async* {
  final sse = Sse.connect(
    uri: Uri.parse(Endpoints.events),
    token: SharedPrefs.getString('token')!,
    withCredentials: true,
  );
  ref.onDispose(sse.close);
  var allEvents = const <AppEvent>[];
  await for (final event in sse.stream) {
    final appEvent = AppEvent.fromJson(event);
    allEvents = [...allEvents, appEvent];
    log('appEvents: $allEvents', name: 'appEvents');
    yield allEvents;
  }
}
