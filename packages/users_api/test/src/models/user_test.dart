import 'package:flutter_test/flutter_test.dart';
import 'package:users_api/users_api.dart';

void main() {
  group('User', () {
    User createSubject({
      int id = 1,
      String lastname = 'lastname',
      String firstname = 'firstname',
      String status = 'active',
      String createdAt = '2022-01-04T16:00:48.304Z',
      String updatedAt = '2022-01-05T14:26:10.961Z',
      String url =
          'https://assessment-users-backend.herokuapp.com/users/1.json',
    }) {
      return User(
        id: id,
        lastname: lastname,
        firstname: firstname,
        status: status,
        createdAt: createdAt,
        updatedAt: updatedAt,
        url: url,
      );
    }

    int id2 = 2;
    String lastname2 = 'lastname2';
    String firstname2 = 'firstname2';
    String status2 = 'locked';
    String createdAt2 = '2022-01-05T16:00:48.304Z';
    String updatedAt2 = '2022-01-06T14:26:10.961Z';
    String url2 = 'https://assessment-users-backend.herokuapp.com/users/2.json';

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          1, // id
          'lastname', // lastname
          'firstname', // firstname
          'active', // status
          '2022-01-05T14:26:10.961Z', // updatedAt
          'https://assessment-users-backend.herokuapp.com/users/1.json', // url
          '2022-01-04T16:00:48.304Z', // createdAt
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
            id: null,
            lastname: null,
            firstname: null,
            status: null,
            createdAt: null,
            updatedAt: null,
            url: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            id: id2,
            lastname: lastname2,
            firstname: firstname2,
            status: status2,
            createdAt: createdAt2,
            updatedAt: updatedAt2,
            url: url2,
          ),
          equals(
            createSubject(
              id: id2,
              lastname: lastname2,
              firstname: firstname2,
              status: status2,
              createdAt: createdAt2,
              updatedAt: updatedAt2,
              url: url2,
            ),
          ),
        );
      });
    });

    group('fromJson', () {
      test('works correctly', () {
        expect(
          User.fromJson(const <String, dynamic>{
            'id': 1,
            'last_name': 'lastname',
            'first_name': 'firstname',
            'status': 'active',
            'created_at': '2022-01-04T16:00:48.304Z',
            'updated_at': '2022-01-05T14:26:10.961Z',
          }),
          equals(createSubject()),
        );
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(
          createSubject().toJson(),
          equals(<String, dynamic>{
            'id': 1,
            'last_name': 'lastname',
            'first_name': 'firstname',
            'status': 'active',
            'created_at': '2022-01-04T16:00:48.304Z',
            'updated_at': '2022-01-05T14:26:10.961Z',
          }),
        );
      });
    });
  });
}
