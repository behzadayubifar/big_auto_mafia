import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'x_page.g.dart';

// @riverpod
// Future<int> xFuture(XFutureRef ref) {
//   return Future.value(list.length);
// }

// @riverpod
// class yaKhoda extends _$yaKhoda {
//   @override
//   FutureOr<int> build() {
//     return 1;
//   }

//   increment() async =>
//       state = await AsyncValue.guard(() => Future.value(state.value! + 1));
// }

// final list = [];

// class XPage extends ConsumerWidget {
//   const XPage({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final x = ref.watch(xFutureProvider);
//     final x = ref.watch(yaKhodaProvider);
//     final q = ref.watch(yaKhodaProvider.future);

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         switch (x) {
//           AsyncData(:final value) => Text(value.toString()),
//           AsyncLoading() => Text('loading'),
//           AsyncError(:final error, :final stackTrace) => Text('error'),
//           _ => Text('error'),
//         },
//         ElevatedButton(
//             onPressed: () async {
//               ref.read(yaKhodaProvider.notifier).increment();
//               print(await q);
//             },
//             child: Text('press me')),
//         // x.when(
//         //   data: (a) {
//         //     print(a);
//         //     return Column(
//         //       children: [
//         //         Center(
//         //           child: GestureDetector(
//         //             onTap: () {
//         //               // ref.refresh(xFutureProvider);
//         //               log('onTap');
//         //               // list.add(1);
//         //               ref.read(yaKhodaProvider.notifier).increment();
//         //               // ref.refresh(xFu-tureProvider);
//         //             },
//         //             child: Container(
//         //               child: Text(a.toString()),
//         //             ),
//         //           ),
//         //         ),
//         //       ],
//         //     );
//         //   },
//         //   error: (_, __) {
//         //     return Container(
//         //       child: Text('error'),
//         //     );
//         //   },
//         //   loading: () {
//         //     return Container(
//         //       child: Text('loading'),
//         //     );
//         //   },
//         // ),
//       ],
//     );
//   }
// }

// --------------------------------------------------------------------------------------------------------

@riverpod
Future<List<String?>> test(TestRef ref) {
  return Future.value(testList);
}

ProviderContainer container = ProviderContainer();

final testList = <String>[];

addToList() {
  testList.add('1');
}

@riverpod
Stream<int> streamExample(StreamExampleRef ref) async* {
  // Every 1 second, yield a number from 0 to 41.
  // This could be replaced with a Stream from Firestore or GraphQL or anything else.
  for (var i = 0; i < 42; i++) {
    yield i;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

class ShowTest1 extends ConsumerWidget {
  const ShowTest1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> value = ref.watch(streamExampleProvider);

    // We can use the AsyncValue to handle loading/error states and show the data.
    return Center(
      child: switch (value) {
        AsyncValue(:final error?) => Text('Error: $error'),
        AsyncValue(:final valueOrNull?) => Text('$valueOrNull'),
        _ => const CircularProgressIndicator(),
      },
    );
    // final x = ref.watch(testProvider);

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     switch (x) {
    //       AsyncData(:final value) => Text(value.toString()),
    //       AsyncLoading() => Text('loading'),
    //       AsyncError(:final error, :final stackTrace) => Text('error'),
    //       _ => Text('error'),
    //     },
    //     ElevatedButton(
    //         onPressed: () async {
    //           addToList();
    //           // ref.refresh(testProvider);
    //         },
    //         child: Text('press me')),
    //   ],
    // );
  }
}
