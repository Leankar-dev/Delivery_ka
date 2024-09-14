import 'package:delivery_ka/app/core/ui/base_state/base_state.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_appbar.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_button.dart';
import 'package:delivery_ka/app/pages/auth/register/register_controller.dart';
import 'package:delivery_ka/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  // para usar os controladores tem que ser StatefulWidget
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader,
          error: () {
            showError('Erro ao registrar usuaario.');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryKaAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: DeliveryKaTextStyles.textTitle,
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style:
                        DeliveryKaTextStyles.textmedium.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: Validatorless.required('Nome Obrigatorio.'),
                    controller: _nameEC,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatorio.'),
                      Validatorless.email('E-mail invalido.'),
                    ]),
                    controller: _emailEC,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('PassWord obrigatorio.'),
                      Validatorless.min(
                          6, 'Password deve conter no minimo 6 caracateres.'),
                    ]),
                    controller: _passwordEC,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Confirma Password'),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma PassWord obrigatorio.'),
                      Validatorless.compare(_passwordEC,
                          'Password diferente de Confirma Password'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: DeliveryKaButton(
                      label: 'Cadastrar',
                      color: DeliveryKaColors.whiteColor,
                      width: double.infinity,
                      onPressed: () {
                        final valid =
                            _formKey.currentState?.validate() ?? false;
                        if (valid) {
                          controller.register(
                              _nameEC.text, _emailEC.text, _passwordEC.text);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
