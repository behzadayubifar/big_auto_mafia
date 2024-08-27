import 'package:flutter/material.dart';

import '../../../offline/constants/app_colors.dart';

class PageWithDrawerOnDrag extends StatelessWidget {
  const PageWithDrawerOnDrag({
    required this.child,
    this.drawer,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.width,
    super.key,
  }) : _scaffoldKey = scaffoldKey;

  final Widget child;
  final Widget? drawer;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  final double width;

  @override
  Widget build(BuildContext context) {
    double _dragStartX = 0.0;
    // Adjust this value to change the distance
    final double _dragThreshold = 100.0;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.backGround,
      drawer: drawer,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragStart: (details) {
            _dragStartX = details.globalPosition.dx;
          },
          onHorizontalDragUpdate: (details) {
            // print("dragUpdateX: ${details.globalPosition.dx}");
            final dx = details.globalPosition.dx;
            final diff = _dragStartX - dx;
            // if diff is more than the threshold and the drag is from the right side of the screen
            if (diff > _dragThreshold && _dragStartX > width / 1.2) {
              _scaffoldKey.currentState?.openDrawer();
            }
          },
          child: child,
        ),
      ),
    );
  }
}
