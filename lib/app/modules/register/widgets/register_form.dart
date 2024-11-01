part of '../register_page.dart';
class RegisterForm extends StatefulWidget {

  const RegisterForm({ super.key });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends  ModularState<RegisterForm, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC =  TextEditingController();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
   
    super.dispose();
  }
   @override
   Widget build(BuildContext context) {
       return Form(
        key: _formKey,
        child: Column(
          children: [
            GlobalTextFormField(
              labelText: 'Login',
               controller: _loginEC,
               validator: Validatorless.multiple([
                Validatorless.required('Login obrigatório'),
                Validatorless.email('Login deve ser um e-amil válido'),
               ]),
               ),
            const SizedBox(
               height: 20,
            ),
            GlobalTextFormField(
              labelText: 'Senha',
              obscureText: true,
              controller: _passwordEC,
                validator: Validatorless.multiple([
                Validatorless.required('Senha obrigatório'),
                Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres'),
               ]),
              ),
            const SizedBox(
             height: 20,
            ),
            GlobalTextFormField(
              labelText: 'Confirma Senha', 
              obscureText: true,
  validator: Validatorless.multiple([
                Validatorless.required('Confirma senha obrigatório'),
                Validatorless.min(6, 'Confirma senha precisa ter pelo menos 6 caracteres'),
                Validatorless.compare(_passwordEC, 'Senha e confirma senha não são iguais')
               ]),
            ),
            const SizedBox(
              height: 20,
            ),
             ButtonDefault(
              label: 'Cadastrar',
          
              onPressed: () {
                final formValid = _formKey.currentState?.validate() ?? false;
                if(formValid){
                  controller.register(email: _loginEC.text, password: _passwordEC.text);
                }                
                },
              ),

          ],
        ));
  }
}