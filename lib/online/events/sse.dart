import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:auto_mafia/online/data/models/responses/events.dart';
import 'package:auto_mafia/online/presentation/common/dialogs/app_dialog.dart';
import 'package:auto_mafia/online/presentation/rooms/controllers/active_room.dart';
import 'package:auto_mafia/online/service/dio_provider.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dart:async';

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
  ref.onDispose(() {
    dio.close(force: true);
  });
  //
  var allEvents = const <AppEvent>[];
  final joinedEvents = List<JoinedRoom>.empty(growable: true);
  final leftEvents = List<LeftRoom>.empty(growable: true);
  //
  if (sse.data!.contentLength != -1) {
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
      // // Events Classification -- JoinRoomEvent, LeftRoomEvent
      // if (appEvent is JoinRoomEvent) {
      //   if (!joinedEvents.any((e) => e.user.id == appEvent.user.id)) {
      //     joinedEvents.add(appEvent);
      //   }
      // } else if (appEvent is LeftRoomEvent) {
      //   if (!leftEvents.any((e) => e.user.id == appEvent.user.id)) {
      //     leftEvents.add(appEvent);
      //   }
      // }
      // // check if a user has joined a room and left the room
      // if (joinedEvents.isNotEmpty && leftEvents.isNotEmpty) {
      //   final toRemoveJoined = <JoinRoomEvent>[];
      //   final toRemoveLeft = <LeftRoomEvent>[];
      //   joinedEvents.any((joinEvent) {
      //     leftEvents.any((leftEvent) {
      //       if (joinEvent.roomId == leftEvent.roomId) {
      //         if (joinEvent.user.id == leftEvent.user.id) {
      //           log('User ${joinEvent.user.userName} has joined and left the room ${joinEvent.roomId}');
      //           // remove the user from the room
      //           toRemoveJoined.add(joinEvent);
      //           toRemoveLeft.add(leftEvent);
      //           return true;
      //         }
      //       }
      //       return false;
      //     });
      //     return false;
      //   });
      //   joinedEvents.removeWhere((e) => toRemoveJoined.contains(e));
      //   leftEvents.removeWhere((e) => toRemoveLeft.contains(e));
      //   // remove also from allEvents
      //   allEvents.removeWhere(
      //       (e) => toRemoveJoined.contains(e) || toRemoveLeft.contains(e));
      //   // update room in local db
      //   // await ref
      //   //     .read(activeRoomsProvider.notifier)
      //   //     .refreshRoomById(joinedEvents[0].roomId);
      // }
      // allEvents = [...allEvents, ...joinedEvents, ...leftEvents];
      // // update
      // yield allEvents;
    }
  }
}

StreamTransformer<Uint8List, List<int>> unit8Transformer =
    StreamTransformer.fromHandlers(
  handleData: (data, sink) {
    sink.add(List<int>.from(data));
  },
);
