import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/widgets/espace_etudiant_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true; // Boolean to manage password visibility
  Country? selectedCountry;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _registerUser() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3009/api/v1/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _emailController.text,
        'password': _passwordController.text,
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'tel': _phoneController.text,
        'pays': _countryController.text,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      print(data);
      // Handle successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Activation link Sent, check your email!'),
          backgroundColor: Colors.green,
        ),
      );
      // Optionally navigate to another screen or reset form
      //Navigator.pushReplacementNamed(context, '/login'); // Example navigation
    } else {
      // Handle error and show a message to the user
      final errorData = jsonDecode(response.body);
      final errorMessage = errorData['message'] ?? 'An unknown error occurred';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: $errorMessage'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Adjust height as needed
        child: SizedBox(height: 100), // Use your CustomAppBar here
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 96,
                        width: 140,
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit
                              .contain, // Ensure the image fits without cropping
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Inscription',
                        style: TextStyle(
                          color: Color(0xFF023047),
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Profil',
                  style: TextStyle(
                    color: Color(0xFF023047), // Set the label color
                    fontSize: 16.0, // Set the label font size
                    fontWeight:
                        FontWeight.bold, // Optionally set the font weight
                  ),
                ),
                SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Profil', // Optional placeholder text
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(
                        color: Colors.grey, // Set the border color
                        width: 0.7,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(
                            255, 66, 67, 67), // Darker color when focused
                        width: 1.0,
                      ),
                    ),
                    filled: true, // Enable fill color
                    fillColor: Color(0xFFF8F8F8),
                  ),
                  style: TextStyle(color: Color.fromARGB(255, 66, 67, 67)),
                  items: [
                    DropdownMenuItem(
                        value: 'Etudiant', child: Text('Etudiant')),
                    DropdownMenuItem(
                        value: 'Professeur', child: Text('Université')),
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextInputField(
                        controller: _firstNameController,
                        label: 'Prénom',
                        icon: Icons.person,
                        inputType: TextInputType.text,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextInputField(
                        controller: _lastNameController,
                        label: 'Nom',
                        icon: Icons.person,
                        inputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextInputField(
                  controller: _emailController,
                  label: 'Adresse e-mail',
                  icon: Icons.email,
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                PhoneInputField(
                    controller: _phoneController,
                    phoneLabel: 'Numéro de téléphone'),
                CountryPickerField(
                  controller: _countryController,
                  countryLabel: 'Pays',
                ),
                SizedBox(height: 20),
                PasswordInputField(
                    controller: _passwordController,
                    passwordLabel: 'Mot de passe'),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _registerUser,
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 80.0),
                      backgroundColor: Color(0xFFFFB703),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vous avez déja un compte ? ',
                            style: TextStyle(
                              color: Color(0xFF023047),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: 'Se connecter',
                            style: TextStyle(
                              color: Color(0xFFFFB703),
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Add your onTap functionality here
                                Navigator.pushNamed(context, '/login');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
