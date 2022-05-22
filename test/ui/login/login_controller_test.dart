import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/ui/login/login_controller.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_response.dart';
import 'login_controller_test.mocks.dart';

var token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
var state = LocalState(
  name: 'john doe',
  idToken: token,
  refreshToken: token,
  accessToken: token,
);

@GenerateMocks([
  AuthRepository,
  Box,
])
void main() async {
  final mock = MockAuthRepository();
  final bMock = MockBox();
  final response = await DummyResponse.getAuthPostResponse();

  group('LoginController auth() ', () {
    test('認証APIが正常終了するとき、APIが呼び出され、認証が正常終了すること', () async {
      // given
      when(mock.auth(email: '', password: ''))
          .thenAnswer((_) => Future.value(response));
      when(bMock.add(state)).thenAnswer((_) => Future.value(1));
      var model = LoginController(
        mock,
        bMock,
      );

      // when
      model.login();

      // then
      verify(mock.auth(email: '', password: '')).called(1);
    });

    test('認証APIが異常終了するとき、例外がthrowされること', () async {
      // given
      when(mock.auth(email: '', password: '')).thenThrow(
        Exception('api error occurred'),
      );
      var model = LoginController(
        mock,
        bMock,
      );

      // when / then
      expect(() => model.login(), throwsException);
      verify(mock.auth(email: '', password: '')).called(1);
    });
  });

  final target = LoginController(
    MockAuthRepository(),
    MockBox<LocalState>(),
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
