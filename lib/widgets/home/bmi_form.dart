import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/calculate/calculate_bloc.dart';
import '../../config.dart';
import '../../constants.dart';

class BmiForm extends StatefulWidget {
  final bool isMetric;

  const BmiForm({Key? key, required this.isMetric}) : super(key: key);

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const Key(weightKey),
            controller: weightController,
            validator: _validator,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            ],
            decoration: InputDecoration(
              labelText: weightTitle +
                  ' ' +
                  (widget.isMetric ? weightMetric : weightImperial),
            ),
          ),
          TextFormField(
            key: const Key(heightKey),
            controller: heightController,
            validator: _validator,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: false,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
            ],
            decoration: InputDecoration(
              labelText: heightTitle +
                  ' ' +
                  (widget.isMetric ? heightMetric : heightImperial),
            ),
          ),
          const SizedBox(
            height: paddingDefault,
          ),
          ElevatedButton(
            key: const Key(submitKey),
            onPressed: () => _submit(),
            child: const Text(submitText),
          ),
        ],
      ),
    );
  }

  String? _validator(String? value) {
    if (value!.isEmpty) {
      return emptyError;
    } else if ('.'.allMatches(value).length > 1) {
      return dotsError;
    }
    return null;
  }

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      final double weight = double.parse(weightController.text);
      final double height = double.parse(heightController.text);

      BlocProvider.of<CalculateBloc>(context).add(
        CalculateBmi(weight: weight, height: height, isMetric: widget.isMetric),
      );
    }
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }
}
