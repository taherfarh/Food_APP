import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_application/core/home/cubit/home_state.dart';
import 'package:food_application/core/home/cubit/home_state.dart';
import 'package:food_application/core/home/cubit/home_state.dart';
import 'package:food_application/data/models.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'home_state.dart'; // Ensure this imports the HomeState definitions.

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  void getdata() async {
  emit(Homeloading());
  try {
    var response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"));
    if (response.statusCode == 200) {
      // Decode the response body
      var decodedResponse = jsonDecode(response.body);
      
      // Print the full decoded response for debugging
      print(decodedResponse);

      // Access the 'categories' key from the decoded response
      List<dynamic> categories = decodedResponse['categories'];
      
      // Check if categories is indeed a List
      if (categories is List) {
        // Map the list to Userdata instances
        List<Userdata> userlist = categories.map((item) => Userdata.fromJson(item)).toList();
        
        // Emit success with the list
        emit(HomeSuccess(userlist: userlist));
      } else {
        emit(HomeError(errormsg: "Categories is not a list"));
      }
    } else {
      emit(HomeError(errormsg: "Failed to load data"));
    }
  } catch (e) {
    print(e.toString());
    emit(HomeError(errormsg: e.toString()));
  }
}

}
