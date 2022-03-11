import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/user_list/bloc/users_bloc.dart';
import 'package:users_repository/users_repository.dart';

void main() {
  group('UsersState', () {
    UsersState createSubject({
      UsersStatus status = UsersStatus.loading,
      List<User> users = const <User>[],
      SortingBy sortingBy = SortingBy.creationTimeDescending,
    }) {
      return UsersState(
        users: users,
        status: status,
        sortingBy: sortingBy,
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
          status: UsersStatus.loading,
          users: const <User>[],
          sortingBy: SortingBy.creationTimeDescending,
        ).props,
        equals(<Object?>[
          const <User>[],
          UsersStatus.loading,
          SortingBy.creationTimeDescending,
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
            users: null,
            status: null,
            sortingBy: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            users: const <User>[],
            status: UsersStatus.success,
            sortingBy: SortingBy.idAscending,
          ),
          equals(
            createSubject(
              users: const <User>[],
              status: UsersStatus.success,
              sortingBy: SortingBy.idAscending,
            ),
          ),
        );
      });
    });
  });
}
