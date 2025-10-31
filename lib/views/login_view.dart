import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_proj/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
 late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();// TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
   _email.dispose();
   _password.dispose(); // TODO: implement dispose
    super.dispose();
  }
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          ),
          
          body: FutureBuilder(
            future: Firebase.initializeApp(
                    options: DefaultFirebaseOptions.currentPlatform
                  ),
            builder: (context, snapshot) {
              switch(snapshot.connectionState) {
              
                case ConnectionState.done:
                  // TODO: Handle this case.
                  return Column(
              children: [
                TextField(controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'mailid@email.com',
                    icon: Icon(Icons.contact_mail),
                    
                  ),
                ),
                TextField(controller: _password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'password',
                    icon: Icon(Icons.password)
                  ),
                ),
                TextButton(onPressed: () async{
                  
                  final email = _email.text;
                  final password = _password.text;
                 try{
                  final UserCredential = 
                        await  FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                           password: password
                           );
                           print(UserCredential);
                 }on FirebaseAuthException catch (e){
                 // print(e.code);
                  if(e.code=="invalid-credential"){
                    print("user not found");
                  }
                  else if(e.code=="wrong-password"){
                    print("\n"+"Wrong password i guess");
                  }
                 }
                }, child: const Text('Login') ),
              ],
            );
            default:
              return Text('Loading....');
              }
               
            }, 
            
          ),
          
    );
  }
 
}