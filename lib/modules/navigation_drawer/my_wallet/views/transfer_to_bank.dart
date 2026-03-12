import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ogpay/core/themes/app_colors.dart' as c;
import 'package:ogpay/core/resources/app_icons.dart' as ic;
import 'package:ogpay/core/resources/app_images.dart' as img;
import 'package:ogpay/core/widgets/app_button.dart';
import 'package:ogpay/core/widgets/app_card.dart';
import 'package:ogpay/core/widgets/app_text.dart';
import 'package:ogpay/core/widgets/app_textfield.dart';
import '../../../../core/utils/ui_helper.dart';
import '../../../widgets/feature_action_card.dart';

/**
 * Created by karthi_rt on 11-03-2026.
 */

class TransferToBank extends StatefulWidget {
  const TransferToBank({super.key});

  @override
  State<TransferToBank> createState() => _TransferToBankState();
}

class _TransferToBankState extends State<TransferToBank> {

  final _formKey = GlobalKey<FormBuilderState>();
  bool isFormValid = false;

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        backgroundColor: c.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              IntrinsicHeight(
                child: AppCard(
                  width: Get.width,
                  bottomLeftRadius: 16.0, bottomRightRadius: 16.0,
                  padding: EdgeInsets.fromLTRB(Get.width/10, statusBarHeight + 8, Get.width/10, 16.0),
                  backgroundColor: c.primary,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back_ios, color: c.white, size: 18,),
                          UIHelper.horizontalSpaceM,
                          AppText("Transfer to Bank", color: c.white, fontWeight: FontWeight.w600, textAlign: TextAlign.center,),
                          // Icon(Icons.filter_alt_outlined, color: c.white, size: 18,),
                        ],
                      ),
                      UIHelper.verticalSpaceXXXL,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText("Current Balance", color: c.white, fontSize: 14, fontWeight: FontWeight.w400,),
                          AppText("₹ 5468.40", color: c.white, fontSize: 18, fontWeight: FontWeight.w600,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpaceXXL,
              formControls(),
            ],
          ),
        )
    );
  }

  formControls() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: FormBuilder(
        key: _formKey,
        onChanged: () {
          setState(() {
            isFormValid = _formKey.currentState?.validate() ?? false;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText("Name", color: c.textPrimary, fontSize: 14, fontWeight: FontWeight.w600,),
            AppTextField(name: "Name", hint: "Enter full name", keyboardType: TextInputType.name, textInputAction: TextInputAction.next, padding: EdgeInsets.symmetric(vertical: 0),),
            UIHelper.verticalSpaceM,
            AppText("Account Number", color: c.textPrimary, fontSize: 14, fontWeight: FontWeight.w600,),
            AppTextField(name: "Account Number", hint: "Enter account number", keyboardType: TextInputType.number, textInputAction: TextInputAction.next, padding: EdgeInsets.symmetric(vertical: 0),),
            UIHelper.verticalSpaceM,
            AppText("SORT Code", color: c.textPrimary, fontSize: 14, fontWeight: FontWeight.w600,),
            AppTextField(name: "SORT Code", hint: "Enter SORT sode number", keyboardType: TextInputType.text, textInputAction: TextInputAction.next, padding: EdgeInsets.symmetric(vertical: 0),),
            UIHelper.verticalSpaceM,
            AppText("Transfer Amount", color: c.textPrimary, fontSize: 14, fontWeight: FontWeight.w600,),
            AppTextField(name: "Transfer Amount", hint: "Enter amount here", keyboardType: TextInputType.number, textInputAction: TextInputAction.next, padding: EdgeInsets.symmetric(vertical: 0),),
            UIHelper.verticalSpaceM,
            AppText("Purpose", color: c.textPrimary, fontSize: 14, fontWeight: FontWeight.w600,),
            AppTextField(name: "Purpose", hint: "What's this for?", keyboardType: TextInputType.text, textInputAction: TextInputAction.done, padding: EdgeInsets.symmetric(vertical: 0),),
            UIHelper.verticalSpaceXXXL,
            AppButton(
              width: Get.width, backgroundColor: isFormValid ? c.primary : c.disabled,
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 28.0),
              borderRadius: 48,
              onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  // submit logic
                }
              },
              label: 'Proceed',
            ),
          ],
        ),
      ),
    );
  }
}
