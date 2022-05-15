import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_getx/data/repository/auth_repository.dart';
import 'package:flutter_with_getx/ui/login/login_controller.dart';
import 'package:flutter_with_getx/ui/login/login_page.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/dummy_response.dart';
import '../utils/editable_text_utils.dart' show findRenderEditable;
import 'login_controller_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() async {
  final mock = MockAuthRepository();
  final response = await DummyResponse.getAuthPostResponse();

  GetMaterialApp loginApp() {
    return GetMaterialApp(
      home: LoginPage(),
    );
  }

  setUp(() {
    Get.testMode = true;
    Get.put(LoginController(mock));
  });

  /// ///////////////////
  /// elements
  /// //////////////////
  final _id = find.byType(FormBuilderTextField).at(0);
  final _password = find.byType(FormBuilderTextField).at(1);
  final _submitButton = find.text('Login');
  final _passwordViewToggle = find.byType(IconButton);

  group('LoginPage ', () {
    group('ページの初期表示確認 ', () {
      testWidgets(' 画面が表示されたとき、ログインボタンが存在すること', (tester) async {
        // when
        await tester.pumpWidget(loginApp());

        // then
        expect(_submitButton, findsOneWidget);
      });
    });
  });

  group('入力チェックの確認 ', () {
    testWidgets(' 画面が表示されたとき、入力チェックが動作していないこと', (tester) async {
      // when
      await tester.pumpWidget(loginApp());

      // then
      expect(find.text('入力してください'), findsNothing);
    });

    testWidgets(' ユーザIDを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      // given
      await tester.pumpWidget(loginApp());
      await tester.enterText(_password, 'password');

      // when
      await tester.tap(_submitButton);
      await tester.pump();

      // then
      final validationErrorMessages = find.text('入力してください');
      expect(validationErrorMessages, findsOneWidget);
      verifyNever(mock.auth());
    });

    testWidgets(' パスワードを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      // given
      await tester.pumpWidget(loginApp());
      await tester.enterText(_id, 'demo');

      // when
      await tester.tap(_submitButton);
      await tester.pump();

      // then
      final validationErrorMessages = find.text('入力してください');
      expect(validationErrorMessages, findsOneWidget);
      verifyNever(mock.auth());
    });

    testWidgets(' ユーザID、及びパスワードを入力せずにログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      // given
      await tester.pumpWidget(loginApp());

      // when
      await tester.tap(_submitButton);
      await tester.pump();

      // then
      final validationErrorMessages = find.text('入力してください');
      expect(validationErrorMessages, findsNWidgets(2));
      verifyNever(mock.auth());
    });

    testWidgets(' ユーザIDにメールアドレス以外を入力し、ログインボタンを押したとき、入力チェックが動作し、エラーとなること',
        (tester) async {
      // given
      await tester.pumpWidget(loginApp());
      await tester.enterText(_password, 'password');
      await tester.enterText(_id, 'test');

      // when
      await tester.tap(_submitButton);
      await tester.pump();

      // then
      final validationErrorMessages = find.text('E-mailを入力してください');
      expect(validationErrorMessages, findsOneWidget);
      verifyNever(mock.auth());
    });

    testWidgets(' ユーザID、及びパスワードを入力し、ログインボタンを押したとき、入力チェックが正常となり、ログイン処理が行われること',
        (tester) async {
      // given
      when(mock.auth(email: 'test@test.com', password: 'password'))
          .thenAnswer((_) => Future.value(response));

      await tester.pumpWidget(loginApp());
      await tester.enterText(_password, 'password');
      await tester.enterText(_id, 'test@test.com');

      // when
      await tester.tap(_submitButton);
      await tester.pump(const Duration(seconds: 60));

      // then
      expect(find.text('入力してください'), findsNothing);
      expect(find.text('E-mailを入力してください'), findsNothing);
      verify(mock.auth(email: 'test@test.com', password: 'password')).called(1);
    });
  });

  group('パスワードマスクの確認 ', () {
    testWidgets(
        '初期状態でパスワードを入力した場合、パスワードがマスクされていること、その後、パスワードトグルアイコンを押すごとに、表示・非表示が切り替わること',
        (tester) async {
      // given
      await tester.pumpWidget(loginApp());

      // when
      await tester.enterText(_password, 'hoge');
      await tester.pump();

      // then
      final editTextInit =
          findRenderEditable(tester, 1).text!.obs.value.toPlainText();
      debugPrint('Mask: $editTextInit');
      expect(editTextInit.substring(editTextInit.length - 1), '\u2022');

      // when
      await tester.tap(_passwordViewToggle);
      await tester.pump();

      // then
      final String editTextThen =
          findRenderEditable(tester, 1).text!.obs.value.toPlainText();
      debugPrint('unMask: $editTextThen');
      expect(editTextThen, 'hoge');

      // when
      await tester.tap(_passwordViewToggle);
      await tester.pump();

      // then
      final String editTextThen2 =
          findRenderEditable(tester, 1).text!.obs.value.toPlainText();
      debugPrint('Mask: $editTextThen2');
      expect(editTextThen2.substring(editTextThen2.length - 1), '\u2022');
    });
  });
}
