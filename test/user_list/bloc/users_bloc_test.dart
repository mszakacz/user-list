import 'package:bloc_test/bloc_test.dart';
import 'package:user_list/user_list/bloc/users_bloc.dart';
import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('UsersBloc-Constructor', () {
    late UsersBloc usersBloc;

    setUp(() {
      usersBloc = UsersBloc();
    });

    tearDown(() {
      usersBloc.close();
    });

    test('initial state', () {
      expect(
        usersBloc.state,
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.creationTimeDescending,
        ),
      );
    });
  });

  group('Change sorting method', () {
    late UsersBloc usersBloc;

    setUp(() {
      usersBloc = UsersBloc();
    });

    tearDown(() {
      usersBloc.close();
    });
    blocTest<UsersBloc, UsersState>(
      'CreationTimeAscending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.creationTimeAscending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.creationTimeAscending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'creationTimeDescending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.creationTimeDescending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.creationTimeDescending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'updateTimeAscending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.updateTimeAscending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.updateTimeAscending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'updateTimeDescending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.updateTimeDescending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.updateTimeDescending,
        ),
      ],
    );
    blocTest<UsersBloc, UsersState>(
      'idAscending sorting method',
      build: () => usersBloc,
      act: (bloc) => bloc.add(const ChangeSortingMethod(SortingBy.idAscending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.idAscending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'idDescending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.idDescending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.idDescending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'firstnameAscending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.firstnameAscending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.firstnameAscending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'firstnameDescending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.firstnameDescending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.firstnameDescending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'lastnameAscending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.lastnameAscending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.lastnameAscending,
        ),
      ],
    );

    blocTest<UsersBloc, UsersState>(
      'lastnameDescending sorting method',
      build: () => usersBloc,
      act: (bloc) =>
          bloc.add(const ChangeSortingMethod(SortingBy.lastnameDescending)),
      expect: () => [
        const UsersState(
          users: <User>[],
          status: UsersStatus.loading,
          sortingBy: SortingBy.lastnameDescending,
        ),
      ],
    );
  });

  group('Update Users List', () {
    late UsersBloc usersBloc;

    setUp(() {
      usersBloc = UsersBloc();
    });

    tearDown(() {
      usersBloc.close();
    });
    blocTest<UsersBloc, UsersState>('Loading',
        build: () => usersBloc,
        act: (bloc) => bloc.add(UpdateUsersList()),
        expect: () => [
              const UsersState(
                users: <User>[],
                status: UsersStatus.loading,
                sortingBy: SortingBy.creationTimeDescending,
              ),
            ]);
  });
}
