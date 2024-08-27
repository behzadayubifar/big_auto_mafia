import 'package:auto_mafia/offline/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading.g.dart';

defaultLoading() => LoadingAnimationWidget.hexagonDots(
      size: 100,
      color: AppColors.primaries[0],
    );

@Riverpod(keepAlive: true)
class loading extends _$loading {
  @override
  build() {
    return false;
  }

  void toggle() => state = !state;

  void start() => state = true;

  void end() => state = false;
}

class GlobalLoading extends HookConsumerWidget {
  const GlobalLoading({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _entries = useState<List<OverlayEntry?>>([]);
    ref.listen(
      loadingProvider,
      (previous, next) {
        if (previous == next) return;
        if (next) {
          // Add a modal barrier so the user cannot interact with the app while the loading indicator is visible
          _entries.value.add(OverlayEntry(
            builder: (_) =>
                ModalBarrier(color: AppColors.backGround.withOpacity(0.85)),
          ));
          _entries.value.add(OverlayEntry(
              builder: (_) => Center(
                      child: LoadingAnimationWidget.inkDrop(
                    color: AppColors.primaries[1],
                    size: 160,
                  ))));
          Overlay.of(context).insertAll(Iterable.generate(
              _entries.value.length, (index) => _entries.value[index]!));
        } else {
          // Remove the modal barrier and loading indicator
          _entries.value.forEach((entry) => entry?.remove());
          _entries.value.clear();
        }
      },
    );
    return child;
  }
}
