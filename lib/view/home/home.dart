import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './searchbar/searchbar.dart';
import './menu/menu.dart';
import './points/points.dart';

import '../../assets/colors.dart';
import '../../view_model/explore.dart';
import '../../mocks/menu_data.dart';
import './explore/explore.dart';
import '../../view_model/home.dart';
import '../../redux/actions.dart';
import '../../redux/state.dart';
import '../view.dart';
import './styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.store}) : super(key: key);

  final Store<TvlkTestAppState> store;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<State<StatefulWidget>> headerKey = GlobalKey();
  double _headerHeight = 0;

  final ScrollController? controller = ScrollController();

  // call getHeaderHeight after all widgets are loaded
  @override
  initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _getHeaderHeight());
    super.initState();
  }

  void _getHeaderHeight() {
    final BuildContext? context = headerKey.currentContext;

    setState(() {
      _headerHeight = context?.size?.height ?? 0;
    });
  }

  void _onStoreInit(Store<TvlkTestAppState> store) {
    // later, use this to load data from API...
    Future.delayed(const Duration(seconds: 3), () {
      store.dispatch(SetGlobalLoadingAction(false));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _headers = [SearchBar(key: headerKey)];

    final _styles = HomeStyles();

    final _explores = [0, 1, 2].map((index) => Explore(index: index)).toList();

    final _contents = [
      Points(),
      Menu(menus: [menuMocks, menuMocks, menuMocks]),
      Column(
        children: _explores,
      )
    ];

    final double _screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.bottom;
    final double _contentsHeight = _screenHeight - _headerHeight - 120;

    Widget _listViewBuilder(context, index) {
      return StickyHeader(
          header: index == 2
              ? Container(
                  height: 50,
                  decoration: _styles.headerDecoration,
                  padding: _styles.headerPadding,
                  alignment: Alignment.centerLeft,
                  child: Container(
                      decoration: _styles.headerTextDecoration,
                      padding: _styles.headerTextPadding,
                      child: Text('For You', style: _styles.headerTextStyle)),
                )
              : Container(),
          content: _contents[index]);
    }

    Widget _loadingSpinner = Center(
        child: SpinKitRing(color: colors[ColorName.basicBlue]!, size: 50));

    final Widget _home = MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ExploreViewModel())
        ],
        child: StoreConnector<TvlkTestAppState, HomeViewModel>(
            onInit: _onStoreInit,
            builder: (_, viewModel) => Column(children: [
                  Column(
                    children: _headers,
                  ),
                  SizedBox(
                      height: _contentsHeight,
                      child: viewModel.isLoading
                          ? _loadingSpinner
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: _contents.length,
                              // primary: controller == null,
                              controller: controller,
                              itemBuilder: _listViewBuilder)),
                ]),
            converter: (store) => HomeViewModel.fromStore(store)));

    Widget activeScreen(int index) {
      switch (index) {
        case 1:
          return _home;
        default:
          return _home;
      }
    }

    return MainView(
        store: widget.store,
        child: CupertinoPageScaffold(
            resizeToAvoidBottomInset: false,
            child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(items: const [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.profile_circled),
                      label: 'Profile'),
                ]),
                tabBuilder: (BuildContext context, int index) {
                  return CupertinoTabView(
                    builder: (BuildContext context) {
                      return Center(
                        child: activeScreen(index),
                      );
                    },
                  );
                }),
            backgroundColor: colors[ColorName.white]));
  }
}
