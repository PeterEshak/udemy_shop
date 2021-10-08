import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/layout/shop_app/cubit/cubit.dart';
import 'package:shop/layout/shop_app/cubit/states.dart';
import 'package:shop/models/shop_app/login_model.dart';
import 'package:shop/modules/shop_app/login/cubit/cubit.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/components/constants.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopLoginModel model = ShopCubit.get(context).userModel!;
        nameController.text = model
            .data!.name!; // Null check operator used on a null value : model!
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;

        return Container(
          child: ShopCubit.get(context).userModel != null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        if (state is ShopLoadingUpdateUserState)
                          const LinearProgressIndicator(),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'name must not be empty';
                            }
                          },
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'email must not be empty';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        const SizedBox(height: 20),
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'phone must not be empty';
                            }
                          },
                          label: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(height: 20),
                        defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              ShopCubit.get(context).updateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          text: 'update',
                        ),
                        const SizedBox(height: 20),
                        defaultButton(
                          function: () => signOut(context),
                          text: 'logout',
                        ),
                      ],
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
