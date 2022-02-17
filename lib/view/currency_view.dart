import 'package:currency/bloc/currency_cubit.dart';
import 'package:currency/constant/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  var numberController = TextEditingController();
  String? dropdownValueFrom;
  String? dropdownValueTo;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = CurrencyCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Change currency'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Currency From'),
                CustomDropdownButton(
                  hint: '-- From --',
                  nameFiled: dropdownValueFrom,
                  onChanged: (selected) {
                    setState(() {
                      dropdownValueFrom = selected!;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Currency TO'),
                CustomDropdownButton(
                  hint: '-- TO --',
                  nameFiled: dropdownValueTo,
                  onChanged: (selected) {
                    setState(() {
                      dropdownValueTo = selected!;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: numberController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'number',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    cubit.getCurrency(
                        dropdownValueFrom.toString(),
                        double.parse(numberController.text),
                        dropdownValueTo.toString()),
                  },
                  child: Text('Click me'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cubit.currency?.result == null
                      ? '0'
                      : cubit.currency!.result.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
