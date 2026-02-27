import 'package:ecomm_class/domain/constants/app_constants.dart';
import 'package:ecomm_class/ui/on_boarding/bloc/user_event.dart';
import 'package:ecomm_class/ui/on_boarding/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/remote/helper/api_helper.dart';
import '../../../domain/constants/app_urls.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  ApiHelper apiHelper;

  UserBloc({required this.apiHelper}) : super(UserInitialState()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        dynamic data = await apiHelper.postApi(
          url: AppUrls.register_url,
          isAuth: true,
          mBodyPar: {
            "name": event.name,
            "mobile_number": event.mobileNo,
            "email": event.email,
            "password": event.password,
          },
        );

        if (data["status"]) {
          emit(UserSuccessState());
        } else {
          emit(UserFailureState(errorMsg: data["message"]));
        }
      } catch (e) {
        emit(UserFailureState(errorMsg: e.toString()));
      }
    });

    on<UserLoginEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        dynamic data = await apiHelper.postApi(
          url: AppUrls.login_url,
          isAuth: true,
          mBodyPar: {"email": event.email, "password": event.password},
        );

        if (data["status"]) {
          emit(UserSuccessState());

          ///prefs
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(AppConstants.PREF_USER_TOKEN, data["tokan"]);
        } else {
          emit(UserFailureState(errorMsg: data["message"]));
        }
      } catch (e) {
        emit(UserFailureState(errorMsg: e.toString()));
      }
    });
  }
}
