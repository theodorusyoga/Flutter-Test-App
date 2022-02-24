import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvlk_test_app/view/home/menu/menuitem.dart';

import '../mocks/menu_mocks.dart';

void main() {
  group('widget', () {
    MenuMockFunction mockFunction = MenuMockFunction();

    testWidgets('initial values are correct', (WidgetTester tester) async {
      final Finder itemName = find.text(menuMock.menuName);
      final Finder itemButton = find.byKey(const ValueKey('itemButton'));

      await tester.pumpWidget(CupertinoApp(
          home: MenuItem(
              menuModel: menuMock,
              menuItemSize: MenuItemSize.large,
              onMenuItemPressed: mockFunction.onPressed)));
      await tester.pumpAndSettle();

      final itemIcon = find.byType(Icon).evaluate().first.widget as Icon;
      final itemIconBox = find
          .byKey(const ValueKey('itemIconBox'))
          .evaluate()
          .first
          .widget as Container;

      expect(itemName, findsOneWidget);
      expect(itemIcon.icon, menuMock.icon);
      expect(itemIcon.color, menuMock.iconColor);
      expect((itemIconBox.decoration as BoxDecoration).color, menuMock.bgColor);

      await tester.tap(itemButton);
      verify(mockFunction.onPressed()).called(1);
    });
  });
}
