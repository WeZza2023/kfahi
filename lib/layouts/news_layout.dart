import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_state.dart';

import '../components/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => state is GetNewsErrorState ||
              cubit.newsModel!.mainNews!.isEmpty
          ? const Center(child: BodyLargeText("لا يوجد اخبار جديده"))
          : ListView.builder(
              itemBuilder: (context, index) => NewsExpansionTile(
                context: context,
                title:
                    cubit.newsModel!.mainNews![index].title ?? 'لا يوجد عنوان',
                sub: cubit.newsModel!.mainNews![index].sub ?? 'لا يوجد تفاصيل',
                img: cubit.newsModel!.mainNews![index].img!,
              ),
              itemCount: cubit.newsModel!.mainNews!.length,
            ),
    );
  }
}
