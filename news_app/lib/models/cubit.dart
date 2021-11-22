import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/models/states.dart';
import 'package:training_app/newtwork/dio_helper.dart';
import 'package:training_app/screens/busniss.dart';
import 'package:training_app/screens/science.dart';
import 'package:training_app/screens/settings.dart';
import 'package:training_app/screens/sports.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0 ;

  List<BottomNavigationBarItem> bottomNavBar =[
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business
        ),
      label: "Business",
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports
        ),
      label: "Sports",
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science
        ),
      label: "Science",
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  changeBottomNavBar (int index){
    if(index==1)  getSports();
    if(index==2)  getScience();
    currentIndex = index;
    emit(NewsButtonNavStates());
  }

  List<dynamic> business =[];

  void getBusiness(){
    emit(NewsGetBusinessLoadingStates());
    if (business.length==0){
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'status':'ok',
            'totalResults': '7117',
            'apiKey': '7bf3714b117449f98f9e661ee9f8c4db'
          }
      ).then((value) {
        business = value.data["articles"];
        print(business.length);
        emit(NewsGetBusinessSuccess());
      }
      ).catchError((e){print(e.toString());
      emit(NewsGetBusinessError(e.toString()));
      });
    }else{emit(NewsGetBusinessSuccess());}
  }

  List<dynamic> sports =[];

  void getSports(){
    emit(NewsGetSportsLoadingStates());
    if(sports.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'status':'ok',
            'totalResults': '10',
            'apiKey': '7bf3714b117449f98f9e661ee9f8c4db'
          }
      ).then((value) {
        sports = value.data["articles"];
        print(sports.length);
        emit(NewsGetSportsSuccess());
      }
      ).catchError((e){print(e.toString());
      emit(NewsGetSportsError(e.toString()));
      });
    }else{emit(NewsGetSportsSuccess());}
  }

  List<dynamic> science =[];

  void getScience(){
    emit(NewsGetScienceLoadingStates());
    if(science.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'status':'ok',
            'totalResults': '7131',
            'apiKey': '7bf3714b117449f98f9e661ee9f8c4db'
          }
      ).then((value) {
        science = value.data["articles"];
        print(science.length);
        emit(NewsGetScienceSuccess());
      }
      ).catchError((e){print(e.toString());
      emit(NewsGetScienceError(e.toString()));
      });
    }else{emit(NewsGetScienceSuccess());}
  }
}