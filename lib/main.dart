import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/firebase_options.dart';
import 'package:kfahi/screens/accounting/accounting_cubit.dart';
import 'package:kfahi/screens/accounting/accounting_screen.dart';
import 'package:kfahi/screens/design/design_cubit.dart';
import 'package:kfahi/screens/design/design_screen.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_screen.dart';
import 'package:kfahi/screens/management/management_cubit.dart';
import 'package:kfahi/screens/management/management_screen.dart';
import 'package:kfahi/screens/marketing/marketing_cubit.dart';
import 'package:kfahi/screens/marketing/marketing_screen.dart';
import 'package:kfahi/screens/programming/programming_cubit.dart';
import 'package:kfahi/screens/programming/programming_screen.dart';
import 'package:kfahi/screens/sign_in/sign_in_screen.dart';
import 'package:kfahi/screens/sign_in/sign_in_cubit.dart';
import 'package:kfahi/screens/sing_up/sign_up_screen.dart';
import 'package:kfahi/screens/sing_up/sign_up_cubit.dart';
import 'package:kfahi/screens/technology/technology_cubit.dart';
import 'package:kfahi/screens/technology/technology_screen.dart';
import 'package:kfahi/screens/test/test_cubit.dart';
import 'package:kfahi/screens/test/test_screen.dart';
import 'package:kfahi/screens/video/video_cubit.dart';
import 'package:kfahi/screens/video/video_screen.dart';
import 'package:kfahi/shared_prefs/network.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FontSizes.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInCubit()..autoSignIn(),
        ),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(
            create: (context) => HomeCubit()
              ..getNews()
              ..getMyPoints()),
        BlocProvider(
          create: (context) =>
              ProgrammingCubit()..getDoneLecs(docName: 'Ethicalhacking'),
        ),
        BlocProvider(
            create: (context) =>
                ManageMentCubit()..getDoneLecs(docName: "Business")),
        BlocProvider(
            create: (context) =>
                TechnologyCubit()..getDoneLecs(docName: 'ICDL')),
        BlocProvider(
            create: (context) => AccountingCubit()
              ..getDoneLecs(docName: 'Accounting Administration')),
        BlocProvider(
            create: (context) =>
                MarketingCubit()..getDoneLecs(docName: 'ContentWriting')),
        BlocProvider(
            create: (context) => DesignCubit()..getDoneLecs(docName: 'Canva')),
        BlocProvider(create: (context) => VideoCubit()),
        BlocProvider(create: (context) => TestCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
        theme: ThemeData(fontFamily: "Almarai"),
        routes: {
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ProgrammingScreen.id: (context) => ProgrammingScreen(),
          ManagementScreen.id: (context) => ManagementScreen(),
          TechnologyScreen.id: (context) => TechnologyScreen(),
          AccountingScreen.id: (context) => AccountingScreen(),
          MarketingScreen.id: (context) => MarketingScreen(),
          DesignScreen.id: (context) => DesignScreen(),
          VideoScreen.id: (context) => VideoScreen(),
          TestScreen.id: (context) => TestScreen(),
        },
        initialRoute: SignInScreen.id,
      ),
    );
  }
}
