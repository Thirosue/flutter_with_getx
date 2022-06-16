import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_getx/data/model/device/device.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/data/repository/device_repository.dart';
import 'package:flutter_with_getx/data/repository/state_repository.dart';
import 'package:flutter_with_getx/ui/login/login_controller.dart';
import 'package:get/state_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_response.dart';
import 'login_controller_test.mocks.dart';

var fcmToken =
    'dpcE8qdHjEZKtl3-EvK-EY:APA91bH3LllTX0GgR_Q5plrJT6wXgGFaoq-06FrqFUEgg-pNvHcsxR_o4Q76eswTnX7iHFPh8u2JBjzPav6AuecKZr7-_K3MQ9lXc5tWhQSYJpYBXz-L_dGKhMo-9p96gd_lsiikoS0M';
var token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';
var state = LocalState(
  name: 'john doe',
  idToken: token,
  refreshToken: token,
  accessToken: token,
);
var device = Device(
  token: fcmToken,
);

@GenerateMocks([
  AuthRepository,
  StateRepository,
  DeviceRepository,
])
void main() async {
  final mock = MockAuthRepository();
  final stateMock = MockStateRepository();
  final deviceMock = MockDeviceRepository();
  final response = await DummyResponse.getAuthPostResponse();

  group('LoginController auth() ', () {
    test('認証APIが正常終了するとき、APIが呼び出され、認証が正常終了すること', () async {
      // given
      when(mock.auth(email: '', password: ''))
          .thenAnswer((_) => Future.value(response));
      when(stateMock.read()).thenReturn(state);
      when(stateMock.write(state)).thenAnswer((_) => Future<void>.value());
      when(deviceMock.save(device)).thenAnswer((_) => Future<void>.value());

      var model = LoginController(
        mock,
        stateMock,
        deviceMock,
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
        stateMock,
        deviceMock,
      );

      // when / then
      expect(() => model.login(), throwsException);
      verify(mock.auth(email: '', password: '')).called(1);
    });
  });

  final target = LoginController(
    MockAuthRepository(),
    MockStateRepository(),
    MockDeviceRepository(),
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
