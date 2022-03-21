// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_list/edit_user/edit_user.dart';
import 'package:users_repository/users_repository.dart';

class MockUsersRepository extends Mock implements UsersRepository {}

class FakeUser extends Fake implements User {}

void main() {
  group('EditUserBloc', () {
    final user = User(
      firstname: 'firstName1',
      lastname: 'lastName1',
    );
    const newFirstName = 'firstName2';
    const newLastName = 'lastName2';
    const id = 1;

    late UsersRepository usersRepository;

    setUpAll(() {
      registerFallbackValue(FakeUser());
    });

    setUp(() {
      usersRepository = MockUsersRepository();
    });

    EditUserBloc buildBloc() {
      return EditUserBloc(
        usersRepository: usersRepository,
      );
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(EditUserState(
            user: User(),
            status: EditUserStatus.loading,
          )),
        );
      });
    });

    group('SetUserByID', () {
      blocTest<EditUserBloc, EditUserState>(
        'attempts to get user from repository',
        setUp: () {
          when(() => usersRepository.getUser(any()))
              .thenAnswer((_) async => user);
        },
        build: buildBloc,
        seed: () => EditUserState(
          status: EditUserStatus.edit,
          user: User(),
        ),
        act: (bloc) => bloc.add(SetUserByID(id)),
        expect: () => [
          EditUserState(
            status: EditUserStatus.loading,
            user: User(),
          ),
          EditUserState(
            status: EditUserStatus.edit,
            user: user,
          ),
        ],
        verify: (bloc) {
          verify(
            () => usersRepository.getUser(
              any(
                that: isA<int>(),
              ),
            ),
          ).called(1);
        },
      );

      blocTest<EditUserBloc, EditUserState>(
        'emits new state with error if get user from repository fails',
        build: () {
          when(() => usersRepository.getUser(any()))
              .thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => EditUserState(
          status: EditUserStatus.edit,
          user: User(),
        ),
        act: (bloc) => bloc.add(SetUserByID(id)),
        expect: () => [
          EditUserState(
            status: EditUserStatus.loading,
            user: User(),
          ),
          EditUserState(
            status: EditUserStatus.failureToGet,
            user: User(),
          ),
        ],
      );
    });

    group('NameEditing', () {
      blocTest<EditUserBloc, EditUserState>(
        'emits new state with updated user name',
        build: buildBloc,
        act: (bloc) => bloc.add(
          NameEditing(newFirstName),
        ),
        expect: () => [
          EditUserState(
            status: EditUserStatus.loading,
            user: User(firstname: newFirstName),
          ),
        ],
      );
    });

    group('LastNameEditing', () {
      blocTest<EditUserBloc, EditUserState>(
        'emits new state with updated user lastName',
        build: buildBloc,
        act: (bloc) => bloc.add(
          LastnameEditing(newLastName),
        ),
        expect: () => [
          EditUserState(
            status: EditUserStatus.loading,
            user: User(lastname: newLastName),
          ),
        ],
      );
    });

    group('SaveUser', () {
      blocTest<EditUserBloc, EditUserState>(
        'attempts to save edited user to repository',
        setUp: () {
          when(() => usersRepository.updateUser(any()))
              .thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => EditUserState(
          status: EditUserStatus.edit,
          user: user,
        ),
        act: (bloc) => bloc.add(SaveUser()),
        expect: () => [
          EditUserState(
            status: EditUserStatus.posting,
            user: user,
          ),
          EditUserState(
            status: EditUserStatus.success,
            user: user,
          ),
        ],
        verify: (bloc) {
          verify(
            () => usersRepository.updateUser(
              any(
                that: isA<User>()
                    .having(
                        (u) => u.firstname, 'firstname', equals('firstName1'))
                    .having((u) => u.lastname, 'lastname', equals('lastName1')),
              ),
            ),
          ).called(1);
        },
      );

      blocTest<EditUserBloc, EditUserState>(
        'emits new state with error if save to repository fails',
        build: () {
          when(() => usersRepository.updateUser(any()))
              .thenThrow(Exception('oops'));
          return buildBloc();
        },
        seed: () => EditUserState(
          status: EditUserStatus.edit,
          user: user,
        ),
        act: (bloc) => bloc.add(SaveUser()),
        expect: () => [
          EditUserState(
            status: EditUserStatus.posting,
            user: user,
          ),
          EditUserState(
            status: EditUserStatus.failure,
            user: user,
          ),
        ],
      );
    });
  });
}
