

import 'package:challenge_diabetes/core/helper/api.dart';
import 'package:challenge_diabetes/core/helper/cach.dart';
import 'package:challenge_diabetes/core/widgets/network.dart';
import 'package:challenge_diabetes/core/widgets/onboarding.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/pressure_cubit/pressure_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:challenge_diabetes/features/activities/presentation/manager/weight_cubit/weight_check_cubit.dart';
import 'package:challenge_diabetes/features/appointments/presentation/manager/add_medicine_cubit/add_medicine_cubit.dart';
import 'package:challenge_diabetes/features/appointments/presentation/manager/get_medicine_cubit/get_medicine_cubit.dart';
import 'package:challenge_diabetes/features/auth/data/auth.dart';
import 'package:challenge_diabetes/features/auth/presentation/view/login.dart';
import 'package:challenge_diabetes/features/favourite/presentation/manager/cubit/favourite_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/dooctor_cubit/doctor_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/pressure_cubit/pressure_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:challenge_diabetes/features/home/presentation/manager/suger_cubit/sugar_cubit.dart';
import 'package:challenge_diabetes/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:challenge_diabetes/features/layout/presentation/view/glocu_layout.dart';
import 'package:challenge_diabetes/features/settings/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:challenge_diabetes/features/settings/presentation/manager/update_cubit/update_profile_cubit.dart';
import 'package:challenge_diabetes/features/social_media/presentation/manager/provider/user_provider.dart';
import 'package:challenge_diabetes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ChachHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  userToken = ChachHelper.getData(key: 'token');
  debugPrint('Token in main is $userToken');

  Widget widget;
  bool? onBoarding = ChachHelper.getData(key: 'onBoarding');

  Auth auth = Auth(/* Initialize Auth object with required parameters */);
  if (onBoarding != null) {
    if (userToken != null) {
      widget = GlucoLayout(
        auth: auth,
      );
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(
    Gluco(
      auth: auth,
      startWidget: widget,
      token: userToken,
    ),
  );
}

class Gluco extends StatelessWidget {
  final Widget startWidget;
  final String? token;
  final Auth auth;

  const Gluco({
    Key? key,
    required this.startWidget,
    this.token,
    required this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate =
        "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        BlocProvider(
          create: (context) => DoctorCubit()..getDoctors(),
        ),
        BlocProvider(
          create: (context) => GetMedicineCubit()..getMedicines(),
        ),
        BlocProvider(
          create: (context) => AddMedicineCubit(),
        ),
        BlocProvider<ReservationCubit>(
          create: (context) => ReservationCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProfileCubit(),
        ),
        BlocProvider(
          create: (context) => SugarCheckCubit(),
        ),
        BlocProvider(create: (context) => PresssureCheckCubit()),
        BlocProvider(create: (context) => WeightCheckCubit()),
        BlocProvider(
          create: (context) => LayoutCubit(auth),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(create: (context) => PressureCubit()),
        BlocProvider(
          create: (context) =>
              PresssureCheckCubit()..fetchpressuredata(formattedDate),
        ),
        BlocProvider(create: (context) => SugarCubit()),
        BlocProvider(
          create: (context) => SugarCheckCubit()..getsugarlevel(formattedDate),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit()..getFavouriteData(),
        ),
      ],
      child: MaterialApp(
        // locale: const Locale('ar'),
        // supportedLocales: const [
        //   Locale('en'),
        //   Locale('ar'),
        // ],
        // localizationsDelegates: const [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // localeResolutionCallback: (locale, supportedLocales) {
        //   for (var supportedLocale in supportedLocales) {
        //     if (supportedLocale.languageCode == locale?.languageCode) {
        //       return supportedLocale;
        //     }
        //   }
        //   return supportedLocales.first;
        // },
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}


