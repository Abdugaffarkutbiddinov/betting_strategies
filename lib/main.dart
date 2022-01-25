import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/betting_strategies/presentation/bloc/betting_strategy_list_bloc/betting_strategy_list_bloc.dart';
import 'features/betting_strategies/presentation/pages/betiing_strategy_list_page.dart';
import 'injection_container.dart' as di;

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp(key: null,));}

class MyApp extends StatelessWidget {
  const MyApp({required Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<BettingStrategyListBloc>(),
        child: BettingStrategyListPage(),
      ),
    );
  }
}

