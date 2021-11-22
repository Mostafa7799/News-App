
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/models/cubit.dart';
import 'package:training_app/models/states.dart';
import 'package:training_app/newtwork/dio_helper.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context , states) {NewsCubit();},
        builder: (context , states) {
          var cubit = NewsCubit();
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search),
                  color: Colors.black,
                ),
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.brightness_4_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: NewsCubit.get(context).currentIndex,

              onTap: (index) {
                NewsCubit.get(context).changeBottomNavBar(index);
              },
              items: cubit.bottomNavBar,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
              },
              child: Icon(
                Icons.add
              ),
            ),
            body: cubit.screens[NewsCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}
