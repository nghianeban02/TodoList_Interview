import 'package:flutter/material.dart';
import 'package:todolist_interview/model/todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
    final List <Todo> todos = [];
    final TextEditingController _controller = TextEditingController();

void removeTodo(int index){
  setState(() {
    todos.removeAt(index);
  });
}
void toggleTodoState(int index){
  setState(() {
    todos[index].isCompleted = !todos[index].isCompleted;
  });
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("To do List"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: "Enter a task"
            ),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {
                todos.add(Todo(title: _controller.text));
                _controller.clear();
              });
            },
            child: const Text("Add"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index){
                final todo = todos[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction){
                    removeTodo(index);
                  }, background: Container(color: Colors.red,),
                  child: ListTile(
                    title: Text(todos[index].title,
                    style: TextStyle(
                    decoration: todo.isCompleted?TextDecoration.lineThrough :TextDecoration.none
                  ),
                ),
                onTap: () => toggleTodoState(index),
                    
                )
                );
              },
            ),
          
          )
          ],

      ),

    );

  }
}