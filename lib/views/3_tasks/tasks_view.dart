import 'package:todo/export_files.dart';
import 'package:todo/views/3_tasks/components/category_grid_item.dart';
import 'package:todo/views/widgets/reminder_delegate.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories =
        context.read<CategoryRepository>().categories;
    return Scaffold(
      backgroundColor: AppColors.cF9FCFF,
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoStatus.isSuccess) {
            return CustomScrollView(
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
                  padding: EdgeInsets.only(left: 18.w, top: 13.h),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Projects',
                      style: RubikFont.w500.copyWith(
                        fontSize: 13.sp,
                        color: AppColors.c8B87B3,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 31.h),
                  sliver: SliverGrid.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryGridItem(
                        categoryModel: categories[index],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state.todoStatus.isLoading) {
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
