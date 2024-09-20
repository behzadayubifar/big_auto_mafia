// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// void useAutomaticKeepAlive({required bool wantKeepAlive}) {
//   final context = useContext();
//   useEffect(() {
//     final keepAliveHandle = KeepAliveHandle();
//     if (wantKeepAlive) {
//       KeepAliveNotification(keepAliveHandle).dispatch(context);
//     }
//     return () {
//       keepAliveHandle.dispose();
//     };
//   }, [wantKeepAlive]);
// }
