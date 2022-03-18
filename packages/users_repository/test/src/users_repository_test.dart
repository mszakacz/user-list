// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:users_api/users_api.dart';
import 'package:users_repository/users_repository.dart';

class MockUsersApiClient extends Mock implements UsersApiClient {}

class FakeUser extends Fake implements User {}

void main() {
  group('UsersRepository', () {
    late UsersApiClient api;

    const id = 1;

    final user1 = User(
      id: 1,
      lastname: 'lastname1',
      firstname: 'firstname1',
      status: 'active',
      createdAt: '2022-01-04T16:00:48.304Z',
      updatedAt: '22022-01-05T14:26:10.961Z',
      url: 'https://assessment-users-backend.herokuapp.com/users/1.json',
    );

    final user2 = User(
      id: 2,
      lastname: 'lastname2',
      firstname: 'firstname2',
      status: 'active',
      createdAt: '2022-02-01T16:00:48.304Z',
      updatedAt: '22022-02-02T14:26:10.961Z',
      url: 'https://assessment-users-backend.herokuapp.com/users/2.json',
    );
    final user3 = User(
      id: 3,
      lastname: 'lastname3',
      firstname: 'firstname3',
      status: 'active',
      createdAt: '2022-03-04T16:00:48.304Z',
      updatedAt: '22022-03-05T14:26:10.961Z',
      url: 'https://assessment-users-backend.herokuapp.com/users/3.json',
    );
    final user4 = User(
      id: 4,
      lastname: 'differentLastname4',
      firstname: 'differentFirstname4',
      status: 'active',
      createdAt: '2022-02-03T16:00:48.304Z',
      updatedAt: '22022-02-06T14:26:10.961Z',
      url: 'https://assessment-users-backend.herokuapp.com/users/4.json',
    );
    final users = [user1, user2, user3, user4];

    setUpAll(() {
      registerFallbackValue(FakeUser());
    });

    setUp(() {
      api = MockUsersApiClient();
      when(() => api.getUser(any())).thenAnswer((_) async => user1);
      when(() => api.deleteUser(any())).thenAnswer((_) async {});
      when(
        () => api.postUser(
          any(),
          any(),
        ),
      ).thenAnswer((_) async {});
      when(() => api.updateUser(any())).thenAnswer((_) async {});
      when(
        () => api.getUsersList(),
      ).thenAnswer((_) async => users);
    });

    UsersRepository createSubject() => UsersRepository(usersApiClient: api);

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getUser', () {
      test('makes correct api request', () async {
        final subject = createSubject();

        expect(
          await subject.getUser(id),
          isNot(throwsA(anything)),
        );

        verify(() => api.getUser(id)).called(1);
      });

      test('returns user', () async {
        expect(
          await createSubject().getUser(id),
          user1,
        );
      });
    });

    group('deleteTodo', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(subject.deleteUser(users[0].id), completes);

        verify(() => api.deleteUser(users[0].id)).called(1);
      });
    });

    group('postUser', () {
      test('makes correct api request', () {
        const lastname = 'lastname5';
        const firstname = 'firstname5';

        final subject = createSubject();

        expect(
            subject.postUser(
              firstname,
              lastname,
            ),
            completes);

        verify(() => api.postUser(
              firstname,
              lastname,
            )).called(1);
      });
    });

    group('updateUser', () {
      test('makes correct api request', () {
        final updatedUser = User(
          id: 1,
          lastname: 'updated',
          firstname: 'updated',
          status: 'active',
          createdAt: '2022-01-05T16:00:48.304Z',
          updatedAt: '22022-01-06T14:26:10.961Z',
          url: 'https://assessment-users-backend.herokuapp.com/users/1.json',
        );

        final subject = createSubject();

        expect(subject.updateUser(updatedUser), completes);

        verify(() => api.updateUser(updatedUser)).called(1);
      });
    });

    group('getUsersList', () {
      test('makes correct api request', () async {
        final subject = createSubject();

        expect(
          await subject.getUsersList(),
          isNot(throwsA(anything)),
        );

        verify(() => api.getUsersList()).called(1);
      });

      test('returns users list', () async {
        expect(
          await createSubject().getUsersList(),
          users,
        );
      });
    });

    group('sortList', () {
      test('returns creationTimeDescending list', () async {
        final actual = await createSubject().sortList(
          users,
          SortingBy.creationTimeDescending,
        );
        expect(
          actual,
          [user3, user4, user2, user1],
        );
      });
      test('returns creationTimeAscending list', () async {
        final actual = await createSubject().sortList(
          users,
          SortingBy.creationTimeAscending,
        );
        expect(
          actual,
          [user1, user2, user4, user3],
        );
      });
      test('returns idDescending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.idDescending,
          ),
          [user4, user3, user2, user1],
        );
      });
      test('returns idAscending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.idAscending,
          ),
          [user1, user2, user3, user4],
        );
      });
      test('returns updateTimeDescending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.updateTimeDescending,
          ),
          [user3, user4, user2, user1],
        );
      });
      test('returns updateTimeAscending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.updateTimeAscending,
          ),
          [user1, user2, user4, user3],
        );
      });
      test('returns firstnameDescending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.firstnameDescending,
          ),
          [user3, user2, user1, user4],
        );
      });
      test('returns firstnameAscending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.firstnameAscending,
          ),
          [user4, user1, user2, user3],
        );
      });
      test('returns lastnameDescending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.lastnameDescending,
          ),
          [user3, user2, user1, user4],
        );
      });
      test('returns lastnameAscending list', () async {
        expect(
          await createSubject().sortList(
            users,
            SortingBy.lastnameAscending,
          ),
          [user4, user1, user2, user3],
        );
      });
    });
  });
}
