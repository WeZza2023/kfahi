import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/firebase_options.dart';
import 'package:kfahi/screens/accounting/accounting_cubit.dart';
import 'package:kfahi/screens/accounting/accounting_screen.dart';
import 'package:kfahi/screens/agriculture/agriculture_cubit.dart';
import 'package:kfahi/screens/agriculture/agriculture_screen.dart';
import 'package:kfahi/screens/archaeology/archaeology_cubit.dart';
import 'package:kfahi/screens/archaeology/archaeology_screen.dart';
import 'package:kfahi/screens/commerce/commerce_cubit.dart';
import 'package:kfahi/screens/commerce/commerce_screen.dart';
import 'package:kfahi/screens/dar_al_uloom/dar_al_uloom_cubit.dart';
import 'package:kfahi/screens/dar_al_uloom/dar_al_uloom_screen.dart';
import 'package:kfahi/screens/dentistry/dentistry_cubit.dart';
import 'package:kfahi/screens/dentistry/dentistry_screen.dart';
import 'package:kfahi/screens/design/design_cubit.dart';
import 'package:kfahi/screens/design/design_screen.dart';
import 'package:kfahi/screens/engineering/engineering_cubit.dart';
import 'package:kfahi/screens/engineering/engineering_screen.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_screen.dart';
import 'package:kfahi/screens/kindergarten/kindergarten_cubit.dart';
import 'package:kfahi/screens/kindergarten/kindergarten_screen.dart';
import 'package:kfahi/screens/languages/languages_cubit.dart';
import 'package:kfahi/screens/languages/languages_screen.dart';
import 'package:kfahi/screens/law/law_cubit.dart';
import 'package:kfahi/screens/law/law_screen.dart';
import 'package:kfahi/screens/literature/literature_cubit.dart';
import 'package:kfahi/screens/literature/literature_screen.dart';
import 'package:kfahi/screens/management/management_cubit.dart';
import 'package:kfahi/screens/management/management_screen.dart';
import 'package:kfahi/screens/marketing/marketing_cubit.dart';
import 'package:kfahi/screens/marketing/marketing_screen.dart';
import 'package:kfahi/screens/media/media_cubit.dart';
import 'package:kfahi/screens/media/media_screen.dart';
import 'package:kfahi/screens/medicine/medicine_cubit.dart';
import 'package:kfahi/screens/medicine/medicine_screen.dart';
import 'package:kfahi/screens/notifications/notifications_screen.dart';
import 'package:kfahi/screens/nursing/nursing_cubit.dart';
import 'package:kfahi/screens/nursing/nursing_screen.dart';
import 'package:kfahi/screens/pharmacy/pharmacy_cubit.dart';
import 'package:kfahi/screens/pharmacy/pharmacy_screen.dart';
import 'package:kfahi/screens/programming/programming_cubit.dart';
import 'package:kfahi/screens/programming/programming_screen.dart';
import 'package:kfahi/screens/science/science_cubit.dart';
import 'package:kfahi/screens/science/science_screen.dart';
import 'package:kfahi/screens/sign_in/sign_in_screen.dart';
import 'package:kfahi/screens/sign_in/sign_in_cubit.dart';
import 'package:kfahi/screens/sing_up/sign_up_screen.dart';
import 'package:kfahi/screens/sing_up/sign_up_cubit.dart';
import 'package:kfahi/screens/specific_education/specific_education_cubit.dart';
import 'package:kfahi/screens/specific_education/specific_education_screen.dart';
import 'package:kfahi/screens/technology/technology_cubit.dart';
import 'package:kfahi/screens/technology/technology_screen.dart';
import 'package:kfahi/screens/test/test_cubit.dart';
import 'package:kfahi/screens/test/test_screen.dart';
import 'package:kfahi/screens/tourism_and_hotels/tourism_and_hotels_cubit.dart';
import 'package:kfahi/screens/tourism_and_hotels/tourism_and_hotels_screen.dart';
import 'package:kfahi/screens/veterinary_medicine/veterinary_medicine_cubit.dart';
import 'package:kfahi/screens/veterinary_medicine/veterinary_medicine_screen.dart';
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
  runApp(const MyApp());
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
            ..getMyPoints()
            ..getMyNotifications()
            ..getMyProfile()
            ..getInitiatives(),
        ),
        BlocProvider(
          create: (context) => ProgrammingCubit(),
        ),
        BlocProvider(create: (context) => ManageMentCubit()),
        BlocProvider(create: (context) => TechnologyCubit()),
        BlocProvider(create: (context) => AccountingCubit()),
        BlocProvider(create: (context) => MarketingCubit()),
        BlocProvider(create: (context) => DesignCubit()),
        BlocProvider(create: (context) => VideoCubit()),
        BlocProvider(create: (context) => TestCubit()),
        BlocProvider(create: (context) => LanguagesCubit()),
        BlocProvider(create: (context) => PharmacyCubit()),
        BlocProvider(create: (context) => MedicineCubit()),
        BlocProvider(create: (context) => EngineeringCubit()),
        BlocProvider(create: (context) => AgricultureCubit()),
        BlocProvider(create: (context) => ArchaeologyCubit()),
        BlocProvider(create: (context) => TourismAndHotelsCubit()),
        BlocProvider(create: (context) => NursingCubit()),
        BlocProvider(create: (context) => DentistryCubit()),
        BlocProvider(create: (context) => VeterinaryMedicineCubit()),
        BlocProvider(create: (context) => CommerceCubit()),
        BlocProvider(create: (context) => LiteratureCubit()),
        BlocProvider(create: (context) => MediaCubit()),
        BlocProvider(create: (context) => LawCubit()),
        BlocProvider(create: (context) => SpecificEducationCubit()),
        BlocProvider(create: (context) => DarAlUloomCubit()),
        BlocProvider(create: (context) => KindergartenCubit()),
        BlocProvider(create: (context) => ScienceCubit()),
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
          SignInScreen.id: (context) => const SignInScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          ProgrammingScreen.id: (context) => const ProgrammingScreen(),
          ManagementScreen.id: (context) => const ManagementScreen(),
          TechnologyScreen.id: (context) => const TechnologyScreen(),
          AccountingScreen.id: (context) => const AccountingScreen(),
          MarketingScreen.id: (context) => const MarketingScreen(),
          DesignScreen.id: (context) => const DesignScreen(),
          VideoScreen.id: (context) => const VideoScreen(),
          TestScreen.id: (context) => const TestScreen(),
          NotificationsScreen.id: (context) => const NotificationsScreen(),
          LanguagesScreen.id: (context) => const LanguagesScreen(),
          PharmacyScreen.id: (context) => const PharmacyScreen(),
          MedicineScreen.id: (context) => const MedicineScreen(),
          EngineeringScreen.id: (context) => const EngineeringScreen(),
          AgricultureScreen.id: (context) => const AgricultureScreen(),
          ArchaeologyScreen.id: (context) => const ArchaeologyScreen(),
          TourismAndHotelsScreen.id: (context) =>
              const TourismAndHotelsScreen(),
          NursingScreen.id: (context) => const NursingScreen(),
          DentistryScreen.id: (context) => const DentistryScreen(),
          VeterinaryMedicineScreen.id: (context) =>
              const VeterinaryMedicineScreen(),
          CommerceScreen.id: (context) => const CommerceScreen(),
          LiteratureScreen.id: (context) => const LiteratureScreen(),
          MediaScreen.id: (context) => const MediaScreen(),
          LawScreen.id: (context) => const LawScreen(),
          SpecificEducationScreen.id: (context) =>
              const SpecificEducationScreen(),
          DarAlUloomScreen.id: (context) => const DarAlUloomScreen(),
          KindergartenScreen.id: (context) => const KindergartenScreen(),
          ScienceScreen.id: (context) => const ScienceScreen(),
        },
        initialRoute: SignInScreen.id,
      ),
    );
  }
}
