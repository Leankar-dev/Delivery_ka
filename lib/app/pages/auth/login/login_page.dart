import 'package:delivery_ka/app/core/ui/base_state/base_state.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_colors.dart';
import 'package:delivery_ka/app/core/ui/styles/delivery_ka_text_styles.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_appbar.dart';
import 'package:delivery_ka/app/core/ui/widgets/delivery_ka_button.dart';
import 'package:delivery_ka/app/pages/auth/login/login_controller.dart';
import 'package:delivery_ka/app/pages/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final _emailEC = TextEditingController();
  final _passwrodEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwrodEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          login: () => showLoader(),
          loginError: () {
            hideLoader();
            showError('Login ou  Password invalidos.');
          },
          error: () {
            hideLoader();
            showError('Erro ao realizar login.');
          },
          success: () {
            hideLoader();
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryKaAppbar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: DeliveryKaTextStyles.textTitle,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                        controller: _emailEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail obrigatorio.'),
                          Validatorless.email('E-mail invalido.'),
                        ]),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        controller: _passwrodEC,
                        validator: Validatorless.multiple([
                          Validatorless.required('Password obrigatorio.'),
                        ]),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Center(
                        child: DeliveryKaButton(
                          width: double.infinity,
                          label: 'ENTRAR',
                          color: DeliveryKaColors.whiteColor,
                          onPressed: () {
                            // fazer a validação
                            final valid =
                                _formKey.currentState?.validate() ?? false;

                            if (valid) {
                              controller.login(_emailEC.text, _passwrodEC.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não possui uma conta?',
                        style: DeliveryKaTextStyles.textBold,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/auth/register');
                        },
                        child: Text(
                          'CADASTRE-SE',
                          style: DeliveryKaTextStyles.textBold
                              .copyWith(color: DeliveryKaColors.blueColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
