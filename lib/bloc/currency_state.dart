part of 'currency_cubit.dart';

@immutable
abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}


class CurrencyGetSuccessState extends CurrencyState{}
class CurrencyGetLoadingState extends CurrencyState{}
class CurrencyGetErrorState extends CurrencyState{}
