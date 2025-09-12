import 'package:core/app_way_data_core.dart';

import 'package:instance/features/features.dart';

final screens = <Screen>[
  Screen(
    name: RouterBloc.route,
    page: (context) => RouterPage(),
    injector: IRouterInjector(),
  ),
];
