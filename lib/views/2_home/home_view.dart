import 'package:todo/export_files.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoStatus.isSuccess) {
            return state.todos.isNotEmpty
                ? CustomScrollView(
                    slivers: [
                      if (state.showReminder &&
                          state.todos
                              .where((element) => !element.isDone)
                              .toList()
                              .isNotEmpty)
                        SliverPersistentHeader(
                          delegate: ReminderDelegate(
                            state.todos
                                .where((element) => !element.isDone)
                                .toList()[0],
                          ),
                        ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return TodoItem(
                                cachedTodo: state.todos[index],
                                showDay: index == 0 ||
                                    state.todos[index].dateTime.day !=
                                        state.todos[index - 1].dateTime.day,
                              );
                            },
                            childCount: state.todos.length,
                          ),
                        ),
                      ),
                    ],
                  )
                : const NoTasksWidget();
          } else if (state.todoStatus == TodoStatus.loading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
