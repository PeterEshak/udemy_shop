import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/shop_app/shop_layout.dart';
import 'package:shop/shared/components/constants.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'package:shop/shared/components/components.dart';

import 'cubit/states.dart';

class ShopRegisterScreen extends StatelessWidget {
  ShopRegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token!;
                navigateAndFinish(context, const ShopLayout());
              });
              // showToast(
              //   text: state.loginModel.message,
              //   state: ToastStates.sUCCESS,
              // );
            } else {
              showToast(
                text: state.loginModel.message!,
                state: ToastStates.eRROR,
              );
            }
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'Register now to browse our hot offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your name';
                          }
                        },
                        label: 'User Name',
                        prefix: Icons.person,
                      ),
                      const SizedBox(height: 15),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'please enter your email address';
                          }
                        },
                        label: 'Email Address',
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(height: 15),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: ShopRegisterCubit.get(context).suffix,
                        onSubmit: (value) {
                          // if (formKey.currentState!.validate()) {
                          //   ShopLoginCubit.get(context).userLogin(
                          //     email: emailController.text,
                          //     password: passwordController.text,
                          //   );
                          // }
                        },
                        isPassword: ShopRegisterCubit.get(context).isPassword,
                        suffixPressed: () {
                          ShopRegisterCubit.get(context)
                              .changePasswordVisibility();
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'password is too short';
                          }
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                      const SizedBox(height: 15),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                        },
                        label: 'Phone',
                        prefix: Icons.phone,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        child: state is! ShopRegisterLoadingState
                            ? defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopRegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                text: 'register',
                                isUpperCase: true,
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
