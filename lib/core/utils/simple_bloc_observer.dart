import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver{
 
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
  }
}