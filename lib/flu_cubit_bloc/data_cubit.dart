import 'package:flu_cubit_bloc/flu_cubit_bloc/data_repos.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  final DataRepos _dataRepos;
  DataCubit(this._dataRepos) : super(DataInital());
  Future<void> getIBBData() async{
    try {
      emit(DataLoading());
      await Future.delayed(Duration(milliseconds: 500));
      final response=await _dataRepos.getIBBData();
      emit(DataComplete(response));
    } on NetworkError catch (e) {
      emit(DataError(e.message));
    }
    
  }
}
