import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/home/home_cubit.dart';
import 'package:kfahi/screens/home/home_state.dart';

import '../components/components.dart';
import '../constants/custom_texts.dart';
import '../generated/l10n.dart';

class InitiativesLayout extends StatelessWidget {
  const InitiativesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return cubit.initiativesModel == null ||
                state is GetInitiativesErrorState ||
                cubit.initiativesModel!.initiatives!.isEmpty
            ? Center(
                child: BodyMediumText(
                S.of(context).no_initiatives_available,
                maxLines: 2,
                textAlign: TextAlign.center,
              ))
            : state is GetInitiativesLoadingState
                ? AppLoadingIndicator(context: context)
                : state is GetInitiativesSuccessState ||
                        cubit.initiativesModel != null
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          cubit.initVideoController(
                              videoId: cubit.initiativesModel!
                                  .initiatives![index].vidId!);
                          return InitiativesExpansionTile(
                            context: context,
                            sub: cubit.initiativesModel?.initiatives?[index]
                                    .sub ??
                                '',
                            title: cubit.initiativesModel?.initiatives?[index]
                                    .title ??
                                '',
                            videoId: cubit
                                .initiativesModel?.initiatives?[index].vidId,
                            controller: cubit.youtubePlayerController,
                            task: cubit
                                .initiativesModel?.initiatives?[index].task,
                            onExpansionChanged: (value) {},
                          );
                        },
                        itemCount: cubit.initiativesModel?.initiatives!.length,
                      ).p4
                    : Container();
      },
    );
  }
}
