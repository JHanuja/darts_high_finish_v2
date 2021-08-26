import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/darts_needed_cubit.dart';
import 'package:darts_high_finish_v2/finish/cubit/score_entered_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        return Container(
          height: context.read<TopCubit>().state.safeAreaHeight * 0.8,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black26),
                height: context.read<TopCubit>().state.safeAreaHeight * 0.1,
                child: Row(
                  children: [
                    Container(
                      width: context.read<TopCubit>().state.width * 0.8,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            context.read<TopCubit>().state.width * 0.1,
                            0.0,
                            0.0,
                            0.0),
                        child: Text(
                          'Darts Needed',
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value3),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        state.dartsNeeded.toString(),
                        style: TextStyle(
                            fontSize: context.read<TopCubit>().state.value3),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.black26),
                height: context.read<TopCubit>().state.safeAreaHeight * 0.1,
                child: Row(
                  children: [
                    Container(
                      width: context.read<TopCubit>().state.width * 0.8,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            context.read<TopCubit>().state.width * 0.1,
                            0.0,
                            0.0,
                            0.0),
                        child: Text(
                          'Average',
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value3),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        state.average.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: context.read<TopCubit>().state.value3),
                      ),
                    )
                  ],
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
}

class ScoreEnterer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.read<TopCubit>().state.safeAreaHeight * 0.1,
          child: Row(
            children: [
              Container(
                width: context.read<TopCubit>().state.width * 0.7,
                color: Colors.white,
                child: Center(
                  child: BlocBuilder<ScoreEnteredCubit, String>(
                    builder: (context, state) {
                      return Text(
                        state,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: context.read<TopCubit>().state.value3*1.5,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: IconButton(
                      onPressed:() =>  context.read<FinishBloc>().add(ScoreReset()),
                      icon: Icon(Icons.restart_alt),
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
              height: context.read<TopCubit>().state.safeAreaHeight * 0.4,
              width: context.read<TopCubit>().state.width * 0.7,
              color: Colors.black26,
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
                                    color: Colors.red,
                                    child: Center(
                                        child: Text(
                                      'C',
                                      style: TextStyle(
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
                                    color: Colors.green,
                                    child: Center(
                                        child: Text(
                                      'OK',
                                      style: TextStyle(
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
                    height: context.read<TopCubit>().state.safeAreaHeight * 0.4,
                    width: context.read<TopCubit>().state.width * 0.3,
                    color: Colors.black12,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text('Needed'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap:
                                context.read<DartsNeededCubit>().oneDartNeeded,
                            child: Container(
                              child: Center(
                                child: Text('1',
                                    style: TextStyle(
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
                            onTap:
                                context.read<DartsNeededCubit>().twoDartsNeeded,
                            child: Container(
                              child: Center(
                                child: Text('2',
                                    style: TextStyle(
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
