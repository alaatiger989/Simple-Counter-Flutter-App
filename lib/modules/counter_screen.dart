import 'package:counter_app/shared/cubit/counter_cubit.dart';
import 'package:counter_app/shared/cubit/counter_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocConsumer<CounterCubit , CounterStates>(
          listener: (context , state) {

          },
          builder: (context , state)  {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.black,
                title: Text('Simple Counter'),
              ),
              body: Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: (){
                          CounterCubit.get(context).minus();
                        },
                        child: Icon(Icons.remove),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        splashColor: Colors.grey[200],
                      ),

                      SizedBox(width: 15,),
                      Text(
                          '${CounterCubit.get(context).counter}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0
                          ),
                      ),
                      SizedBox(width: 15,),
                      FloatingActionButton(
                        onPressed: (){
                          CounterCubit.get(context).plus();
                        },
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        splashColor: Colors.grey[200],
                        child: Icon(Icons.add),
                      ),
                      SizedBox(width: 15,),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
