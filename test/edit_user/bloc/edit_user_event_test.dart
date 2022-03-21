// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/edit_user/edit_user.dart';

void main() {
  group('EditUserEvent', () {
    const firstName = 'firstName1';
    const lastName = 'lastName1';
    const id = 1;

    group('SaveUser', () {
      test('supports value equality', () {
        expect(
          SaveUser(),
          equals(SaveUser()),
        );
      });
    });

    group('NameEditing', () {
      test('supports value equality', () {
        expect(
          NameEditing(firstName),
          equals(
            NameEditing(firstName),
          ),
        );
      });

      test('props are correct', () {
        expect(
          NameEditing(firstName).props,
          equals(<Object?>[firstName]),
        );
      });
    });

    group('LastnameEditing', () {
      test('supports value equality', () {
        expect(
          LastnameEditing(lastName),
          equals(LastnameEditing(lastName)),
        );
      });

      test('props are correct', () {
        expect(
          LastnameEditing(lastName).props,
          equals(<Object?>[
            lastName,
          ]),
        );
      });
    });

    group('SetUserByID', () {
      test('supports value equality', () {
        expect(
          SetUserByID(id),
          equals(SetUserByID(id)),
        );
      });

      test('props are correct', () {
        expect(
          SetUserByID(id).props,
          equals(<Object?>[id]),
        );
      });
    });
  });
}
