import 'package:bloc/bloc.dart';
import 'package:city_guide_app/cubit/app_cubit_states.dart';
import 'package:city_guide_app/pages/detail_page.dart'; // Import the DetailPage
import 'package:city_guide_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  void navigateToDetailPage(dynamic data) {
    emit(DetailPage(data) as CubitStates);
  }
}

class DetailPageState extends Cubit<CubitStates> {
  final dynamic data;

  DetailPageState(this.data) : super(data);
}

class DataModel {
  get img => null;

  static fromJson(e) {}
}
