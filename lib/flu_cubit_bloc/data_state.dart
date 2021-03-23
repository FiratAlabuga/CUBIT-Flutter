import 'package:flutter/foundation.dart';

import 'package:flu_cubit_bloc/flu_cubit_bloc/ibb_data.dart';

abstract class DataState {
  const DataState();
}

class DataInital extends DataState {
  const DataInital();
}

class DataLoading extends DataState {
  const DataLoading(); //Loading zamanı ekranın loading zamanı-durumu
}

class DataComplete extends DataState {
  final List<IBBData> response;

  const DataComplete(this.response); //Islem basarılı için tamamlanma durumu
  
  //equialty iki instance eşit olmaz object eşitliği sağlanır sayesinde
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DataComplete &&
      listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class DataError extends DataState{
  final String message;//Hata durumunu belirtmek için kullanılır.
  DataError(this.message);
}
