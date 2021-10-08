import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/shop_app/shop_layout.dart';
import 'package:shop/shared/components/constants.dart';
import 'package:shop/shared/network/local/cache_helper.dart';
import '../register/shop_register_screen.dart';
import '../../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
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
                        'LOGIN',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        'Login now to browse our hot offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
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
                        suffix: ShopLoginCubit.get(context).suffix,
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            ShopLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        isPassword: ShopLoginCubit.get(context).isPassword,
                        suffixPressed: () {
                          ShopLoginCubit.get(context)
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
                      const SizedBox(height: 30),
                      Container(
                        child: state is! ShopLoginLoadingState
                            ? defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                                isUpperCase: true,
                              )
                            : const Center(child: CircularProgressIndicator()),
                      ),
                      // ConditionalBuilder(
                      //   condition: false,
                      //   builder: (context) => defaultButton(
                      //     function: () {},
                      //     text: 'login',
                      //     isUpperCase: true,
                      //   ),
                      //   fallback: (context) => const CircularProgressIndicator(),
                      // ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          defaultTextButton(
                            function: () =>
                                navigateTo(context, ShopRegisterScreen()),
                            text: 'register',
                          ),
                        ],
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
