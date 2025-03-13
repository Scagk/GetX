import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/models/todo_model.dart';
import 'package:todo_getx/views/add_todo_View.dart';
import 'package:todo_getx/views/login_view.dart';

class HomeView extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    todoController.fetchTodos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scagk'),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.off(LoginView());
            },
          ),
        ],
      ),
      body: Obx(
        () => Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: todoController.todoList.length,
                  itemBuilder: (context, index) {
                    TodoModel todo = todoController.todoList[index];
                    return ListTile(
                      title: Text(todo.title),
                      subtitle: Text(todo.subtitle),
                      leading: Checkbox(
                        value: todo.isDone,
                        onChanged: (bool? newValue) {
                          // todoController.toggleDone(index);
                        },
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          // todoController.delete(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ),
              Obx(() {
                bool anyCompleted = todoController.todoList.any(
                  (todo) => todo.isDone,
                );
                return anyCompleted
                    ? ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        // todoController.delete_compled();
                      },
                      child: Icon(Icons.delete),
                    )
                    : SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Get.to(AddTodoView());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Get.off(LoginView());
            },
            child: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
