import 'package:ecomm_class/ui/category/bloc/category_event.dart';
import 'package:ecomm_class/ui/category/bloc/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/helper/api_helper.dart';
import '../../../domain/constants/app_urls.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  ApiHelper apiHelper;
  CategoryBloc ({required this.apiHelper}) : super (CategoryInitialState()){
    on<FetchAllCategoryEvent>((event,emit)async{
      emit(CategoryLoadingState());

      try{
        dynamic mData = await apiHelper.postApi(url: AppUrls.category_url);
        if(mData["status"]){
          emit(CategoryLoadedState(categories: mData["data"]));
        }else {
          emit(CategoryErrorState(errorMsg: mData["message"]));
        }
      }catch(e){
        emit (CategoryErrorState(errorMsg: e.toString()));
      }
    });
  }
}
