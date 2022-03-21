// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/edit_user/edit_user.dart';
import 'package:users_repository/users_repository.dart';

void main() {
  final mockUser = User(
    id: 1,
    lastname: 'lastname1',
    firstname: 'firstname1',
    status: 'active',
    createdAt: '2022-01-04T16:00:48.304Z',
    updatedAt: '22022-01-05T14:26:10.961Z',
    url: 'https://assessment-users-backend.herokuapp.com/users/1.json',
  );

  group('EditUserState', () {
    EditUserState createSubject({
      User? user,
      EditUserStatus status = EditUserStatus.loading,
    }) {
      return EditUserState(
        status: status,
        user: user ?? mockUser,
      );
    }

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject(
          user: mockUser,
          status: EditUserStatus.edit,
        ).props,
        equals(<Object?>[
          mockUser, // user
          EditUserStatus.edit, // status
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            user: null,
            status: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            user: mockUser,
            status: EditUserStatus.success,
          ),
          equals(
            createSubject(
              user: mockUser,
              status: EditUserStatus.success,
            ),
          ),
        );
      });
    });
  });
}
