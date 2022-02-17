import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:currency/model/currency.dart';
import 'package:currency/service/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(CurrencyInitial());
  static CurrencyCubit get(context) => BlocProvider.of(context);
  Currency? currency;

  getCurrency(String from, double amount, String to) {
    DioHelper.getData(query: {'from': from, 'amount': amount, 'to': to})
        .then((value) {
      emit(CurrencyGetLoadingState());
      currency = Currency.fromJson(value.data);
      emit(CurrencyGetSuccessState());
    }).catchError((error) {
      print('error');
      print(error.toString());
      emit(CurrencyGetErrorState());
    });
  }
}
