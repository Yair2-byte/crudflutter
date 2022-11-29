import 'package:crud_en_flutter/message_response.dart';
import 'package:crud_en_flutter/modify_contact.dart';
import 'package:crud_en_flutter/register_contact.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String _title;
  MyHomePage(this._title);
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}
//lista de los clientes agregados de manera directa, estos clientes apareceran en la pantalla de inicio
class _MyHomePage extends State<MyHomePage> {
  List<Client> clients = [
    Client(name: 'Will', surname: 'Mora', phone: '302 454 25 93'),
    Client(name: 'Sam', surname: 'Perez', phone: '322 412 34 68'),
    Client(name: 'Marlon', surname: 'Gutierrez', phone: '301 441 36 98'),
    Client(name: 'Jhon', surname: 'Segura', phone: '310 789 90 62')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
// en este apartado solo se trabaja la modificacion del cliente
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifyContact(clients[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    clients.removeAt(index);

                    clients.insert(index, newContact);

                    messageResponse(
                        context, newContact.name + " a sido modificado...!");
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, clients[index]);
            },
            title: Text(clients[index].name + " " + clients[index].surname),
            subtitle: Text(clients[index].phone),
            leading: CircleAvatar(
              child: Text(clients[index].name.substring(0, 1)),
            ),
            trailing: Icon(
              Icons.call,
              color: Colors.red,
            ),
          );
        },
      ),
      //en este apartaco se crea la agregacion de los contactos, la sentencia if nos va mostrar
      //cuando sea diferente de null entonces se va agregar un nuevo contacto, una vez hecho esto saldra el mensaje en pantalla
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RegisterContact()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                clients.add(newContact);
                messageResponse(
                    context, newContact.name + " a sido guardado...!");
              });
            }
          });
        },
        tooltip: "Agregar Contacto",
        child: Icon(Icons.add),
      ),
    );
  }
    //en este apartado se crea el onpressed para poder presionar la pantalla y asi eliminar al cliente 
    //una vez echa la accion saldra el mensaje en pantalla, con el client.name trae el nombre de ese cliente 
  removeClient(BuildContext context, Client client) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Cliente"),
              content: Text("Esta seguro de eliminar a " + client.name + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.clients.remove(client);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}
//declaracion de nombre, apellido y telefono
class Client {
  var name;
  var surname;
  var phone;

  Client({this.name, this.surname, this.phone});
}
