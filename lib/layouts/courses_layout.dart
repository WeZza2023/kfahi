import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/accounting/accounting_screen.dart';
import 'package:kfahi/screens/management/management_screen.dart';
import 'package:kfahi/screens/marketing/marketing_screen.dart';
import 'package:kfahi/screens/technology/technology_screen.dart';
import '../components/components.dart';
import '../generated/l10n.dart';
import '../models/main_items_model.dart';
import '../screens/accounting/accounting_cubit.dart';
import '../screens/design/design_cubit.dart';
import '../screens/design/design_screen.dart';
import '../screens/languages/languages_cubit.dart';
import '../screens/languages/languages_screen.dart';
import '../screens/management/management_cubit.dart';
import '../screens/marketing/marketing_cubit.dart';
import '../screens/programming/programming_cubit.dart';
import '../screens/programming/programming_screen.dart';
import '../screens/technology/technology_cubit.dart';

class CoursesLayout extends StatelessWidget {
  const CoursesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CoursesItem> courses = [
      CoursesItem(
          title: S.of(context).programming,
          image: "assets/icons/programming.png",
          color: const Color(0xff6D79BC),
          onTap: () {
            Navigator.pushNamed(
              context,
              ProgrammingScreen.id,
            );
            BlocProvider.of<ProgrammingCubit>(context)
                .getDoneLecs(docName: 'Before programming', isCourse: true);
          },
          number: "18"),
      CoursesItem(
          title: S.of(context).management,
          image: "assets/icons/management.png",
          color: const Color(0xffFF7D7A),
          onTap: () {
            Navigator.pushNamed(
              context,
              ManagementScreen.id,
            );
            BlocProvider.of<ManageMentCubit>(context)
                .getDoneLecs(docName: 'Business', isCourse: true);
          },
          number: "9"),
      CoursesItem(
          title: S.of(context).technology,
          image: "assets/icons/technology.png",
          color: const Color(0xff7D7A98),
          onTap: () {
            Navigator.pushNamed(
              context,
              TechnologyScreen.id,
            );
            BlocProvider.of<TechnologyCubit>(context)
                .getDoneLecs(docName: 'ICDL', isCourse: true);
          },
          number: "3"),
      CoursesItem(
          title: S.of(context).accounting,
          image: "assets/icons/accounting.png",
          color: const Color(0xffCAE7FF),
          onTap: () {
            Navigator.pushNamed(
              context,
              AccountingScreen.id,
            );
            BlocProvider.of<AccountingCubit>(context).getDoneLecs(
                docName: 'Accounting Administration', isCourse: true);
          },
          number: "4"),
      CoursesItem(
          title: S.of(context).marketing,
          image: "assets/icons/marketing.png",
          color: const Color(0xffC58EB5),
          onTap: () {
            Navigator.pushNamed(
              context,
              MarketingScreen.id,
            );
            BlocProvider.of<MarketingCubit>(context)
                .getDoneLecs(docName: 'ContentWriting', isCourse: true);
          },
          number: "6"),
      CoursesItem(
          title: S.of(context).design,
          image: "assets/icons/design.png",
          color: const Color(0xffA68670),
          onTap: () {
            Navigator.pushNamed(
              context,
              DesignScreen.id,
            );
            BlocProvider.of<DesignCubit>(context)
                .getDoneLecs(docName: 'Canva', isCourse: true);
          },
          number: "3"),
      CoursesItem(
          title: S.of(context).languages,
          image: "assets/icons/languages.png",
          color: const Color(0xffFF7936),
          onTap: () {
            Navigator.pushNamed(
              context,
              LanguagesScreen.id,
            );
            BlocProvider.of<LanguagesCubit>(context)
                .getDoneLecs(docName: 'English', isCourse: true);
          },
          number: "5"),
    ];
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) => CustomMainItem(
          context: context,
          onTap: courses[index].onTap,
          color: courses[index].color,
          title: courses[index].title,
          number: courses[index].number,
          img: courses[index].image),
    );
  }
}
