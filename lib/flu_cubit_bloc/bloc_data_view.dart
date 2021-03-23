import 'package:flu_cubit_bloc/flu_cubit_bloc/data_cubit.dart';
import 'package:flu_cubit_bloc/flu_cubit_bloc/data_repos.dart';
import 'package:flu_cubit_bloc/flu_cubit_bloc/data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CBlocDataView extends StatefulWidget {
  CBlocDataView({Key key}) : super(key: key);

  @override
  _CBlocDataViewState createState() => _CBlocDataViewState();
}

class _CBlocDataViewState extends State<CBlocDataView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataCubit(IbbDataRepos()),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("İstanbul İli Sağlık Kuruluşları"),
        ),
        body: BlocConsumer<DataCubit,DataState>(listener: (context,state){
          if (state is DataError) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message),));
          }
        },
        builder:(context,state){
          if (state is DataInital) {
            return buildCenterInitialChild(context);
          } else if (state is DataLoading){
            return buildCenterLoading();
          } else if(state is DataComplete){
            return buildListViewCats(state);
          }else{
            return buildError(state);
          }
        }
        ),
      );

  Center buildCenterLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildCenterInitialChild(BuildContext context) {
    return Center(
      child: Column(
        children: [Text("Butona Tıklayınız"), buildFloatingActionButtonCall(context)],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButtonCall(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.clear_all),
      onPressed: () {
        BlocProvider.of<DataCubit>(context).getIBBData();
      },
    );
  }

    Text buildError(DataError state) {
    final error = state as DataError;
    return Text(error.message);
  }

  ListView buildListViewCats(DataComplete state) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(state.response[index].aDI),
        subtitle: Text(state.response[index].iLCEADI),
        
      ),
      itemCount: state.response.length,
    );
  }
}
