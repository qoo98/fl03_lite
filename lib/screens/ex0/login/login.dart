import 'package:fl03_lite/screens/ex0/home/home.dart';
import 'package:fl03_lite/screens/ex0/register/registration.dart';
import 'package:fl03_lite/screens/ex0/login/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(

        body: Center(
          child: Consumer<LoginModel>(builder: (context, model, child) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset('images/firebase.png'),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: model.titleController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                )
                            ),
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail_outline,
                            color: Colors.white,),
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (text) {
                            model.setEmail(text);
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          obscureText: true,
                          controller: model.authorController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                            ),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline,
                            color: Colors.white,),
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onChanged: (text) {
                            model.setPassword(text);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              model.startLoading();

                              // 追加の処理
                              try {
                                await model.login();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                    fullscreenDialog: true,
                                  ),
                                );
                              } catch (e) {
                                final snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(e.toString()),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } finally {
                                model.endLoading();
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('LOG IN', style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                            ),),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            // 画面遷移
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Text('Sign in', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ),
                  if (model.isLoading)
                    Container(
                      color: Colors.black54,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}