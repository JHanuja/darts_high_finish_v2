import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/darts_needed_cubit.dart';
import 'package:darts_high_finish_v2/finish/cubit/score_entered_cubit.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:darts_high_finish_v2/theme/cubit/theme_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        return Container(
          height: context.read<TopCubit>().state.safeAreaHeight * 0.7,
          child: Column(
            children: [
              Container(
                height: context.read<TopCubit>().state.safeAreaHeight * 0.1,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  children: createAverageWidget(
                      context.read<FinishBloc>().finishes, context),
                ),
              ),
              Container(
                height: context.read<TopCubit>().state.safeAreaHeight * 0.5,
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => ScoreEnteredCubit(),
                    ),
                    BlocProvider(
                      create: (context) => DartsNeededCubit(),
                    ),
                  ],
                  child: ScoreEnterer(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> createAverageWidget(
      List<Finish> finishes, BuildContext context) {
    List<Widget> l = [];

    if (finishes.length <= 2) {
      for (int i = 0; i < finishes.length; i++) {
        String avMatchString = (finishes[i].average != -1)
            ? finishes[i].average.toStringAsFixed(0)
            : '-';
        String avLegString = (finishes[i].averageLeg != -1)
            ? finishes[i].averageLeg.toStringAsFixed(0)
            : '-';
        l.add(
          Expanded(
            child: Container(
              child: Center(
                  child: Text(
                'Match: ' + avMatchString + '   Leg: ' + avLegString,
                style: TextStyle(
                    color: Theme.of(context).backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: context.read<TopCubit>().state.value2 * 1.2),
              )),
            ),
          ),
        );
        if (i == 0 && finishes.length > 1) {
          l.add(Container(
            color: Theme.of(context).hoverColor,
            width: 2.0,
          ));
        }
      }
    }

    return l;
  }
}

class ScoreEnterer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.read<TopCubit>().state.safeAreaHeight * 0.15,
          color: Theme.of(context).backgroundColor,
          child: Row(
            children: [
              Container(
                height: context.read<TopCubit>().state.safeAreaHeight * 0.15,
                width: context.read<TopCubit>().state.width * 0.7,
                child: Padding(
                  padding: EdgeInsets.all(
                    context.read<TopCubit>().state.width * 0.06,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: BlocBuilder<ScoreEnteredCubit, String>(
                        builder: (context, state) {
                          return Text(
                            state,
                            style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontSize:
                                  context.read<TopCubit>().state.value3 * 1.5,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(
                    context.read<TopCubit>().state.width * 0.07,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () =>
                            context.read<FinishBloc>().add(ScoreReset()),
                        icon: Icon(
                          Icons.restart_alt,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.35,
              width: context.read<TopCubit>().state.width * 0.7,
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append1,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '1',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append2,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '2',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append3,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '3',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append4,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '4',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append5,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '5',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append6,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '6',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append7,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '7',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append8,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '8',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append9,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      '9',
                                      style: TextStyle(
                                          color: Theme.of(context).cardColor,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value4),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().clear,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).buttonColor,
                                    ),
                                    child: Center(
                                        child: Text(
                                      'C',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value3),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap:
                                      context.read<ScoreEnteredCubit>().append0,
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        '0',
                                        style: TextStyle(
                                            color: Theme.of(context).cardColor,
                                            fontSize: context
                                                .read<TopCubit>()
                                                .state
                                                .value4),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.read<FinishBloc>().add(ScoreEntered(
                                        dartsNeeded: context
                                            .read<DartsNeededCubit>()
                                            .state,
                                        score: int.parse(context
                                            .read<ScoreEnteredCubit>()
                                            .state)));
                                    context.read<ScoreEnteredCubit>().clear();
                                    context
                                        .read<DartsNeededCubit>()
                                        .threeDartsNeeded();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    child: Center(
                                        child: Text(
                                      'OK',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value3),
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<DartsNeededCubit, int>(
                builder: (context, state) {
                  return Container(
                    height:
                        context.read<TopCubit>().state.safeAreaHeight * 0.35,
                    width: context.read<TopCubit>().state.width * 0.3,
                    child: Padding(
                      padding: EdgeInsets.all(
                        context.read<TopCubit>().state.width * 0.05,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(45.0))),
                        child: Column(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: context
                                    .read<DartsNeededCubit>()
                                    .oneDartNeeded,
                                child: Container(
                                  child: Center(
                                    child: Text('1',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            fontSize: (state) == 1
                                                ? context
                                                        .read<TopCubit>()
                                                        .state
                                                        .value3 *
                                                    1.5
                                                : context
                                                        .read<TopCubit>()
                                                        .state
                                                        .value1 *
                                                    1.5)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: context
                                    .read<DartsNeededCubit>()
                                    .twoDartsNeeded,
                                child: Container(
                                  child: Center(
                                    child: Text('2',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            fontSize: (state) == 2
                                                ? context
                                                        .read<TopCubit>()
                                                        .state
                                                        .value3 *
                                                    1.5
                                                : context
                                                        .read<TopCubit>()
                                                        .state
                                                        .value1 *
                                                    1.5)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: context
                                    .read<DartsNeededCubit>()
                                    .threeDartsNeeded,
                                child: Container(
                                  child: Center(
                                    child: Text('3',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            fontSize: (state) == 3
                                                ? context
                                                        .read<TopCubit>()
                                                        .state
                                                        .value3 *
                                                    1.5
                                                : context
                                                        .read<TopCubit>()
                                                        .state
                                                        .value1 *
                                                    1.5)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
