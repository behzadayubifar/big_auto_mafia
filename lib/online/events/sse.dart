import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:auto_mafia/online/presentation/common/dialogs/app_dialog.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
import 'package:auto_mafia/online/service/dio_provider.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dart:async';

import '../../offline/db/isar_service.dart';
import '../../offline/db/shared_prefs/shared_prefs.dart';
import '../data/endpoints.dart';

part 'sse.g.dart';

@riverpod
Stream<List<AppEvent>> appEvents(AppEventsRef ref) async* {
  final dio = Dio(
    BaseOptions(
      baseUrl:
          Endpoints.http + Endpoints.host + Endpoints.port + Endpoints.apiV1,
      responseType: ResponseType.stream,
      headers: {
        "Accept": "text/event-stream",
        "Content-Type": "text/event-stream",
        "Connection": "keep-alive",
        "Cache-Control": "no-cache",
        'Authorization': {await SharedPrefs.getString('token')},
        "Accept-Language": "fa",
      },
    ),
  );
  Response<ResponseBody> sse = await dio.get(
    Endpoints.events,
  );

  //
  var allEvents = const <AppEvent>[];
  final joinedEvents = List<JoinedRoom>.empty(growable: true);
  final leftEvents = List<LeftRoom>.empty(growable: true);
  //
  final streamController = StreamController<List<AppEvent>>();
  //
  final streamSubscription = sse.data!.stream
      .transform(
        unit8Transformer,
      )
      .transform(
        const Utf8Decoder(),
      )
      .transform(
        const LineSplitter(),
      )
      .listen(
    (event) async {
      final appEvent = AppEvent.fromJson(event);
      if (appEvent is JoinedRoom) {
        await ref
            .read(activeRoomsProvider.notifier)
            .refreshRoomById(appEvent.roomId);
      } else if (appEvent is LeftRoom) {
        await ref
            .read(activeRoomsProvider.notifier)
            .refreshRoomById(appEvent.roomId);
      } else if (appEvent is RoomFull) {
        await ref
            .read(activeRoomsProvider.notifier)
            .refreshRoomById(appEvent.roomId);
        // save the users who joined the room in the room collection
        final isar = await ref.read(isarServiceProvider.future);
        await isar.putRoom(
          id: appEvent.roomId,
          usersInfo: appEvent.users,
        );
        final context = NavigationService.navigatorKey.currentContext!;
        showDialog(
          // barrierDismissible: false,
          context: context,
          builder: (context) {
            return ReadyForNextPhaseDialog();
          },
        );
      } else if (appEvent is PlayerAddedToWaitingQueue) {
        allEvents = [];
        allEvents = [...allEvents, appEvent];
        streamController.add(allEvents);
      } else if (appEvent is GameStarted) {
        // save player in the local db
        final isar = await ref.read(isarServiceProvider.future);
        await isar.putUser(
          id: appEvent.playerId,
          playerOnline: appEvent.player,
        );
        ref.read(routerProvider).pushNamed(
              'show-role',
              extra: appEvent.player,
            );
      }
    },
  );
  // yield allEvents;

  print('allEvents: $allEvents');

  ref.onDispose(() {
    // cancel the stream subscription even if events are still coming
    streamSubscription.cancel();
    streamController.close();
  });

  yield* streamController.stream;
}

StreamTransformer<Uint8List, List<int>> unit8Transformer =
    StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    sink.add(List<int>.from(data));
  },
);

/* 
  await for (var event in sse.data!.stream
      .transform(unit8Transformer)
      .transform(const Utf8Decoder())
      .transform(const LineSplitter())) {
    final appEvent = AppEvent.fromJson(event);
    if (appEvent is JoinedRoom) {
      await ref
          .read(activeRoomsProvider.notifier)
          .refreshRoomById(appEvent.roomId);
    } else if (appEvent is LeftRoom) {
      await ref
          .read(activeRoomsProvider.notifier)
          .refreshRoomById(appEvent.roomId);
    } else if (appEvent is RoomFull) {
      await ref
          .read(activeRoomsProvider.notifier)
          .refreshRoomById(appEvent.roomId);
    }
    //
    ref.onDispose(() {
      // cancel the stream subscription even if events are still coming
      streamSubscription.cancel();
    });
  }
 */
