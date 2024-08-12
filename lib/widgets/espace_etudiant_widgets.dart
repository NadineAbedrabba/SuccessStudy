import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:country_picker/country_picker.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({
    super.key,
    required TextEditingController controller,
    required this.phoneLabel,
  }) : controller = controller;

  final TextEditingController controller;
  final String phoneLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          phoneLabel,
          style: TextStyle(
            color: Color(0xFF023047), // Set the label color
            fontSize: 16.0, // Set the label font size
            fontWeight: FontWeight.bold, // Optionally set the font weight
          ),
        ),
        SizedBox(height: 8.0),
        IntlPhoneField(
          controller: controller,
          decoration: InputDecoration(
            hintText: phoneLabel, // Optional placeholder text
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
            fillColor: Color(0xFFF2F2F2),
          ),
          initialCountryCode: 'TN', // Default country code
          onChanged: (phone) {
            print(phone.completeNumber); // Complete phone number
          },
        ),
      ],
    );
  }
}

class CustomTextInputField extends StatelessWidget {
  const CustomTextInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.readOnly = false,
    this.inputType = TextInputType.text,
  });

  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool readOnly;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF023047), // Set the label color
            fontSize: 16.0, // Set the label font size
            fontWeight: FontWeight.bold, // Optionally set the font weight
          ),
        ),
        SizedBox(height: 8.0),
        TextField(
          keyboardType: inputType,
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: label, // Optional placeholder text
            suffixIcon: Icon(icon, color: Colors.grey),
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
            fillColor: Color(0xFFF2F2F2),
          ),
          style: TextStyle(
              color:
                  Color.fromARGB(255, 66, 67, 67)), // Set the input text color
        )
      ],
    );
  }
}

//password widget
class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    super.key,
    required this.controller,
    required this.passwordLabel,
  });

  final TextEditingController controller;
  final String passwordLabel;

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.passwordLabel,
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        TextField(
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: _togglePasswordVisibility,
            ),
            hintText: widget.passwordLabel,
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
            fillColor: Color(0xFFF2F2F2),
          ),
          style: TextStyle(color: Color.fromARGB(255, 66, 67, 67)),
        ),
      ],
    );
  }
}

//country picker widget

class CountryPickerField extends StatefulWidget {
  CountryPickerField({
    super.key,
    required this.controller,
    required this.countryLabel,
    String? initialValue,
  }) : initialValue = initialValue ?? 'Select Country';

  final TextEditingController controller;
  final String countryLabel;
  final String initialValue;

  @override
  _CountryPickerFieldState createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerField> {
  Country? _selectedCountry;

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
          widget.controller.text = country.name; // Update the controller
        });
      },
      showPhoneCode: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.countryLabel,
          style: TextStyle(
            color: Color(0xFF023047),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        GestureDetector(
          onTap: _showCountryPicker,
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: _selectedCountry?.name ?? 'Select Country',
              suffixIcon: Icon(Icons.flag),
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
              fillColor: Color(0xFFF2F2F2),
            ),
            child: Text(
              _selectedCountry?.name ?? widget.initialValue,
              style: TextStyle(color: Color.fromARGB(255, 66, 67, 67)),
            ),
          ),
        ),
      ],
    );
  }
}

class NiveauField extends StatelessWidget {
  const NiveauField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Niveau',
          style: TextStyle(
            color: Color(0xFF023047), // Set the label color
            fontSize: 16.0, // Set the label font size
            fontWeight: FontWeight.bold, // Optionally set the font weight
          ),
        ),
        SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: 'Niveau', // Optional placeholder text
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
            fillColor: Color(0xFFF2F2F2),
          ),
          style: TextStyle(color: Color.fromARGB(255, 66, 67, 67)),
          items: [
            DropdownMenuItem(value: 'Avec Bac', child: Text('Avec Bac')),
            DropdownMenuItem(value: 'Sans Bac', child: Text('Sans Bac')),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFFF9EB),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 49,
                    width: 71,
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: 27,
                    width: 27,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFB703),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 24,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(1),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the drawer
                      },
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(
              context,
              title: 'Espace Etudiant',
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            _buildDrawerItem(
              context,
              title: 'Destinations',
              onTap: () {
                Navigator.pushNamed(context, '/destinations');
              },
            ),
            _buildDrawerItem(
              context,
              title: 'Nos Packs',
              onTap: () {
                Navigator.pushNamed(context, '/packs');
              },
            ),
            _buildDrawerItem(
              context,
              title: 'Guide d’utilisation',
              onTap: () {
                Navigator.pushNamed(context, '/guide');
              },
            ),
            _buildDrawerItem(
              context,
              title: 'À  Propos',
              onTap: () {
                Navigator.pushNamed(context, '/Apropos');
              },
            ),
            _buildDrawerItem(
              context,
              title: 'Contactez-nous',
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF023047),
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
        ),
      ),
      onTap: onTap,
    );
  }
}
