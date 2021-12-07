import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        }

        return null;
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RangeSelectorTextFormField(
                  labelText: 'Minimum',
                  intValueSetter: minValueSetter,
                ),
                const SizedBox(height: 12),
                RangeSelectorTextFormField(
                  labelText: 'Maximum',
                  intValueSetter: maxValueSetter,
                ),
              ],
            )));
  }
}
