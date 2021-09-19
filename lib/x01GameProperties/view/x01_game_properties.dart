import 'package:darts_high_finish_v2/finish/view/finish_view.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:darts_high_finish_v2/x01GameProperties/cubit/x01_game_properties_cubit.dart';
import 'package:darts_high_finish_v2/x01GameProperties/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class X01GamePropertiesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => X01GamePropertiesCubit(),
      child: X01GameProperties(),
    );
  }
}

class X01GameProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TopCubit topCubit = context.read<TopCubit>();
    return TopView(
      child: BlocBuilder<X01GamePropertiesCubit, X01GamePropertiesState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: Theme.of(context).errorColor,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                      child: Padding(
                    padding: EdgeInsets.all(topCubit.state.width * 0.07),
                    child: Container(
                        height: topCubit.state.safeAreaHeight * 0.9 + 2.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular((10.0)),
                            color: Theme.of(context).primaryColor),
                        child: Column(
                          children: [
                            Players(topCubit),
                            Container(
                              color: Theme.of(context).errorColor,
                              height: 0.5,
                            ),
                            StartingPoints(topCubit),
                            Container(
                              color: Theme.of(context).errorColor,
                              height: 0.5,
                            ),
                            SetLegMode(topCubit),
                            Container(
                              color: Theme.of(context).errorColor,
                              height: 0.5,
                            ),
                            LegsPerSet(topCubit),
                            Container(
                              color: Theme.of(context).errorColor,
                              height: 0.5,
                            ),
                            GameLength(topCubit),
                          ],
                        )),
                  )),
                  WayTrainer(topCubit),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}

class WayTrainer extends StatelessWidget {
  TopCubit topCubit;

  WayTrainer(this.topCubit);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(topCubit.state.width * 0.07),
        child: Column(
          children: [...createWidgets(context)],
        ),
      ),
    );
  }

  List<Widget> createWidgets(BuildContext context) {
    List<Widget> l = [];
    X01GamePropertiesState state = context.read<X01GamePropertiesCubit>().state;

    if (state.players.isNotEmpty) {
      l.add(
        Container(
          height: topCubit.state.safeAreaHeight * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            color: Theme.of(context).shadowColor,
          ),
          child: Row(
            children: [
              Container(
                width:
                    (topCubit.state.width - topCubit.state.width * 0.07 * 2) /
                        5 *
                        3,
                child: Center(
                  child: Text(
                    'Player',
                    style: TextStyle(
                        fontSize: topCubit.state.value3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                color: Theme.of(context).errorColor,
                width: 0.5,
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Way Trainer',
                      style: TextStyle(
                          fontSize: topCubit.state.value3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
      l.add(
        Container(
          color: Theme.of(context).errorColor,
          height: 0.5,
        ),
      );

      for (Player p in state.players) {
        l.addAll(createPlayerWidget(p, context));
      }

      l.add(
        Container(
          height: topCubit.state.safeAreaHeight * 0.02,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
        ),
      );

      print(state.players.toString());
      l.add(
        Padding(
          padding: EdgeInsets.only(top: topCubit.state.width * 0.07 * 2),
          child: InkWell(
            onTap: () {
              bool doublesChoosen = true;
              String errorMessage = '';
              for (Player p in state.players) {
                if (p.doublesActivated && (p.d1 == -1 || p.d2 == -1)) {
                  doublesChoosen = false;
                  errorMessage += p.name + ' ';
                }
              }
              if (!doublesChoosen) {
                errorMessage += ': Please select two Doubles';
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Theme.of(context).backgroundColor,
                  content: Text(
                    errorMessage,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ));
              } else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FinishView(
                    legsPerSet: state.legsPerSet,
                    lengthMode: state.lengthMode,
                    matchLength: state.matchLength,
                    mode: state.mode,
                    players: state.players,
                    setLegMode: state.setLegMode,
                  );
                }));
              }
            },
            child: Container(
                height: topCubit.state.safeAreaHeight * 0.1,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Game On',
                    style: TextStyle(
                      fontSize: topCubit.state.value4,
                    ),
                  ),
                )),
          ),
        ),
      );
    }
    return l;
  }

  List<Widget> createPlayerWidget(Player p, BuildContext context) {
    List<Widget> l = [];
    l.add(
      Column(
        children: [
          Container(
            height: topCubit.state.safeAreaHeight * 0.1,
            color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                Container(
                  width:
                      (topCubit.state.width - topCubit.state.width * 0.07 * 2) /
                          5 *
                          3,
                  child: Center(
                    child: Text(
                      p.name,
                      style: TextStyle(
                          fontSize: topCubit.state.value3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  color: Theme.of(context).errorColor,
                  width: 0.5,
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Switch(
                        activeColor: Colors.black,
                        value: p.doublesActivated,
                        onChanged: (value) {
                          p.activateDoubles(value);
                          context.read<X01GamePropertiesCubit>().modifyPlayer();
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          p.doublesActivated ? WaySelector(p, topCubit) : Container()
        ],
      ),
    );
    return l;
  }
}

class WaySelector extends StatelessWidget {
  Player player;
  TopCubit topCubit;
  WaySelector(this.player, this.topCubit);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).shadowColor,
        height: topCubit.state.safeAreaHeight * 0.1,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  player.setDouble(20);
                  context.read<X01GamePropertiesCubit>().modifyPlayer();
                },
                child: Container(
                  color: (player.d1 == 20 || player.d2 == 20)
                      ? Theme.of(context).accentColor
                      : Theme.of(context).shadowColor,
                  child: Center(
                    child: Text('D20'),
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).errorColor,
              width: 0.5,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  player.setDouble(18);
                  context.read<X01GamePropertiesCubit>().modifyPlayer();
                },
                child: Container(
                  color: (player.d1 == 18 || player.d2 == 18)
                      ? Theme.of(context).accentColor
                      : Theme.of(context).shadowColor,
                  child: Center(
                    child: Text('D18'),
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).errorColor,
              width: 0.5,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  player.setDouble(16);
                  context.read<X01GamePropertiesCubit>().modifyPlayer();
                },
                child: Container(
                  color: (player.d1 == 16 || player.d2 == 16)
                      ? Theme.of(context).accentColor
                      : Theme.of(context).shadowColor,
                  child: Center(
                    child: Text('D16'),
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).errorColor,
              width: 0.5,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  player.setDouble(14);
                  context.read<X01GamePropertiesCubit>().modifyPlayer();
                },
                child: Container(
                  color: (player.d1 == 14 || player.d2 == 14)
                      ? Theme.of(context).accentColor
                      : Theme.of(context).shadowColor,
                  child: Center(
                    child: Text('D14'),
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).errorColor,
              width: 0.5,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  player.setDouble(12);
                  context.read<X01GamePropertiesCubit>().modifyPlayer();
                },
                child: Container(
                  color: (player.d1 == 12 || player.d2 == 12)
                      ? Theme.of(context).accentColor
                      : Theme.of(context).shadowColor,
                  child: Center(
                    child: Text('D12'),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class Players extends StatelessWidget {
  final TopCubit topCubit;
  TextEditingController controller = TextEditingController();

  Players(this.topCubit);

  @override
  Widget build(BuildContext context) {
    X01GamePropertiesState state = context.read<X01GamePropertiesCubit>().state;

    List<Player> players = state.players;

    List<Widget> names = [];

    for (Player player in players) {
      names.add(createNameWidget(player, context));
    }

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        height: topCubit.state.safeAreaHeight * 0.1 * 4,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                ),
              ),
              width: topCubit.state.width * 0.35,
              child: Center(
                child: Text(
                  'Players',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: topCubit.state.value3,
                      color: Theme.of(context).errorColor),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).errorColor,
              width: 0.5,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).shadowColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: Column(children: [
                  ...names,
                  names.length < 4
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).accentColor),
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext c) {
                                      TextEditingController controller =
                                          TextEditingController();
                                      BoolObject guest = BoolObject(true);
                                      return AlertDialog(
                                          title: Text('Add Player'),
                                          actions: [
                                            IconButton(
                                              icon:
                                                  Icon(Icons.add_task_rounded),
                                              onPressed: () {
                                                print(guest.b);
                                                context
                                                    .read<
                                                        X01GamePropertiesCubit>()
                                                    .addPlayer(Player(!guest.b,
                                                        controller.text));

                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                          content: PlayerAlertDialogContent(
                                              controller: controller,
                                              guest: guest));
                                    });
                              },
                            ),
                          ),
                        )
                      : Container()
                ]),
              ),
            )
          ],
        ));
  }

  Widget createNameWidget(Player player, BuildContext context) {
    return Container(
      height: topCubit.state.safeAreaHeight * 0.1,
      width: topCubit.state.width * 0.4,
      child: Row(
        children: [
          player.profile
              ? Container(
                  width: topCubit.state.width * 0.05,
                  child: Icon(Icons.account_circle_rounded))
              : Container(),
          Expanded(
            child: Align(
                alignment: Alignment.centerRight, child: Text(player.name)),
          ),
          InkWell(
            onTap: () {
              print('onpressed called');
              context.read<X01GamePropertiesCubit>().removePlayer(player);
            },
            child: Container(
              width: topCubit.state.width * 0.1,
              child: Icon(Icons.highlight_remove),
            ),
          )
        ],
      ),
    );
  }
}

class BoolObject {
  bool b;
  BoolObject(this.b);
  void setTrue() => b = true;
  void setFalse() => b = false;
}

class PlayerAlertDialogContent extends StatefulWidget {
  TextEditingController controller;
  BoolObject guest;

  PlayerAlertDialogContent({required this.controller, required this.guest});

  @override
  _PlayerAlertDialogContentState createState() =>
      _PlayerAlertDialogContentState();
}

class _PlayerAlertDialogContentState extends State<PlayerAlertDialogContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TopCubit topCubit = context.read<TopCubit>();
    return Container(
      height: topCubit.state.safeAreaHeight * 0.2,
      child: Column(
        children: [
          RadioListTile(
            title: widget.guest.b
                ? TextField(controller: widget.controller)
                : Text('Guest Player'),
            activeColor: Theme.of(context).primaryColor,
            groupValue: widget.guest.b,
            value: true,
            onChanged: (bool? i) {
              setState(() {
                widget.guest.setTrue();
              });
            },
          ),
          RadioListTile(
            title: Text('Profile'),
            activeColor: Theme.of(context).primaryColor,
            groupValue: widget.guest.b,
            value: false,
            onChanged: (bool? i) {
              setState(() {
                widget.guest.setFalse();
              });
            },
          ),
        ],
      ),
    );
  }
}

class StartingPoints extends StatelessWidget {
  final TopCubit topCubit;

  const StartingPoints(this.topCubit);

  @override
  Widget build(BuildContext context) {
    X01GamePropertiesState state = context.read<X01GamePropertiesCubit>().state;
    String mode = state.gameMode;
    return Container(
      color: Theme.of(context).primaryColor,
      height: topCubit.state.safeAreaHeight * 0.1,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
              ),
            ),
            width: topCubit.state.width * 0.35,
            child: Center(
              child: Text(
                'Starting Points',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: topCubit.state.value3,
                    color: Theme.of(context).errorColor),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).errorColor,
            width: 0.5,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext c) {
                      StringObject modeString = StringObject(state.mode);
                      return AlertDialog(
                          title: Text('Select Start Score'),
                          actions: [
                            IconButton(
                              icon: Icon(Icons.add_task_rounded),
                              onPressed: () {
                                context
                                    .read<X01GamePropertiesCubit>()
                                    .setMode(modeString.mode);

                                Navigator.pop(context);
                              },
                            ),
                          ],
                          content: GameModeAlertDialogContent(
                              mode: modeString, topCubit: topCubit));
                    });
              },
              child: Container(
                color: Theme.of(context).shadowColor,
                child: Center(
                  child: Text(mode,
                      style: TextStyle(
                          fontSize: topCubit.state.value3,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GameModeAlertDialogContent extends StatefulWidget {
  StringObject mode;
  TopCubit topCubit;

  GameModeAlertDialogContent({required this.mode, required this.topCubit});

  @override
  _GameModeAlertDialogContentState createState() =>
      _GameModeAlertDialogContentState();
}

class _GameModeAlertDialogContentState
    extends State<GameModeAlertDialogContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(children: createRadioButtons(context))));
  }

  List<Widget> createRadioButtons(BuildContext context) {
    List<Widget> l = [];

    l.add(RadioListTile(
        activeColor: Theme.of(context).primaryColor,
        title: Text('100-170'),
        value: '100-170',
        groupValue: widget.mode.mode,
        onChanged: (String? s) {
          setState(() {
            widget.mode.setValue(s!);
          });
        }));

    l.add(RadioListTile(
        activeColor: Theme.of(context).primaryColor,
        title: Text('170-301'),
        value: '170-301',
        groupValue: widget.mode.mode,
        onChanged: (String? s) {
          setState(() {
            widget.mode.setValue(s!);
          });
        }));

    int i = 301;

    while (i < 1101) {
      l.add(RadioListTile(
          activeColor: Theme.of(context).primaryColor,
          title: Text(i.toString()),
          value: i.toString(),
          groupValue: widget.mode.mode,
          onChanged: (String? s) {
            setState(() {
              widget.mode.setValue(s!);
            });
          }));
      i += 100;
    }
    return l;
  }
}

class StringObject {
  String mode;

  StringObject(this.mode);

  void setValue(String s) => mode = s;
}

class SetLegMode extends StatelessWidget {
  final TopCubit topCubit;

  const SetLegMode(this.topCubit);

  @override
  Widget build(BuildContext context) {
    X01GamePropertiesState state = context.read<X01GamePropertiesCubit>().state;
    return Container(
      color: Theme.of(context).primaryColor,
      height: topCubit.state.safeAreaHeight * 0.1,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
              ),
            ),
            width: topCubit.state.width * 0.35,
            child: Center(
              child: Text(
                'Game Mode',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: topCubit.state.value3,
                    color: Theme.of(context).errorColor),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).errorColor,
            width: 0.5,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                        onTap: () {
                          context
                              .read<X01GamePropertiesCubit>()
                              .setSetLegMode(true);
                        },
                        child: Container(
                            height: topCubit.state.safeAreaHeight * 0.1,
                            child: Center(
                                child: Text('Legs',
                                    style: TextStyle(
                                        fontSize: topCubit.state.value3))),
                            color: state.setLegMode
                                ? Theme.of(context).accentColor
                                : Theme.of(context).shadowColor))),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          context
                              .read<X01GamePropertiesCubit>()
                              .setSetLegMode(false);
                        },
                        child: Container(
                            height: topCubit.state.safeAreaHeight * 0.1,
                            child: Center(
                                child: Text('Sets',
                                    style: TextStyle(
                                        fontSize: topCubit.state.value3))),
                            color: !state.setLegMode
                                ? Theme.of(context).accentColor
                                : Theme.of(context).shadowColor))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LegsPerSet extends StatelessWidget {
  final TopCubit topCubit;

  const LegsPerSet(this.topCubit);

  @override
  Widget build(BuildContext context) {
    X01GamePropertiesState state = context.read<X01GamePropertiesCubit>().state;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      height: topCubit.state.safeAreaHeight * 0.1,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
              ),
            ),
            width: topCubit.state.width * 0.35,
            child: Center(
              child: Text(
                'Legs per Set',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: topCubit.state.value3,
                    color: Theme.of(context).errorColor),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).errorColor,
            width: 0.5,
          ),
          Expanded(
            child: Container(
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext c) {
                        IntObject modeInt = IntObject(state.legsPerSet);
                        return AlertDialog(
                            title: Text('Legs per set'),
                            actions: [
                              IconButton(
                                icon: Icon(Icons.add_task_rounded),
                                onPressed: () {
                                  context
                                      .read<X01GamePropertiesCubit>()
                                      .setLegsPerSet(modeInt.value);

                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            content: LegsPerSetDialogContent(
                                mode: modeInt, topCubit: topCubit));
                      });
                },
                child: Container(
                  color: Theme.of(context).shadowColor,
                  child: Center(
                    child: Text('First to ' + state.legsPerSet.toString(),
                        style: TextStyle(
                            fontSize: topCubit.state.value3,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LegsPerSetDialogContent extends StatefulWidget {
  IntObject mode;
  TopCubit topCubit;

  LegsPerSetDialogContent({required this.mode, required this.topCubit});

  @override
  _LegsPerSetDialogContentState createState() =>
      _LegsPerSetDialogContentState();
}

class _LegsPerSetDialogContentState extends State<LegsPerSetDialogContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            child: Column(children: createRadioButtons(context))));
  }

  List<Widget> createRadioButtons(BuildContext context) {
    List<Widget> l = [];

    int i = 2;

    while (i < 6) {
      l.add(RadioListTile(
          activeColor: Theme.of(context).primaryColor,
          title: Text('First to ' + i.toString()),
          value: i,
          groupValue: widget.mode.value,
          onChanged: (int? i) {
            setState(() {
              widget.mode.setValue(i!);
            });
          }));
      i += 1;
    }
    return l;
  }
}

class IntObject {
  int value;

  IntObject(this.value);

  void setValue(int v) => value = v;
}

class GameLength extends StatelessWidget {
  final TopCubit topCubit;

  GameLength(this.topCubit);

  @override
  Widget build(BuildContext context) {
    X01GamePropertiesState state = context.read<X01GamePropertiesCubit>().state;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      height: topCubit.state.safeAreaHeight * 0.2,
      child: Row(
        children: [
          Container(
            width: topCubit.state.width * 0.35,
            child: Center(
              child: Text(
                'Match length',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: topCubit.state.value3,
                    color: Theme.of(context).errorColor),
              ),
            ),
          ),
          Container(
            color: Theme.of(context).errorColor,
            width: 0.5,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Theme.of(context).shadowColor,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext c) {
                            StringObject mode = StringObject(state.lengthMode);
                            return AlertDialog(
                                title: Text('Length'),
                                actions: [
                                  IconButton(
                                    icon: Icon(Icons.add_task_rounded),
                                    onPressed: () {
                                      context
                                          .read<X01GamePropertiesCubit>()
                                          .setLengthMode(mode.mode);

                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                                content: LengthModeDialogContent(mode: mode));
                          });
                    },
                    child: Container(
                      color: Theme.of(context).shadowColor,
                      child: Center(
                        child: Text(state.lengthMode,
                            style: TextStyle(
                                fontSize: topCubit.state.value3,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                )),
                Container(
                  color: Theme.of(context).errorColor,
                  height: 0.5,
                ),
                Container(
                  height: topCubit.state.safeAreaHeight * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Theme.of(context).shadowColor),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(topCubit.state.value1),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<X01GamePropertiesCubit>()
                                .decrementMatchLength();
                          },
                          child: Container(
                            width: topCubit.state.width * 0.07,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                '-',
                                style:
                                    TextStyle(fontSize: topCubit.state.value4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            state.matchLength.toString() +
                                ' ' +
                                (state.setLegMode ? 'Legs' : 'Sets'),
                            style: TextStyle(
                                fontSize: topCubit.state.value3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(topCubit.state.value1),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<X01GamePropertiesCubit>()
                                .incrementMatchLength();
                          },
                          child: Container(
                            width: topCubit.state.width * 0.07,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                '+',
                                style:
                                    TextStyle(fontSize: topCubit.state.value4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LengthModeDialogContent extends StatefulWidget {
  StringObject mode;

  LengthModeDialogContent({required this.mode});

  @override
  _LengthModeDialogContentState createState() =>
      _LengthModeDialogContentState();
}

class _LengthModeDialogContentState extends State<LengthModeDialogContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TopCubit topCubit = context.read<TopCubit>();
    return Container(
      height: topCubit.state.safeAreaHeight * 0.3,
      child: Column(
        children: [
          RadioListTile(
            title: Text('Unlimited'),
            activeColor: Theme.of(context).primaryColor,
            groupValue: widget.mode.mode,
            value: 'Unlimited',
            onChanged: (String? s) {
              setState(() {
                widget.mode.setValue(s!);
              });
            },
          ),
          RadioListTile(
            title: Text('First To'),
            activeColor: Theme.of(context).primaryColor,
            groupValue: widget.mode.mode,
            value: 'First To',
            onChanged: (String? s) {
              setState(() {
                widget.mode.setValue(s!);
              });
            },
          ),
          RadioListTile(
            title: Text('Best of'),
            activeColor: Theme.of(context).primaryColor,
            groupValue: widget.mode.mode,
            value: 'Best of',
            onChanged: (String? s) {
              setState(() {
                widget.mode.setValue(s!);
              });
            },
          ),
        ],
      ),
    );
  }
}
