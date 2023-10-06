import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart';
import 'package:integration_test/integration_test.dart';
import 'package:internship/injection.dart';
import 'package:internship/presentation/pages/app.dart';
import 'package:internship/presentation/pages/home_page/post_card.dart';
import 'package:internship/presentation/pages/post_page/comment_tile.dart';
import 'package:internship/presentation/pages/post_page/full_post.dart';
import 'package:package_info_plus/package_info_plus.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  PackageInfo.setMockInitialValues(
    appName: 'test',
    packageName: 'test',
    version: '0.0.1',
    buildNumber: 'test',
    buildSignature: 'test',
  );

  group('end-to-end test', () {
    setUp(() => IntegrationTestWidgetsFlutterBinding.ensureInitialized());
    testWidgets('tap on the floating action button, verify counter', (tester) async {
      await configureInjection(Environment.prod);
      // Load app widget.
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      final post = find.byType(PostCard).first;

      await tester.tap(post);

      await tester.pumpAndSettle();

      expect(find.byType(FullPost), findsOneWidget);
      expect(find.byType(CommentTile), findsWidgets);
    });
  });
}
