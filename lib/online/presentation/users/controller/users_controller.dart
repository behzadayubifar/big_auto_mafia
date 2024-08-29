import 'dart:developer';

import 'package:auto_mafia/online/data/models/responses/users.dart';
import 'package:auto_mafia/routes/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/isar_service.dart';
import '../../../domain/users/users_repository.dart';

part 'users_controller.g.dart';

@Riverpod(keepAlive: true)
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
        print('coins : ${loginResult.users[0].coins}');
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

  // fetch current user by id
  Future<void> fetchUser(String userID) async {
    final usersRepo = ref.read(usersRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        final userResult = await usersRepo.fetchUser(userID);
        userResult.match(
          (l) {
            log('fetch user failed');
          },
          (r) async {
            log('fetch user success');
            final isar = await ref.read(isarServiceProvider.future);
            await isar.putUser(
              id: r.users[0].id,
              username: r.users[0].username,
              password: r.users[0].password,
              email: r.users[0].email,
              firstName: r.users[0].firstName,
              lastName: r.users[0].lastName,
              coins: r.users[0].coins,
              createdAt: r.users[0].createdAt,
              updatedAt: r.users[0].updatedAt,
              isAdmin: r.users[0].isAdmin,
            );
          },
        );
        /*  if (userResult is UserResp) {
          log('fetch user success');
          final isar = await ref.read(isarServiceProvider.future);
          await isar.putUser(
            id: userResult.users[0].id,
            username: userResult.users[0].username,
            password: userResult.users[0].password,
            email: userResult.users[0].email,
            firstName: userResult.users[0].firstName,
            lastName: userResult.users[0].lastName,
            coins: userResult.users[0].coins,
            createdAt: userResult.users[0].createdAt,
            updatedAt: userResult.users[0].updatedAt,
            isAdmin: userResult.users[0].isAdmin,
          );
        } else {
          log('fetch user failed');
        } */
        return userResult;
      },
    );
  }
}
