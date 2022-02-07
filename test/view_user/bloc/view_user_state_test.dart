import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/view_user/bloc/view_user_bloc.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('UserState', () {
    UserState createSubject({
      UserActivationStatus status = UserActivationStatus.loading,
      User user = const User(),
    }) {
      return UserState(
        status: status,
        user: user,
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
          status: UserActivationStatus.loading,
          user: const User(),
        ).props,
        equals(<Object?>[
          UserActivationStatus.loading,
          const User(),
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
            status: null,
            user: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            status: UserActivationStatus.active,
            user: const User(),
          ),
          equals(
            createSubject(
              status: UserActivationStatus.active,
              user: const User(),
            ),
          ),
        );
      });
    });
  });
}
