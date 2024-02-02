// switch (asyncPlayers) {
//         AsyncData(:final value) => SafeArea(
//             // maintainBottomViewPadding: true,
//             minimum: EdgeInsets.only(top: height / 15),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   TiTleTile(title: info['title']!),
//                   SizedBox(height: height / 24),
//                   Expanded(
//                     child: SizedBox(
//                       width: width / 1.5,
//                       // height: height / 1.5,
//                       child: ListView.separated(
//                         cacheExtent: height / 1.64,
//                         restorationId: 'night-page',
//                         // addAutomaticKeepAlives: true,
//                         // key: _pageStorageKey,
//                         clipBehavior: Clip.antiAlias,
//                         // shrinkWrap: true,
//                         // physics: RangeMaintainingScrollPhysics(),
//                         itemCount: value.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               GestureDetector(
//                                 onDoubleTap: () async {
//                                   log('on double tap');
//                                 },
//                                 child: PlayerNameWidget(
//                                   playerName: value[index].playerName,
//                                   height: height,
//                                   // situation: MyStrings.nightPage,
//                                   // situation: MyStrings.showMyRole,
//                                   situation: info['situation']!,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height / 64,
//                               ),
//                             ],
//                           );
//                         },
//                         separatorBuilder: (BuildContext context, int index) {
//                           return SizedBox(height: height / 48);
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height / 8),
//                 ],
//               ),
//             ),
//           ),
//         _ => defaultLoading,
//       },