import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateBack(context, widget) =>
    Navigator.pop(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route)
  {
    return false;
  },
);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

String? validate(String value, String key) {
  if(key == 'email')
  {
    if (value.isEmpty)
      return "Email cannot be empty";

    else if (!RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value))
      return 'Enter Valid Email';
  }
  else if(key == 'passwordRegister')
  {
    if (value.isEmpty)
      return "Password cannot be empty";

    else if (value.length < 8)
      return 'Use 8 characters or more for your password';
  }
  else if(key == 'passwordLogin')
  {
    if (value.isEmpty)
      return "Password cannot be empty";

    else if (value.length < 8)
      return 'Password must be at least 8 characters';
  }
  else if(key == 'name')
  {
    if (value.isEmpty)
      return "Name cannot be empty";

    else if (value.length < 3)
      return 'Name must be more than 2 charater';

    else if(!RegExp(r'^[A-Za-z]+$').hasMatch(value))
      return 'Enter Valid Name';
  }
  else if(key == 'nationalID')
  {
    if (value.isEmpty)
      return "National ID number cannot be empty";

    else if (!RegExp(r'^[23](?:[0-9]{2}(?:(?:(?:0[13578]|1[02])(?:0[1-9]|[12][0-9]|3[01]))|(?:(?:0[469]|11)(?:0[1-9]|[12][0-9]|30))|(?:02(?:0[1-9]|1[0-9]|2[0-8])))|(?:(?:04|08|[2468][048]|[13579][26]|(?<=3)00)0229))(?:0[1-4]|[12][1-9]|3[1-5]|88)[0-9]{4}[1-9]$').hasMatch(value) || value.length != 14)
      return 'Enter Valid National ID Number';
  }
  else if(key == 'phone')
  {
    if (value.isEmpty)
      return "Phone number cannot be empty";

    else if (!(RegExp(r'^01(0|1|2|5)\d{1,8}$').hasMatch(value)) || value.length != 11)
      return 'Enter Valid Phone Number';
  }
}


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
    end: 20,
    top: 15,
    bottom: 15,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  ),
);


Widget defaultButton({
  double height = 45.0,
  double? width,
  double? fontSize,
  Color? backgroundColorBox,
  Color? textColor,
  double radius = 25.0,
  bool isUpperCase = true,
  required Function? function,
  required String text,
}) => Container(
  height: height,
  width: width,
  child: MaterialButton(
    onPressed: (){
      function!();
    },
    child: Text(
      isUpperCase ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: fontSize?? 25.0,
        fontWeight: FontWeight.bold,
        color: textColor ?? Colors.teal ,
      ),
    ),
  ),
  decoration: BoxDecoration(
    color: backgroundColorBox,
    borderRadius: BorderRadiusDirectional.circular(radius),
   // color: background,
    border: Border.all(
      color: Colors.teal,
      width: 1.5,
    ),
  ),
);

Widget defaultImageButton({
  double height = 45.0,
  double width = double.infinity,
  Color background = Colors.white,
  double radius = 25.0,
  bool isUpperCase = true,
  required String imaged,
  required Function function,
  //String? text,
}) => Container(
  height: height,
  width: width,
  child: MaterialButton(
    onPressed: (){
      function();
    },
    /*child: Text(
      isUpperCase ? text!.toUpperCase() : text!,
      style: const TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    ),*/
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(radius),
    image:  DecorationImage(
      image: AssetImage(imaged),
      fit: BoxFit.cover,
    ),
    // color: background,
    border: Border.all(
      color: Colors.teal,
      width: 1.5,
    ),
  ),
);


Widget defaultTextButton({
  required void Function() function,
  required String text,
}) => TextButton(
  onPressed: function,
  child: Text(
    text,
    style: const TextStyle(
      color: Colors.teal,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  bool isBool = false,
  bool isClickable = false,
  required FormFieldValidator<String> validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  InputBorder? border,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isBool,
  onFieldSubmitted: onSubmit,
  onChanged: onChanged,
  validator: validate,
  onTap: onTap,
  decoration:  InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: IconButton(
      icon: Icon(suffix),
      onPressed: ()
      {
        suffixPressed!();
      },
    ),
    border: border,
  ),
);

Widget defaultGoogleFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  bool isBool = false,
  bool isClickable = false,
  required FormFieldValidator<String> validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  InputBorder? border,
  ValueChanged<String>? locationCallBack,
  FocusNode? focusNode,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isBool,
  onFieldSubmitted: onSubmit,
  onChanged: (value){
    locationCallBack!(value);
  },
  validator: validate,
  onTap: onTap,
  decoration:  InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: IconButton(
      icon: Icon(suffix),
      onPressed: ()
      {
        suffixPressed!();
      },
    ),
    border: border,
  ),
  focusNode: focusNode,
);
