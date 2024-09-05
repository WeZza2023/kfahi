import 'package:flutter/material.dart';

import '../components/components.dart';
import '../generated/l10n.dart';
import '../models/main_items_model.dart';

class CollegesLayout extends StatelessWidget {
  const CollegesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CollegesItem> colleges = [
      CollegesItem(
        title: S
            .of(context)
            .pharmacy, // الصيدلة
        image: "assets/icons/pharmacy.png",
        color: const Color(0xff5DF7DA),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .medicine, // الطب
        image: "assets/icons/doctor.png",
        color: const Color(0xff905FFD),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .engineering, // الهندسة
        image: "assets/icons/engineer.png",
        color: const Color(0xff0396F7),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .agriculture, // الزراعة
        image: "assets/icons/agriculture.png",
        color: const Color(0xffCAE7FF),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .archaeology, // الآثار
        image: "assets/icons/ruins.png",
        color: const Color(0xff758792),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .tourism_and_hotels, // سياحة وفنادق
        image: "assets/icons/tourism.png",
        color: const Color(0xffDBF743),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .nursing, // التمريض
        image: "assets/icons/nurse.png",
        color: const Color(0xff8AEB1F),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .dentistry, // طب الأسنان
        image: "assets/icons/teeth.png",
        color: const Color(0xffDD4217),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .veterinary_medicine, // الطب البيطري
        image: "assets/icons/cat.png",
        color: const Color(0xffB3F9C1),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .commerce, // التجارة
        image: "assets/icons/commerce.png",
        color: const Color(0xff6243A1),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .literature, // الآداب
        image: "assets/icons/literature.png",
        color: const Color(0xffCAE7FF),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .media, // الإعلام
        image: "assets/icons/camera.png",
        color: const Color(0xff1753CF),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .law, // الحقوق
        image: "assets/icons/law.png",
        color: const Color(0xffB454B1),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .specific_education, // التربية النوعية
        image: "assets/icons/training.png",
        color: const Color(0xffBFA4A3),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .dar_al_uloom, // دار العلوم
        image: "assets/icons/university.png",
        color: const Color(0xffD6A784),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .kindergarten, // رياض الأطفال
        image: "assets/icons/abc.png",
        color: const Color(0xffFF7D7A),
        onTap: () {},
      ),
      CollegesItem(
        title: S
            .of(context)
            .science, // العلوم
        image: "assets/icons/lab.png",
        color: const Color(0xff28A4B0),
        onTap: () {},
      ),
    ];

    return ListView.builder(
      itemCount: 17,
      itemBuilder: (context, index) =>
          CustomMainItem(
              onTap: () {},
              context: context,
              color: colleges[index].color,
              title: colleges[index].title,
              img: colleges[index].image),
    );
  }
}
