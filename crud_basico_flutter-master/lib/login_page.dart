import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState () => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Fondo(),
          Contenido()
        ],
      ),
    );
  }
}

class Contenido extends StatefulWidget {
  @override 
  _ContenidoState createState () => _ContenidoState();
}

class _ContenidoState extends State<Contenido>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Bienvenido a tu cuenta',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Datos(),
        ],
      ),
    );
  }
}
class Datos extends StatefulWidget{
  @override
  _DatosState createState () => _DatosState();
}
class _DatosState extends State<Datos>{
  bool obs = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'email@email.com',
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Password',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            obscureText: obs,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password here',
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye_outlined),
                onPressed: () {
                  setState(() {
                    obs == true ? obs = true : obs = false;
                  });
                },
              ),
            ),
          ),
          Remember( ),
          SizedBox(
            height: 30,
          ),
          Botones(),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
    );
  }
}

class Remember extends StatefulWidget{
  @override
  _RememberState createState () => _RememberState();
}

class _RememberState extends State<Remember>{
  bool valor = false;
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Checkbox(
          value: valor,
          onChanged: (value){
            setState(() {
              valor == false ? valor = true : valor = false;
            });
          },
        ),
        Text('Recordarme'),
        Spacer(),
        TextButton(
          onPressed: (){},
          child: Text('¿Olvidaste la contraseña?'),
        ),
      ],
   );
  }
}

class Botones extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[  //botones relleno de widgets
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff142047)),
            ),
          ),
        ),
        SizedBox(
          height: 25,
          width: double.infinity,
        ),
        Text(
          'O entra con',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 25,
          width: double.infinity,
          ),
        Container(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: (){},
            child: Text(
              'Sign with Google',
              style: TextStyle(
                color: Color(0xff1402047),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
          width: double.infinity,
        ),
        Container(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: (){},
            child: Text(
              'Sign with Facebook',
              style: TextStyle(
                color: Color(0xff1402047),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Fondo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade300,
            Colors.blue,
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        )
      ),

    );
  }
}