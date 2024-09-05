import 'dart:developer';

import 'package:auto_mafia/online/data/models/responses/errors.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../offline/db/entities/user.dart';
import '../../../../offline/db/isar_service.dart';
import '../../../domain/users/users_repository.dart';

part 'accounts_controller.g.dart';

@riverpod
class AccountsController extends _$AccountsController {
  @override
  Future<Either<ErrorResp, List<User>>> build() async {
    return getAllAccountsLocally();
  }

  // get all accounts locally from isar
  Future<Either<ErrorResp, List<User>>> getAllAccountsLocally() async {
    final isar = await ref.read(isarServiceProvider.future);
    final accounts = await isar.retrieveAllUsers();
    return right(accounts);
  }

  // update current account by fetching it from server
  Future<void> getAccountFromServer(String id) async {
    state = const AsyncLoading();
    final usersRepo = ref.read(usersRepositoryProvider);
    final result = await usersRepo.fetchUser(id);
    result.match((l) {
      log('get account from server failed');
      // set ErrorResp to state
      state = AsyncError(l, StackTrace.fromString(''));
    }, (r) async {
      log('get account from server success');
      final isar = await ref.read(isarServiceProvider.future);
      isar.putUser(
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
    });
    state = AsyncValue.data(await getAllAccountsLocally());
  }
}
