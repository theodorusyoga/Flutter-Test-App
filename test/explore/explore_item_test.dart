import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tvlk_test_app/view/home/explore/components/explore_item.dart';

import '../mocks/explore_mocks.dart';

void main() {
  group('widget', () {
    ExploreMockFunction mockFn = ExploreMockFunction();

    testWidgets('initial values are correct', (WidgetTester tester) async {
      final Finder itemName = find.text(exploreItemMock.name);
      final Finder itemDescription = find.text(exploreItemMock.description!);
      final Finder itemLocation = find.text(exploreItemMock.location);

      await tester.pumpWidget(CupertinoApp(
          home: ExploreItem(
              exploreItem: exploreItemMock,
              onBookmarkPressed: mockFn.onBookmarkPressed,
              onPressed: mockFn.onPressed,
              isLastItem: false)));
      await tester.pumpAndSettle();

      final itemImage =
          find.byType(Image).evaluate().first.widget as Image;

      expect(itemName, findsOneWidget);
      expect(itemDescription, findsOneWidget);
      expect(itemLocation, findsOneWidget);
      expect(
          (itemImage.image as AssetImage).assetName, exploreItemMock.imagePath);
    });

    testWidgets('item pressed fire the correct function for once',
        (WidgetTester tester) async {
      final Finder itemButton = find.byKey(const ValueKey('itemButton'));
      final Finder itemBookmarkButton =
          find.byKey(const ValueKey('itemBookmarkButton'));

      await tester.pumpWidget(CupertinoApp(
          home: ExploreItem(
              exploreItem: exploreItemMock,
              onBookmarkPressed: mockFn.onBookmarkPressed,
              onPressed: mockFn.onPressed,
              isLastItem: false)));

      await tester.tap(itemButton);
      verify(mockFn.onPressed(exploreItemMock.id)).called(1);
      await tester.tap(itemBookmarkButton);
      verify(mockFn.onBookmarkPressed(exploreItemMock.id)).called(1);
    });
  });
}
