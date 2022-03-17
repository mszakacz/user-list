// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:users_api/users_api.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('UsersApiClient', () {
    const int id = 15;
    const String lastname = 'Perkins';
    const String firstname = 'Kendrick';
    const String status = 'active';
    const String updatedAt = '22022-01-05T14:26:10.961Z';
    const String url =
        'https://assessment-users-backend.herokuapp.com/users/15.json';
    const String createdAt = '2022-01-04T16:00:48.304Z';

    const mockUser = User(
      id: id,
      lastname: lastname,
      firstname: firstname,
      status: status,
      updatedAt: updatedAt,
      url: url,
      createdAt: createdAt,
    );

    late http.Client httpClient;
    late UsersApiClient usersApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      usersApiClient = UsersApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require a httpClient', () {
        expect(UsersApiClient(), isNotNull);
      });
    });

    group('getUser', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(
          () => httpClient.get(
            any(),
          ),
        ).thenAnswer((_) async => response);
        try {
          await usersApiClient.getUser(id);
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.https(
              'assessment-users-backend.herokuapp.com',
              '/users/${id.toString()}.json',
            ),
          ),
        ).called(1);
      });

      test('throws GetUserRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(
          () => httpClient.get(
            any(),
          ),
        ).thenAnswer((_) async => response);
        expect(
          () async => await usersApiClient.getUser(id),
          throwsA(
            isA<GetUserRequestFailure>(),
          ),
        );
      });

      test(
        'throws UserDeserializationFailure',
        () async {
          final response = MockResponse();
          when(() => response.statusCode).thenReturn(200);
          when(() => response.body).thenReturn('''
            {
              "id": "id",
              "last_name": "lastname",
              "first_name": "firstname",
              "status": "status",
              "created_at": "createdAt",
              "updated_at": "updatedAt",
            }
        '''); // comma after 'updated_at' is a reason of deserialization failure

          when(
            () => httpClient.get(
              any(),
            ),
          ).thenAnswer((_) async => response);
          expect(
            () async => await usersApiClient.getUser(id),
            throwsA(
              isA<UserDeserializationFailure>(),
            ),
          );
        },
      );

      test('returns user on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('''
            {
              "id":$id,
              "last_name":"$lastname",
              "first_name":"$firstname",
              "status":"$status",
              "created_at":"$createdAt",
              "updated_at":"$updatedAt"
            }
        ''');
        when(
          () => httpClient.get(
            any(),
          ),
        ).thenAnswer((_) async => response);

        final actual = await usersApiClient.getUser(id);

        expect(
          actual,
          User(
            id: id,
            lastname: lastname,
            firstname: firstname,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            url: url,
          ),
        );
      });
    });

    group('deleteUser', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(204);
        when(() => response.body).thenReturn('{}');
        when(
          () => httpClient.delete(
            any(),
          ),
        ).thenAnswer((_) async => response);
        try {
          await usersApiClient.deleteUser(id);
        } catch (_) {}
        verify(
          () => httpClient.delete(
            Uri.https(
              'assessment-users-backend.herokuapp.com',
              '/users/${id.toString()}.json',
            ),
          ),
        ).called(1);
      });

      test('throws DeleteUserRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(422);
        when(
          () => httpClient.delete(
            any(),
          ),
        ).thenAnswer((_) async => response);
        expect(
          () async => await usersApiClient.deleteUser(id),
          throwsA(
            isA<DeleteUserRequestFailure>(),
          ),
        );
      });
    });

    group('postUser', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(
          () => httpClient.post(
            any(),
          ),
        ).thenAnswer((_) async => response);
        try {
          await usersApiClient.postUser(
            firstname,
            lastname,
          );
        } catch (_) {}
        verifyNever(
          () => httpClient.post(
            Uri.https(
              'assessment-users-backend.herokuapp.com',
              '/users/${id.toString()}.json',
            ),
          ),
        ).called(0);
      });

      test('throws PostUserRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(
          () => httpClient.post(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          ),
        ).thenAnswer((_) async => response);

        await expectLater(
          () => usersApiClient.postUser(
            firstname,
            lastname,
          ),
          throwsA(
            isA<PostUserRequestFailure>(),
          ),
        );
      });
    });

    group('updateUser', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(
          () => httpClient.patch(
            any(),
          ),
        ).thenAnswer((_) async => response);
        try {
          await usersApiClient.updateUser(mockUser);
        } catch (_) {}
        verifyNever(
          () => httpClient.patch(
            Uri.https(
              'assessment-users-backend.herokuapp.com',
              '/users/${id.toString()}.json',
            ),
          ),
        ).called(0);
      });

      test('throws UpdateUserRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(
          () => httpClient.patch(
            any(),
            headers: any(named: 'headers'),
            body: any(named: 'body'),
          ),
        ).thenAnswer((_) async => response);
        expect(
          () async => await usersApiClient.updateUser(mockUser),
          throwsA(
            isA<UpdateUserRequestFailure>(),
          ),
        );
      });
    });

    group('getUsersList', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(
          () => httpClient.get(
            any(),
          ),
        ).thenAnswer((_) async => response);
        try {
          await usersApiClient.getUsersList();
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.https(
              'assessment-users-backend.herokuapp.com',
              '/users.json',
            ),
          ),
        ).called(1);
      });

      test('throws GetUsersListRequestFailure on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(
          () => httpClient.get(
            any(),
          ),
        ).thenAnswer((_) async => response);
        expect(
          () async => await usersApiClient.getUsersList(),
          throwsA(
            isA<GetUsersListRequestFailure>(),
          ),
        );
      });

      test(
        'throws UsersListDeserializationFailure',
        () async {
          final response = MockResponse();
          when(() => response.statusCode).thenReturn(200);
          when(() => response.body).thenReturn('''
          [
            {
              "id": "id",
              "last_name": "lastname",
              "first_name": "firstname",
              "status": "status",
              "created_at": "createdAt",
              "updated_at": "updatedAt",
            },
          ]
        '''); // comma after 'updated_at' is a reason of deserialization failure
          when(
            () => httpClient.get(
              any(),
            ),
          ).thenAnswer((_) async => response);
          expect(
            () async => await usersApiClient.getUsersList(),
            throwsA(
              isA<UsersListDeserializationFailure>(),
            ),
          );
        },
      );

      test('returns users list on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('''
          [
            {
              "id":$id,
              "last_name":"$lastname",
              "first_name":"$firstname",
              "status":"$status",
              "created_at":"$createdAt",
              "updated_at":"$updatedAt"
            }
          ]
        ''');
        when(
          () => httpClient.get(
            any(),
          ),
        ).thenAnswer((_) async => response);

        final actual = await usersApiClient.getUsersList();

        expect(
          actual,
          [
            User(
              id: id,
              lastname: lastname,
              firstname: firstname,
              status: status,
              createdAt: createdAt,
              updatedAt: updatedAt,
              url: url,
            ),
          ],
        );
      });
    });
  });
}
