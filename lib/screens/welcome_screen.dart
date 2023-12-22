import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Welcome!!!!\nEnter Personal Details To Your Vehicle Account',
                textAlign: TextAlign.center,
              ),
              Center(
                  child: Image.asset(
                'assets/images/download1.jpg',
                height: 200,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.blue.shade800)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signIn_screen');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(width: 10),
                  Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blueAccent)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup_screen');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}







// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//           Flexible(
//               child: Container(
//            // padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//             child: Center(
//                 child: RichText(
//                     textAlign: TextAlign.center,
//                     text: const TextSpan(children: [
//                       TextSpan(
//                           text: 'Welcome!!!!\n',
//                           style: TextStyle(
//                               fontSize: 40, fontWeight: FontWeight.bold)),
//                       TextSpan(
//                           text:
//                               '\n Enter Personal Details To Your Vehicle Account',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ))
//                     ]))),
//           )),
//           const Flexible(
//               child: Align(
//             //alignment: Alignment.center,
//             child: Center(
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: WelcomeButton(
//                       buttonText: 'Sign In',
//                       onTap: SignInPage(),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Expanded(
//                     child: WelcomeButton(
//                       buttonText: 'Sign Up',
//                       onTap: SignUpPage(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }
