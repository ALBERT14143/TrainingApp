import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app2/components/app_button.dart';
import 'package:test_app2/components/app_textfield.dart';
import 'package:test_app2/provider/bloc_provider.dart';

class DetailsView extends StatelessWidget {
  static const id = "/details";
  const DetailsView({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final blocUser = BlocProvider.of(context)!.usersBloc;
    

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AppTextField(
              controller: blocUser.fnameCtrlr, 
              hintText: "First name", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: blocUser.mnameCtrlr, 
              hintText: "Middle name", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: blocUser.lnameCtrlr, 
              hintText: "Last name", 
              preffix: Icon(Icons.person)
            ),
            AppTextField(
              controller: blocUser.addressCtrlr, 
              hintText: "Address", 
              preffix: Icon(Icons.pin_drop_outlined)
            ),
            AppTextField(
              controller: blocUser.emailCtrlr, 
              hintText: "Email", 
              preffix: Icon(Icons.alternate_email_outlined)
            ),

            AppButton(
              title: "Update", 
              onpressed: () async {
                await blocUser.updateUser();
              }
            ),
            AppButton(
              title: "Delete", 
              onpressed: (){
                
              }
            )
        ],
      ),
    );
  }
}