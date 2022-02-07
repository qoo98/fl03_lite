import 'package:fl03_lite/screens/ex0/home/home.dart';
import 'package:fl03_lite/screens/ex0/register/register_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (_) => RegisterModel(),
      child: Scaffold(
        body: Center(
          child: Consumer<RegisterModel>(builder: (context, model, child) {
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
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: Icon(Icons.mail_outline,
                            color: Colors.white,),
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
                          controller: model.textController,
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
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.person_outline,
                              color: Colors.white,),
                            hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          ),
                          onChanged: (text) {
                            model.setUsername(text);
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
                                await model.signUp();
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
                            child: Text('SIGN UP', style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                            ),),
                          ),
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