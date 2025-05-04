import 'package:flutter/material.dart';
import 'package:flutter_app/atoms/styled_button.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/route_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  _handleSubmit() {
    if (!_formKey.currentState!.saveAndValidate()) {
      return;
    }

    final formData = _formKey.currentState!.value;

    logger.i('Form data: $formData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16.0,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Please enter your credentials to login.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16.0),
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Username',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    FormBuilderTextField(
                      name: 'username',
                      decoration: const InputDecoration(
                        helperText: 'Email or username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(3),
                      ]),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(
                        helperText: 'At least 6 characters',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    const SizedBox(height: 16.0),
                    StyledButton(
                      child: Text('Login'),
                      onPressed: _handleSubmit,
                      size: ButtonSize.large,
                    ).build(context),
                    SizedBox(height: 32.0),
                    StyledButton(
                      child: Text('Register'),
                      onPressed: () {
                        Get.toNamed('/auth/register');
                      },
                      size: ButtonSize.large,
                      type: ButtonType.secondary,
                    ).build(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
