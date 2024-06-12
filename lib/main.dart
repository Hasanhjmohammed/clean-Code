
import 'package:cleancode/bolc_observer.dart';
import 'package:cleancode/depansess_injk.dart' as di;
import 'package:cleancode/feature/post/presentation/bloc/postbloc/postbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/appTheme.dart';
import 'feature/post/presentation/page/home_page.dart';
import '';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer=MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider<PostblocBloc>(create: (_)=>di.getIt<PostblocBloc>()),
    ],
        child: MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: HomePage(),
    )) ;
  }
}

