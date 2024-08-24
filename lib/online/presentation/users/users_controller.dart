import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/users/users_repository.dart';

part 'users_controller.g.dart';

@riverpod
class UsersController extends _$UsersController {
  @override
  FutureOr<void> build() {}

  // register
  Future<void> registerUser(
    String userName,
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    final usersRepo = ref.read(usersRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => usersRepo.register(
        userName: userName,
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName));
  }
}
