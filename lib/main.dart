

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
      widget = LoginScreen();
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
          create: (context) => SocialCubit()..getPosts(),
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
          create: (context) => UpdatePostsCubit(),
        ),
        BlocProvider(
          create: (context) => AddPostCubit(),
        ),
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
        locale: const Locale('ar'),
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
