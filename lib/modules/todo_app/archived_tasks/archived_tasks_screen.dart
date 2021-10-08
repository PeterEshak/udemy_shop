import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/cubit.dart';
import '../../../../shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget {
  const ArchivedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;

        return tasksBuilder(
          tasks: tasks,
          iconDone: Icons.check_box_outlined,
          colorDone: Colors.grey,
          // iconArchive: Icons.archive,
          // colorArchive: Colors.green,
          type: 'archive',
        );
      },
    );
  }
}
