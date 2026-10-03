import 'package:flutter_test/flutter_test.dart';
import 'package:profile_card/main.dart';

void main() {
  testWidgets('Profile Card renders name and key sections', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that profile name and sections are found.
    expect(find.text('Varanasi Sri Madhura'), findsOneWidget);
    expect(find.text('About Me'), findsOneWidget);
    expect(find.text('Skills'), findsOneWidget);
    expect(find.text('Contact Me'), findsOneWidget);
  });
}
