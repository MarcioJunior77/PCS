import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:pcs/To-do-list/helpers/database_helper.dart';
import 'package:pcs/To-do-list/models/task_model.dart';

import 'add_task_screen.dart';
import 'package:intl/date_symbol_data_http_request.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // late Future<List<Task>> _taskList;

  // @override
  // void initState() {
  //   super.initState();
  //   _updateTaskList();
  // }

  // _updateTaskList() {
  //   setState(() {
  //     _taskList = DatabaseHelper.instance.getTaskList();
  //   });
  // }

  Widget _buildTask(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Título da Tarefa'),
            subtitle: Text('16/07/2021 • Alta'),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              activeColor: Theme.of(context).primaryColor,
              value: true,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddTaskScreen(),
            ),
          ),
        ),
        body: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 80.0),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tarefas',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        '1 de 10',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }
              return _buildTask(index);
            }));
  }
}
