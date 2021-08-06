import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/providers/todo_provider.dart';

class AddTodo extends StatelessWidget {
  // final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String todoTitle = "";
    bool? isChecked = false;
    return Container(
        height: 500,
        color: Color(0xff757575),
        // color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            // color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Consumer<TodoProvider>(builder: (context, todo, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Todo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600),
                  ),
                  TextField(
                    // controller: _controller,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    autofocus: false,
                    onChanged: (title) {
                      print(title);
                      todoTitle = title;
                    },
                  ),
                  ListTile(
                      leading: Text(
                        "Complete?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      trailing: Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          isChecked = value;
                          todo.checkBoxState(isChecked);
                          // isChecked = value;
                        },
                      )),
                  ElevatedButton(
                      // color: Colors.lightBlueAccent,
                      onPressed: () {
                        todo.addTodo(todoTitle, isChecked);
                        Navigator.pop(context);
                        print(todoTitle);
                      },
                      child: Text('Add',
                          style: TextStyle(
                            color: Colors.white,
                          )))
                ],
              );
            }),
          ),
        ));
  }
}
