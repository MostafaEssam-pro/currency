import 'package:currency/bloc/currency_cubit.dart';
import 'package:currency/view/currency_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => CurrencyCubit())
      ],
      child: MaterialApp(
        home: CurrencyView(),
      ),
    );
  }
}
