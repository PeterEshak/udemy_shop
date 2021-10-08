import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/layout/shop_app/cubit/cubit.dart';
import 'package:shop/shared/styles/colors.dart';
import 'package:shop/shared/styles/icon_broken.dart';
import '../../../modules/news_app/web_view/web_view_screen.dart';
import '../cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () => function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () => function,
      child: Text(text.toUpperCase()),
    );

Widget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(IconBroken.arrowLeft2),
      ),
      titleSpacing: 5.0,
      title: Text(title ?? ''),
      actions: actions,
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) => onSubmit!(s),
      onChanged: (s) => onChange!(s),
      onTap: () => onTap!(),
      validator: (s) => validate!(s),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => suffixPressed!(),
                icon: Icon(suffix),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

/* Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: const Icon(Icons.check_box, color: Colors.green),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: const Icon(Icons.archive, color: Colors.black45),
            ),
          ],
        ),
      ),
      onDismissed: (direction) =>
          AppCubit.get(context).deleteData(id: model['id']),
    );
 */
Widget buildTaskItem({
  required Map model,
  required BuildContext context,
  IconData? iconDone,
  Color? colorDone,
  IconData? iconArchive,
  Color? colorArchive,
  required String type,
}) =>
    Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text("${model['time']}"),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "${model['title']}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          "${model['date']}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          " || State: ${model['status']}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            type == 'new'
                ? Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'done',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconDone, //Icons.check_box
                          color: colorDone, //Colors.green
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'archive',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconArchive, //Icons.archive,
                          color: colorArchive, //Colors.black45,
                        ),
                      )
                    ],
                  )
                : type == 'done'
                    ? IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'archive',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconArchive, //Icons.archive,
                          color: colorArchive, //Colors.black45,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          AppCubit.get(context).updateData(
                            status: 'done',
                            id: model['id'],
                          );
                        },
                        icon: Icon(
                          iconDone, //Icons.check_box
                          color: colorDone, //Colors.green
                        ),
                      ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );

/* Widget tasksBuilder(List<Map> tasks) => ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
 */
Widget tasksBuilder({
  required List<Map> tasks,
  IconData? iconDone,
  Color? colorDone,
  IconData? iconArchive,
  Color? colorArchive,
  required String type,
}) =>
    Container(
      child: tasks.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) => buildTaskItem(
                type: type,
                model: tasks[index],
                context: context,
                iconDone: iconDone,
                colorDone: colorDone,
                iconArchive: iconArchive,
                colorArchive: colorArchive,
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: tasks.length,
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.menu, size: 100, color: Colors.grey),
                  Text(
                    'No Tasks Yet, Please Add Some Tasks',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(article, context) {
  print(article['urlToImage']);
  return InkWell(
    onTap: () => navigateTo(context, WebViewScreen(url: article['url'])),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          // article['urlToImage'] != 'null'
          //     ? Container(
          //         width: 120.0,
          //         height: 120.0,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0),
          //           image: DecorationImage(
          //             image: NetworkImage('${article['urlToImage']}'),
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       )
          //     :
          SizedBox(
            width: 120.0,
            height: 120,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                '${article['urlToImage']}',
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Image(
                    image: AssetImage('assets/images/errer.jfif'),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15.0),
        ],
      ),
    ),
  );
}

/* Widget articleBuilder(list) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index]),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
 */
Widget articleBuilder(list, context, {isSearch = false}) => Container(
      child: list.length > 0
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticleItem(list[index], context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 15,
            )
          : isSearch
              ? Container()
              : const Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
      // (Route<dynamic> route) => false,
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 5,
      fontSize: 16,
      gravity: ToastGravity.CENTER,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
    );

// enum
enum ToastStates {
  sUCCESS,
  eRROR,
  wARNING,
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.sUCCESS:
      color = Colors.green;
      break;
    case ToastStates.eRROR:
      color = Colors.red;
      break;
    case ToastStates.wARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Widget buildListProduct(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image!),
                    width: 120,
                    height: 120,
                  ),
                  if (model.discount != 0 && isOldPrice)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: const Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        model.price.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: defaultColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (model.discount != 0 && isOldPrice)
                        Text(
                          model.oldPrice.toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavorites(productID: model.id!);
                        },
                        icon: CircleAvatar(
                          radius: 15,
                          backgroundColor: ShopCubit.get(context).favorites[model
                                  .id!]! // Null check operator used on a null value: favorites[model.id!]!
                              ? defaultColor
                              : Colors.grey,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
