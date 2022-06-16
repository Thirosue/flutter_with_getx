import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_getx/data/const/path.dart';
import 'package:flutter_with_getx/data/model/device/device.dart';
import 'package:flutter_with_getx/data/model/local_state.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/data/repository/state_repository.dart';
import 'package:flutter_with_getx/ui/login/login_middleware.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_index_page.dart';
import '../../dummy/dummy_page.dart';
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
])
void main() async {
  final mockAuthRepository = MockAuthRepository();
  final mockStateAuthRepository = MockStateRepository();
  final response = await DummyResponse.getAuthPostResponse();

  final target = LoginMiddleWare(
    auth: mockAuthRepository,
    state: mockStateAuthRepository,
  );

  group('LoginMiddleWare refreshToken() ', () {
    test('認証APIとストレージが正常のとき、トークンが正常にリフレッシュされること', () async {
      // given
      when(mockAuthRepository.refresh())
          .thenAnswer((_) => Future.value(response));
      when(mockStateAuthRepository.write(state))
          .thenAnswer((_) => Future<void>.value());
      when(mockStateAuthRepository.read()).thenReturn(state);

      // when
      final result = await target.refreshToken();

      // then
      expect(result, true);
      verifyInOrder([
        mockAuthRepository.refresh(),
        mockStateAuthRepository.write(state),
      ]);
    });

    test('認証APIで例外が発生したとき、トークンリフレッシュ結果が false となること', () async {
      // given
      when(mockAuthRepository.refresh()).thenThrow(Exception('api error'));
      when(mockStateAuthRepository.write(state))
          .thenAnswer((_) => Future<void>.value());

      // when
      final result = await target.refreshToken();

      // then
      expect(result, false);
      verify(mockAuthRepository.refresh()).called(1);
      verifyNever(mockStateAuthRepository.write(state));
    });

    test('ストレージ書き込みで例外が発生したとき、トークンリフレッシュ結果が false となること', () async {
      // アプリが利用できている時点で、ストレージ障害が発生する確率は極めて低い
      // 重要度が低いため、スキップとする
    });
  });

  group('LoginMiddleWare redirect() ', () {
    group('正常系の確認 ', () {
      testWidgets('アプリを利用したことがない場合、ログインページからスタートすること', (tester) async {
        // given
        when(mockStateAuthRepository.read())
            .thenReturn(const LocalState(name: 'unknown'));

        // when
        target.redirect(Path.index);

        await tester
            .pump(const Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
        await tester.pumpAndSettle();

        // then
        verifyNever(mockAuthRepository.refresh());
        // テスト容易性が低いため、リダイレクトしないことの検証はスキップする
      });

      testWidgets(
          'アプリを利用したことがあり（＝前回ログイン情報がストレージに保存されている）、トークンが有効な場合、ホームページにリダイレクトされること',
          (tester) async {
        // given
        var loginPage = const DummyPage();
        var indexPage = const DummyIndexPage();
        await tester.pumpWidget(
          GetMaterialApp(
            initialRoute: Path.login,
            getPages: [
              GetPage(
                name: Path.login,
                page: () => loginPage,
              ),
              GetPage(
                name: Path.index,
                page: () => indexPage,
              ),
            ],
          ),
        );
        when(mockStateAuthRepository.read()).thenReturn(state);
        when(mockStateAuthRepository.write(state))
            .thenAnswer((_) => Future<void>.value());
        when(mockAuthRepository.refresh())
            .thenAnswer((_) => Future.value(response));
        expect(find.byWidget(loginPage), findsOneWidget);

        // when
        target.redirect(Path.index);

        await tester
            .pump(const Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
        await tester.pumpAndSettle();

        // then
        expect(find.byWidget(indexPage), findsOneWidget);
        verifyInOrder([
          mockStateAuthRepository.read(),
          mockAuthRepository.refresh(),
          mockStateAuthRepository.write(state),
        ]);
      });

      testWidgets(
          'アプリを利用したことがあり（＝前回ログイン情報がストレージに保存されている）、トークンが無効な場合、ログインページからスタートすること',
          (tester) async {
        // given
        when(mockStateAuthRepository.read()).thenReturn(state);
        when(mockAuthRepository.refresh())
            .thenThrow(Exception('token invalid'));

        // when
        target.redirect(Path.index);

        await tester
            .pump(const Duration(seconds: 60)); // SnackBarが表示されるのを待ち合わせる
        await tester.pumpAndSettle();

        // then
        verifyInOrder([
          mockStateAuthRepository.read(),
          mockAuthRepository.refresh(),
        ]);
        verifyNever(mockStateAuthRepository.write(state));
        // テスト容易性が低いため、リダイレクトしないことの検証はスキップする
      });
    });

    group('異常系の確認 ', () {
      test('ストレージ読み込みで例外が発生したとき、例外をthrowすること', () async {
        // アプリが利用できている時点で、ストレージ障害が発生する確率は極めて低い
        // 重要度が低いため、スキップとする
      });
    });
  });
}
