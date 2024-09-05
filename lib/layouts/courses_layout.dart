import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/accounting/accounting_screen.dart';
import 'package:kfahi/screens/management/management_screen.dart';
import 'package:kfahi/screens/marketing/marketing_screen.dart';
import 'package:kfahi/screens/technology/technology_screen.dart';

import '../components/components.dart';
import '../generated/l10n.dart';
import '../models/main_items_model.dart';
import '../screens/design/design_screen.dart';
import '../screens/programming/programming_cubit.dart';
import '../screens/programming/programming_screen.dart';

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
          },
          number: "3"),
      CoursesItem(
          title: S.of(context).management,
          image: "assets/icons/management.png",
          color: const Color(0xffFF7D7A),
          onTap: () {
            Navigator.pushNamed(
              context,
              ManagementScreen.id,
            );
          },
          number: "3"),
      CoursesItem(
          title: S.of(context).technology,
          image: "assets/icons/technology.png",
          color: const Color(0xff7D7A98),
          onTap: () {
            Navigator.pushNamed(
              context,
              TechnologyScreen.id,
            );
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
          },
          number: "4"),
      CoursesItem(
          title: S.of(context).design,
          image: "assets/icons/design.png",
          color: const Color(0xffA68670),
          onTap: () {
            Navigator.pushNamed(
              context,
              DesignScreen.id,
            );
          },
          number: "3"),
      CoursesItem(
          title: S.of(context).languages,
          image: "assets/icons/languages.png",
          color: const Color(0xffFF7936),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              AppSnackBar(
                  message: S.of(context).no_courses_available, error: true),
            );
          },
          number: "0"),
    ];
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) => CustomMainItem(
          onTap: courses[index].onTap,
          context: context,
          color: courses[index].color,
          title: courses[index].title,
          number: courses[index].number,
          img: courses[index].image),
    );
  }
}
