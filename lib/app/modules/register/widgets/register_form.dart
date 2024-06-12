part of '../register_page.dart';
class RegisterForm extends StatelessWidget {

  const RegisterForm({ super.key });

   @override
   Widget build(BuildContext context) {
       return Form(
        child: Column(
          children: [
            GlobalTextFormField(labelText: 'Login'),
            const SizedBox(
               height: 20,
            ),
            GlobalTextFormField(labelText: 'Senha',obscureText: true,),
            const SizedBox(
             height: 20,
            ),
            GlobalTextFormField(labelText: 'Confirma Senha', obscureText: true,),
            const SizedBox(
              height: 20,
            ),
            const ButtonDefault(label: 'Cadastrar',color: Colors.orange),

          ],
        ));
  }
}