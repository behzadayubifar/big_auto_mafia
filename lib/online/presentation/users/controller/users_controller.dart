import 'dart:developer';

import 'package:auto_mafia/online/data/models/users.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/isar_service.dart';
import '../../../domain/users/users_repository.dart';

part 'users_controller.g.dart';

@riverpod
class UsersController extends _$UsersController {
  @override
  FutureOr<dynamic> build() {}

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
    state = await AsyncValue.guard(
      () async {
        final registerResult = await usersRepo.register(
          userName: userName,
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        );
        if (registerResult is UserResp) {
          log('register success');
          final isar = await ref.read(isarServiceProvider.future);
          await isar.putUser(
            id: registerResult.users[0].id,
            username: userName,
            password: password,
            email: email,
            firstName: firstName,
            lastName: lastName,
            coins: registerResult.users[0].coins,
            createdAt: registerResult.users[0].createdAt,
            updatedAt: registerResult.users[0].updatedAt,
            isAdmin: registerResult.users[0].isAdmin,
          );
          ref.read(routerProvider).goNamed('panel', pathParameters: {
            'name': registerResult.users[0].firstName! +
                ' ' +
                registerResult.users[0].lastName!,
          });
        } else {
          log('register failed');
        }
        return registerResult;
      },
    );
  }

  // login
  Future<void> loginUser({
    required String userName,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final usersRepo = ref.read(usersRepositoryProvider);
      final loginResult = await usersRepo.login(userName, password);
      log('loginResult: $loginResult');
      if (loginResult is UserResp) {
        log('login success');
        final isar = await ref.read(isarServiceProvider.future);
        await isar.putUser(
          id: loginResult.users[0].id,
          username: userName,
          password: password,
          email: loginResult.users[0].email,
          firstName: loginResult.users[0].firstName,
          lastName: loginResult.users[0].lastName,
          coins: loginResult.users[0].coins,
          createdAt: loginResult.users[0].createdAt,
          updatedAt: loginResult.users[0].updatedAt,
          isAdmin: loginResult.users[0].isAdmin,
        );
        log('loggin in: ');
        ref.read(routerProvider).goNamed(
              'panel',
              extra: loginResult.users[0],
            );
      } else {
        log('login failed');
      }
      return loginResult;
    });
  }
}
