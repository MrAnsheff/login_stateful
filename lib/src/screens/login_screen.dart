import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
    createState() {
      // TODO: implement createState
      return LoginScreenState();
    }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{

  final keyForm = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(padding: EdgeInsets.only(top: 25.0),),
            submitButton(),
          ],
        )
      ),
    );

  }

  Widget emailField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Enter your E-mail:',
        hintText: 'your@e-mail.com',
      ),
      validator: validateEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value){
        password = value;
      },
    );

  }

  Widget submitButton(){
    return RaisedButton(
      color: Colors.lightBlue,
      onPressed: (){
        if(keyForm.currentState.validate()){
          keyForm.currentState.save();

          print('Your email:$email, and password:$password!');
        };
      },
      child: Text('Press me!'),
    );

  }


}