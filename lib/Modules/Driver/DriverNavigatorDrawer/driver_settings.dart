import 'package:busplus/Layouts/Driver/DriverCubit/driver_cubit.dart';
import 'package:busplus/Layouts/Driver/DriverCubit/driver_states.dart';
import 'package:busplus/Shared/Components/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriverSettingsScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  bool emailExists = false;
  bool isError = false;

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => DriverCubit()..getDriverData(),
      child: BlocConsumer<DriverCubit, DriverStates>(
        listener: (context, state) {
          if(state is DriverUpdateSuccessState) {
            navigateBack(context, DriverSettingsScreen());
          }
          else if(state is EmailExistsState)
          {
            emailExists = true;
            formKey.currentState!.validate();
          }
          else if(state is DriverUpdateErrorState)
          {
            isError = true;
            formKey.currentState!.validate();
          }
        },
        builder: (context, state)
        {
          var driverModel = DriverCubit.get(context).driverModel;

          return ConditionalBuilder(
            condition: driverModel != null,
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Settings'),
                  //centerTitle: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name and pic
                      Row(
                        children:
                        [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCpawWq8L8kk4tzxZ6h-svcCsRbQFvUk2KfYnaBg7MOcqvhYdIJUL60i5pBI-f_whkQ90&usqp=CAU'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${driverModel!.firstName} ${driverModel.lastName}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //nationalIDNumber
                      const Text(
                        'National ID',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                        '${driverModel.nationalIDNumber}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //phone
                      const Text(
                        'Phone Number',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Text(
                        '${driverModel.phone}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      //email
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${driverModel.email}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: (){
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  builder: (context) {
                                    return Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              "What's your email?",
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.teal,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              child: Padding(
                                                padding:  EdgeInsets.only(
                                                    bottom: MediaQuery.of(context).viewInsets.bottom
                                                ),
                                                child: Form(
                                                  key: formKey,
                                                  child: Column(
                                                    children: [
                                                      defaultFormField(
                                                        controller: emailController,
                                                        type: TextInputType.emailAddress,
                                                        validate: (value){
                                                          if(emailExists) {
                                                            emailExists = false;
                                                            return 'Email already exists';
                                                          }
                                                          else if(isError) {
                                                            isError = false;
                                                            print('a7a');
                                                            return 'Something went wrong. Please try again';
                                                          }
                                                          return validate(value!, 'email');
                                                        },
                                                        label: 'Email Address',
                                                      ),
                                                      const SizedBox(
                                                        height: 60,
                                                      ),
                                                      defaultButton(
                                                        function: (){
                                                          if(formKey.currentState!.validate()) {
                                                            DriverCubit.get(
                                                                context)
                                                                .updateDriverEmail(
                                                              email: emailController
                                                                  .text,
                                                            );
                                                            Navigator.pop(context);
                                                            Navigator.pop(context);
                                                          }
                                                        },
                                                        text: 'Update',
                                                        isUpperCase: false,
                                                        textColor: Colors.white,
                                                        backgroundColorBox: Colors.teal,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    );
                                  }
                              );
                            },
                            icon: const Icon(
                              Icons.edit_outlined,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}