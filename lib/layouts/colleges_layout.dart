import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/medicine/medicine_cubit.dart';
import 'package:kfahi/screens/pharmacy/pharmacy_screen.dart';

import '../components/components.dart';
import '../generated/l10n.dart';
import '../models/main_items_model.dart';
import '../screens/agriculture/agriculture_cubit.dart';
import '../screens/agriculture/agriculture_screen.dart';
import '../screens/archaeology/archaeology_cubit.dart';
import '../screens/archaeology/archaeology_screen.dart';
import '../screens/commerce/commerce_cubit.dart';
import '../screens/commerce/commerce_screen.dart';
import '../screens/dar_al_uloom/dar_al_uloom_cubit.dart';
import '../screens/dar_al_uloom/dar_al_uloom_screen.dart';
import '../screens/dentistry/dentistry_cubit.dart';
import '../screens/dentistry/dentistry_screen.dart';
import '../screens/engineering/engineering_cubit.dart';
import '../screens/engineering/engineering_screen.dart';
import '../screens/kindergarten/kindergarten_cubit.dart';
import '../screens/kindergarten/kindergarten_screen.dart';
import '../screens/law/law_cubit.dart';
import '../screens/law/law_screen.dart';
import '../screens/literature/literature_cubit.dart';
import '../screens/literature/literature_screen.dart';
import '../screens/media/media_cubit.dart';
import '../screens/media/media_screen.dart';
import '../screens/medicine/medicine_screen.dart';
import '../screens/nursing/nursing_cubit.dart';
import '../screens/nursing/nursing_screen.dart';
import '../screens/pharmacy/pharmacy_cubit.dart';
import '../screens/science/science_cubit.dart';
import '../screens/science/science_screen.dart';
import '../screens/specific_education/specific_education_cubit.dart';
import '../screens/specific_education/specific_education_screen.dart';
import '../screens/tourism_and_hotels/tourism_and_hotels_cubit.dart';
import '../screens/tourism_and_hotels/tourism_and_hotels_screen.dart';
import '../screens/veterinary_medicine/veterinary_medicine_cubit.dart';
import '../screens/veterinary_medicine/veterinary_medicine_screen.dart';
import '../screens/video/video_cubit.dart';

class CollegesLayout extends StatelessWidget {
  const CollegesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CollegesItem> colleges = [
      CollegesItem(
        title: S.of(context).pharmacy, // الصيدلة
        image: "assets/icons/pharmacy.png",
        color: const Color(0xff5DF7DA),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Pharmacy';

          Navigator.pushNamed(context, PharmacyScreen.id);
          BlocProvider.of<PharmacyCubit>(context).getDoneLecs(
              docName: 'Pharmaceutical cosmetics and formulations',
              collageName: 'Pharmacy');
        },
      ),
      CollegesItem(
        title: S.of(context).medicine, // الطب
        image: "assets/icons/doctor.png",
        color: const Color(0xff905FFD),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Medicine';

          Navigator.pushNamed(context, MedicineScreen.id);
          BlocProvider.of<MedicineCubit>(context)
              .getDoneLecs(docName: 'Anatomy', collageName: 'Medicine');
        },
      ),
      CollegesItem(
        title: S.of(context).engineering, // الهندسة
        image: "assets/icons/engineer.png",
        color: const Color(0xff0396F7),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Engineering';

          Navigator.pushNamed(context, EngineeringScreen.id);
          BlocProvider.of<EngineeringCubit>(context).getDoneLecs(
              docName: 'Engineering drawing', collageName: 'Engineering');
        },
      ),
      CollegesItem(
        title: S.of(context).agriculture, // الزراعة
        image: "assets/icons/agriculture.png",
        color: const Color(0xffCAE7FF),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Agriculture';

          Navigator.pushNamed(context, AgricultureScreen.id);
          BlocProvider.of<AgricultureCubit>(context)
              .getDoneLecs(docName: 'Biochemistry', collageName: 'Agriculture');
        },
      ),
      CollegesItem(
        title: S.of(context).archaeology, // الآثار
        image: "assets/icons/ruins.png",
        color: const Color(0xff758792),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Archaeology';

          Navigator.pushNamed(context, ArchaeologyScreen.id);
          BlocProvider.of<ArchaeologyCubit>(context)
              .getDoneLecs(docName: 'Anthropology', collageName: 'Archaeology');
        },
      ),
      CollegesItem(
        title: S.of(context).tourism_and_hotels, // سياحة وفنادق
        image: "assets/icons/tourism.png",
        color: const Color(0xffDBF743),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Tourism & Hotels';

          Navigator.pushNamed(context, TourismAndHotelsScreen.id);
          BlocProvider.of<TourismAndHotelsCubit>(context).getDoneLecs(
              docName: 'Archaeological Guidance Tourism',
              collageName: 'Tourism & Hotels');
        },
      ),
      CollegesItem(
        title: S.of(context).nursing, // التمريض
        image: "assets/icons/nurse.png",
        color: const Color(0xff8AEB1F),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Nursing';

          Navigator.pushNamed(context, NursingScreen.id);
          BlocProvider.of<NursingCubit>(context).getDoneLecs(
              docName: 'Nursing Fundamentals', collageName: 'Nursing');
        },
      ),
      CollegesItem(
        title: S.of(context).dentistry, // طب الأسنان
        image: "assets/icons/teeth.png",
        color: const Color(0xffDD4217),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Dentistry';

          Navigator.pushNamed(context, DentistryScreen.id);
          BlocProvider.of<DentistryCubit>(context)
              .getDoneLecs(docName: 'Dental Anatomy', collageName: 'Dentistry');
        },
      ),
      CollegesItem(
        title: S.of(context).veterinary_medicine, // الطب البيطري
        image: "assets/icons/cat.png",
        color: const Color(0xffB3F9C1),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName =
              'Veterinary medicine';

          Navigator.pushNamed(context, VeterinaryMedicineScreen.id);
          BlocProvider.of<VeterinaryMedicineCubit>(context).getDoneLecs(
              docName: 'Pharma antibiotics',
              collageName: 'Veterinary medicine');
        },
      ),
      CollegesItem(
        title: S.of(context).commerce, // التجارة
        image: "assets/icons/commerce.png",
        color: const Color(0xff6243A1),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Commerce';

          Navigator.pushNamed(context, CommerceScreen.id);
          BlocProvider.of<CommerceCubit>(context).getDoneLecs(
              docName: 'Entrepreneurship', collageName: 'Commerce');
        },
      ),
      CollegesItem(
        title: S.of(context).literature, // الآداب
        image: "assets/icons/literature.png",
        color: const Color(0xffCAE7FF),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Literature';

          Navigator.pushNamed(context, LiteratureScreen.id);
          BlocProvider.of<LiteratureCubit>(context).getDoneLecs(
              docName: 'Ancient Egyptian Literature',
              collageName: 'Literature');
        },
      ),
      CollegesItem(
        title: S.of(context).media, // الإعلام
        image: "assets/icons/camera.png",
        color: const Color(0xff1753CF),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Media';

          Navigator.pushNamed(context, MediaScreen.id);
          BlocProvider.of<MediaCubit>(context).getDoneLecs(
              docName: 'Journalistic editing', collageName: 'Media');
        },
      ),
      CollegesItem(
        title: S.of(context).law, // الحقوق
        image: "assets/icons/law.png",
        color: const Color(0xffB454B1),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Law';

          Navigator.pushNamed(context, LawScreen.id);
          BlocProvider.of<LawCubit>(context)
              .getDoneLecs(docName: 'Administrative law', collageName: 'Law');
        },
      ),
      CollegesItem(
        title: S.of(context).specific_education, // التربية النوعية
        image: "assets/icons/training.png",
        color: const Color(0xffBFA4A3),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName =
              'Specific Education';

          Navigator.pushNamed(context, SpecificEducationScreen.id);
          BlocProvider.of<SpecificEducationCubit>(context).getDoneLecs(
              docName: 'Pottery making', collageName: 'Specific Education');
        },
      ),
      CollegesItem(
        title: S.of(context).dar_al_uloom, // دار العلوم
        image: "assets/icons/university.png",
        color: const Color(0xffD6A784),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Dar Al-Uloom';
          Navigator.pushNamed(context, DarAlUloomScreen.id);
          BlocProvider.of<DarAlUloomCubit>(context).getDoneLecs(
              docName: 'General linguistics', collageName: 'Dar Al-Uloom');
        },
      ),
      CollegesItem(
        title: S.of(context).kindergarten, // رياض الأطفال
        image: "assets/icons/abc.png",
        color: const Color(0xffFF7D7A),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Kindergarten';
          Navigator.pushNamed(context, KindergartenScreen.id);
          BlocProvider.of<KindergartenCubit>(context).getDoneLecs(
              docName: 'Psychology kids', collageName: 'Kindergarten');
        },
      ),
      CollegesItem(
        title: S.of(context).science, // العلوم
        image: "assets/icons/lab.png",
        color: const Color(0xff28A4B0),
        onTap: () {
          BlocProvider.of<VideoCubit>(context).collageName = 'Science';
          Navigator.pushNamed(context, ScienceScreen.id);
          BlocProvider.of<ScienceCubit>(context)
              .getDoneLecs(docName: 'Algebra', collageName: 'Science');
        },
      ),
    ];

    return ListView.builder(
      itemCount: 17,
      itemBuilder: (context, index) => CustomMainItem(
          onTap: colleges[index].onTap,
          context: context,
          color: colleges[index].color,
          title: colleges[index].title,
          img: colleges[index].image),
    );
  }
}
