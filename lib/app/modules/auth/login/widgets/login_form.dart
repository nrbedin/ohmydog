part of '../login_page.dart';



class _LoginForm extends StatefulWidget {

  const _LoginForm({ super.key });

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<_LoginForm, LoginController> {
  final formKey = GlobalKey<FormState>();
  final loginEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    loginEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }
   @override
   Widget build(BuildContext context) {
       return Form(
        key: formKey,
        child: Column(
          children: [
            GlobalTextFormField(
              labelText: 'Login',
              controller: loginEC,
              validator: Validatorless.multiple([
                Validatorless.required('Login obrigatório'),
                Validatorless.email('E-mail inválido')
              ]),
              ),
            
            const SizedBox(
              height: 20,
            ),
            GlobalTextFormField(
              labelText: 'Senha', 
              obscureText: true,
              controller: passwordEC,
              validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatória'),
                Validatorless.min(6, 'Senha deve conter no mínimo 6 caracteres'),
              ]),
              ),
              const SizedBox(
              height: 20,
            ),
            ButtonDefault(
              label: 'Entrar', 
              onPressed: ()async{
                final formValid = formKey.currentState?.validate() ?? false;
                if (formValid) {
                await  controller.login(loginEC.text, passwordEC.text);
                }
                Messages.alert('Mensagem de erro');
              },
            ),
          ],
        ));
  }
}