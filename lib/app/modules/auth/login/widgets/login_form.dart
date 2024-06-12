part of '../login_page.dart';



class _LoginForm extends StatefulWidget {

  const _LoginForm({ super.key });

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
   @override
   Widget build(BuildContext context) {
       return Form(
        child: Column(
          children: [
            GlobalTextFormField(labelText: 'Login'),
            const SizedBox(
              height: 20,
            ),
            GlobalTextFormField(labelText: 'Senha'),
              const SizedBox(
              height: 20,
            ),
            ButtonDefault(
              label: 'Entrar', 
              onPressed: (){},
            ),
          ],
        ));
  }
}