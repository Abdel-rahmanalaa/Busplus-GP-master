import 'package:busplus/Layouts/Driver/DriverCubit/driver_cubit.dart';
import 'package:busplus/Layouts/Passenger/PassengerCubit/passenger_cubit.dart';
import 'package:busplus/Modules/Login/LoginCubit/login_cubit.dart';
import 'package:busplus/Modules/Register/DriverRegister/DriverRegisterCubit/driver_register_cubit.dart';
import 'package:busplus/Modules/Register/PassengerRegister/PassengerRegisterCubit/passenger_register_cubit.dart';
import 'package:busplus/Modules/SplashScreen/blind_splash_screen.dart';
import 'package:busplus/Modules/SplashScreen/driver_splash_screen.dart';
import 'package:busplus/Modules/SplashScreen/passenger_splash_screen.dart';
import 'package:busplus/Modules/SplashScreen/login_splash_screen.dart';
import 'package:busplus/Shared/Cubit/app_cubit.dart';
import 'package:busplus/Shared/Cubit/app_states.dart';
import 'package:busplus/Shared/Network/Local/cache_helper.dart';
import 'package:busplus/Shared/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Shared/Components/constants.dart';

void main()
{
  BlocOverrides.runZoned(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await Firebase.initializeApp();

        await CacheHelper.init();

        Widget widget;

        passengerId = CacheHelper.getData(key: 'passengerId');
        blindPassengerId = CacheHelper.getData(key: 'blindPassengerId');
        driverId = CacheHelper.getData(key: 'driverId');

        if(passengerId != null)
          widget = PassengerSplashScreen();

        else if(blindPassengerId != null)
          widget = BlindPassengerSplashScreen();

        else if(driverId != null)
          widget = DriverSplashScreen();

        else
          widget = const LoginSplashScreen();


        runApp(MyApp(
          startWidget: widget,
        ));
      },
      blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {

  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => PassengerCubit()..getPassengerData(),
        ),
        BlocProvider(
          create: (BuildContext context) => DriverCubit()..getDriverData(),
        ),
        BlocProvider(
          create: (BuildContext context) => PassengerRegisterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DriverRegisterCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>
        (
        listener: (context, state){},
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
              inputDecorationTheme: const InputDecorationTheme(
                iconColor: Colors.teal,
              ),
            ),
            home: widget.startWidget,
          );
        },
      ),
    );
  }
}

