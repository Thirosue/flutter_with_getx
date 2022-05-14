import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/ui/login/login_controller.dart';
import 'package:get/state_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_response.dart';
import 'login_controller_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() async {
  final mock = MockAuthRepository();
  final response = await DummyResponse.getAuthPostResponse();

  group('LoginController auth() ', () {
    test('認証APIが正常終了するとき、APIが呼び出され、認証が正常終了すること', () async {
      // given
      when(mock.auth(email: 'test@test.com', password: 'password'))
          .thenAnswer((_) => Future.value(response));
      var model = LoginController(mock);

      // when
      model.login();

      // then
      verify(mock.auth(email: 'test@test.com', password: 'password')).called(1);
    });

    test('認証APIが異常終了するとき、例外がthrowされること', () async {
      // given
      when(mock.auth(email: 'test@test.com', password: 'password')).thenThrow(
        Exception('api error occurred'),
      );
      var model = LoginController(mock);

      // when / then
      expect(() => model.login(), throwsException);
      verify(mock.auth(email: 'test@test.com', password: 'password')).called(1);
    });
  });

  final target = LoginController(
    MockAuthRepository(),
  );

  group('LoginController togglePasswordVisible() ', () {
    test('toggleをコールするごとに、showPasswordが切り替わること', () {
      // given
      expect(target.showPassword, RxBool(false));

      // when
      target.togglePasswordVisible();

      // then
      expect(target.showPassword, RxBool(true));

      // when
      target.togglePasswordVisible();

      // then
      expect(target.showPassword, RxBool(false));
    });
  });
}
