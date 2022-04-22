import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_stories/utils/colors.dart';
import 'package:user_stories/utils/dimensions.dart';
import 'package:user_stories/widgets/big_text.dart';

import '../controllers/login_controller.dart';
import '../widgets/input_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: Dimension.dimen30,right: Dimension.dimen30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ScaleTransition(
                  scale: _animation,
                  child: BigText(
                    text: 'Welcome',size: Dimension.dimen30,color: primaryColor
                  ),
                ),
                SizedBox(height: Dimension.dimen30),
                textField(
                    controller: controller.usernameController,
                    keyBoard: TextInputType.text,
                    hintText: 'Username',
                    obscureText: false,
                    prefixIconData: Icons.badge,
                    suffixIconData: null,

                focusBorderColor: primaryColor),
                SizedBox(height: Dimension.dimen20),
                textField(
                    controller: controller.passwordController,
                    hintText: 'Password',
                    obscureText: controller.passwordVisible
                        ? false
                        : true,
                    prefixIconData: Icons.lock_outline,
                    suffixIconData: controller.passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onVisibility: () {
                      controller.togglePassword();
                    },
                focusBorderColor: primaryColor),
                SizedBox(height: Dimension.dimen30),
                //LOGIN BUTTON
                Container(
                  width: Get.width - Dimension.dimen30 * 2,
                  height: Dimension.dimen50,
                  margin: const EdgeInsets.only(bottom: 1),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          size: Dimension.dimen30,
                          color: Colors.white,
                        ),
                        SizedBox(width: Dimension.dimen20),
                        BigText(
                          text:'Login',
                          size: Dimension.dimen16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onPressed: () {
                      controller.login(context);
                    },
                  ),
                ),
                const Spacer()
              ],
            ),
          );
        }
      ),
    );
  }
}
