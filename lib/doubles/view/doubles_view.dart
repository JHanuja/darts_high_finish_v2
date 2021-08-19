import 'package:darts_high_finish_v2/doubles/cubit/doubles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoublesPage extends StatelessWidget {
  const DoublesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DoublesCubit(),
      child: DoublesView(),
    );
  }
}

class DoublesView extends StatelessWidget {
  const DoublesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: DoubleButtonGroup(
            buttonGroup: true,
          )),
          Expanded(
              child: DoubleButtonGroup(
            buttonGroup: false,
          ))
        ],
      ),
    );
  }
}

class DoubleButtonGroup extends StatelessWidget {
  final bool buttonGroup;

  const DoubleButtonGroup({Key? key, required this.buttonGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoublesCubit, DoublesState>(builder: (context, state) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 20)
                  : context.read<DoublesCubit>().chooseDouble(d2: 20);
            },
            style: ButtonStyle(
              backgroundColor: (state.d1 == 20 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 20 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D20'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 18)
                  : context.read<DoublesCubit>().chooseDouble(d2: 18);
            },
            style: ButtonStyle(
              backgroundColor: (state.d1 == 18 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 18 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D18'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1:16)
                  : context.read<DoublesCubit>().chooseDouble(d2: 16);
            },
            style: ButtonStyle(
              backgroundColor: (state.d1 == 16 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 16 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D16'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 14)
                  : context.read<DoublesCubit>().chooseDouble(d2: 14);
            },
            style: ButtonStyle(
              backgroundColor: (state.d1 == 14 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 14 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D14'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 12)
                  : context.read<DoublesCubit>().chooseDouble(d2: 12);
            },
            style: ButtonStyle(
              backgroundColor: (state.d1 == 12 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 12 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D12'),
          ),
        ],
      );
    });
  }
}
