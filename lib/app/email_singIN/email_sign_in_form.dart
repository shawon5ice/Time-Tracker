import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/email_singIN/validators.dart';
import 'package:time_tracker_app/app/widgets/custom_buttons.dart';
import 'package:time_tracker_app/services/auth.dart';

enum EmailSignInFormType {
  signIn,
  register,
}

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  EmailSignInForm({Key? key, required this.auth}) : super(key: key);

  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool _submitButtonEnabled = false;
  bool _formSubmitted = false;
  bool _isLoading = false;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInFormType formType = EmailSignInFormType.signIn;
  String get _email => emailController.text;
  String get _password => passwordController.text;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    //adding listener to enable/disable submit button
    emailController.addListener(() {
      _submitButtonEnabled =
          _email.isNotEmpty && _password.isNotEmpty ? true : false;
      setState(() {
        this._submitButtonEnabled = _submitButtonEnabled;
      });
    });

    passwordController.addListener(() {
      _submitButtonEnabled =
          _email.isNotEmpty && _password.isNotEmpty ? true : false;
      setState(() {
        this._submitButtonEnabled = _submitButtonEnabled;
      });
    });
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void _submit() async {
    setState(() {
      _formSubmitted = true;
      _isLoading = true;
    });
    try {
      await Future.delayed(Duration(seconds: 3));
      if (EmailSignInFormType.register == formType) {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.singInWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Something went worng'),
          content: Text(e.toString()),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete() {
    final _newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(_newFocus);
  }

  void _toggleFormType() {
    setState(
      () {
        formType = formType == EmailSignInFormType.signIn
            ? EmailSignInFormType.register
            : EmailSignInFormType.signIn;
        _formSubmitted = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _buildChildren(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    String primaryText =
        formType == EmailSignInFormType.signIn ? 'Sign In' : 'Register';
    String secondaryText = formType == EmailSignInFormType.signIn
        ? 'Need an Account? Register'
        : 'Already have an Account? SignIn';
    bool _submitButtonEnabled = widget.emailValidator.isValid(_email) &&
            widget.passwordValidator.isValid(_password) &&
            !_isLoading
        ? true
        : false;

    return [
      _emailTextField(),
      SizedBox(
        height: 10,
      ),
      _passwordTextField(),
      SizedBox(
        height: 10,
      ),
      NormalElevatedButton(
        buttonText: primaryText,
        textColor: Colors.white,
        callback: _submitButtonEnabled && !_isLoading ? _submit : null,
        backgroundColor: Colors.indigo,
        isLoading: _isLoading,
      ),
      SizedBox(
        height: 10,
      ),
      TextButton(
        child: Text(
          secondaryText,
        ),
        onPressed: !_isLoading ? _toggleFormType : null,
      )
    ];
  }

  TextField _passwordTextField() {
    bool _showErrorText =
        _formSubmitted && !widget.emailValidator.isValid(_password);
    return TextField(
      onEditingComplete: _submitButtonEnabled? _submit :null,
      focusNode: _passwordFocusNode,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        enabled: !_isLoading,
        errorText: _showErrorText ? widget.passwordEmptyErrorText : null,
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: 'Password',
        hintText: 'Enter your password',
      ),
      textInputAction: TextInputAction.done,
      maxLines: 1,
    );
  }

  TextField _emailTextField() {
    bool _showErrorText =
        _formSubmitted && !widget.emailValidator.isValid(_email);
    return TextField(
      focusNode: _emailFocusNode,
      onEditingComplete: _emailEditingComplete,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        enabled: !_isLoading,
        errorText: _showErrorText ? widget.emailEmptyErrorText : null,
        prefixIcon: Icon(Icons.mail),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        labelText: 'Email',
        hintText: 'Enter a valid Email',
      ),
      textInputAction: TextInputAction.next,
      maxLines: 1,
    );
  }
}
