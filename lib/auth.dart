import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_block/shared/colors.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String _password;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Container(
                  height: 400.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100.0),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Newsblock.png',
                            width: 100,
                            height: 100,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'News Block',
                            style: TextStyle(
                              color: AppColors.deepBlue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'Everything You Want To Know',
                            style: TextStyle(
                              color: AppColors.darkTextColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          TabBar(
                            isScrollable: false,
                            indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  color: AppColors.deepBlue, width: 3.5),
                              insets:
                                  EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 70.0),
                            ),
                            labelPadding: EdgeInsets.only(top: 25.0),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                            unselectedLabelColor: AppColors.lightBlue,
                            unselectedLabelStyle: TextStyle(fontSize: 18),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorWeight: 4,
                            indicatorColor: AppColors.deepBlue,
                            labelColor: AppColors.deepBlue,
                            tabs: [
                              Tab(text: 'Sign Up'),
                              Tab(text: 'Sign In'),
                            ],
                          ),
                          SizedBox(
                            height: 70.0,
                          ),
                          Expanded(
                            child: Container(
                              child: TabBarView(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: ListView(
                                      children: [
                                        AppTextField(
                                          labelText: 'Email',
                                          hintText: 'Enter email address',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        SizedBox(height: 40.0),
                                        PasswordField(
                                          labelText: 'Password',
                                          hintText: 'Enter password',
                                          onFieldSubmitted: (String value) {
                                            setState(() {
                                              this._password = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 60.0,
                                        ),
                                        ElevatedButton(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color:
                                                    AppColors.lightTextColor),
                                          ),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: AppColors.deepBlue,
                                            padding: EdgeInsets.all(18.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: ListView(
                                      children: [
                                        AppTextField(
                                          labelText: 'Email',
                                          hintText: 'Enter email address',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                        SizedBox(height: 40.0),
                                        PasswordField(
                                          labelText: 'Password',
                                          hintText: 'Enter password',
                                          onFieldSubmitted: (String value) {
                                            setState(() {
                                              this._password = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 60.0,
                                        ),
                                        ElevatedButton(
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                color:
                                                    AppColors.lightTextColor),
                                          ),
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            primary: AppColors.deepBlue,
                                            padding: EdgeInsets.all(18.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key key,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.helperText,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.maxLength,
    this.suffixIcon,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String helperText;
  final int maxLength;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.0,
          ),
        ),
        SizedBox(height: 10.0),
        TextFormField(
          obscureText: obscureText,
          onSaved: onSaved,
          validator: validator,
          maxLength: maxLength,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(20.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.darkTextColor),
            helperText: helperText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      obscureText: _obscureText,
      maxLength: 16,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      keyboardType: TextInputType.visiblePassword,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: widget.helperText,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(_obscureText
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined),
      ),
    );
  }
}
