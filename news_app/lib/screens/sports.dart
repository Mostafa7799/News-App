import 'package:flutter/material.dart';
import 'package:training_app/models/cubit.dart';
import 'package:training_app/models/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget.dart';




class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context ,state) => {},
      builder: (context ,state)  {
        var list = NewsCubit.get(context).sports;
        return ListView.separated(
          itemBuilder: (context, index) => buildArticalItem(list[index]),
          separatorBuilder: (context, index) {
            return Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey,
            );
          },
          itemCount: 10,
        );
      },
    );
  }
}
