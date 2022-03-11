import 'package:bloc_test/bloc_test.dart';
import 'package:user_list/view_user/bloc/view_user_bloc.dart';
import 'package:test/test.dart';
import 'package:users_repository/users_repository.dart';

void main() {
  group('Constructor', () {
    late ViewUserBloc viewUserBloc;

    setUp(() {
      viewUserBloc = ViewUserBloc();
    });

    tearDown(() {
      viewUserBloc.close();
    });

    test('initial state', () {
      expect(
        viewUserBloc.state,
        const UserState(
          status: UserActivationStatus.loading,
          user: User(),
        ),
      );
    });
  });

  group('Actication', () {
    late ViewUserBloc viewUserBloc;

    setUp(() {
      viewUserBloc = ViewUserBloc();
    });

    tearDown(() {
      viewUserBloc.close();
    });
    blocTest<ViewUserBloc, UserState>(
      'Loading first',
      build: () => viewUserBloc,
      act: (bloc) => bloc.add(ActivateUser()),
      expect: () => [
        const UserState(
          status: UserActivationStatus.loading,
          user: User(),
        ),
      ],
    );
  });
}
