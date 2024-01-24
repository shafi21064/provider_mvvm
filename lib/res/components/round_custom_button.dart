import 'package:flutter/material.dart';
import 'package:model_mvvm/res/app_color.dart';
import 'package:model_mvvm/utils/utils.dart';

class RoundCustomButton extends StatelessWidget {
  final String buttonName;
  final bool loading;
  final VoidCallback buttonWork;
  const RoundCustomButton({
    super.key,
    required this.buttonName,
    required this.buttonWork,
    this.loading = false
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonWork,
      child: Container(
        alignment: Alignment.center,
        height: Utils(context).height * .07,
        width: Utils(context).width * .5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.buttonColor
        ),
        child: loading? CircularProgressIndicator() : Text(
          buttonName,
          style: const TextStyle(
          fontSize: 18,
            color: AppColor.whiteColor
        ),),
      ),
    );
  }
}
