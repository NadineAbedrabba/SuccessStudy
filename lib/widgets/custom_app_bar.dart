import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.0); // Adjust the total preferred height
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedLanguage = 'Fr'; // Default selected language
  Map<String, String> languageFlags = {
    'Fr': 'assets/images/fr.png',
    'En': 'assets/images/en.png',
  }; // Language flags

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 20.0), // Adjust the total preferred height
      child: AppBar(
        titleSpacing: 0.0, // Remove default title spacing
        automaticallyImplyLeading: false, // Remove back button
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(40.0, 90.0, 40.0, 10.0), // Adjusted padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the top
            children: [
              // Logo on the left
              SizedBox(
                height: 61,
                width: 89,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain, // Ensure the image fits without cropping
                ),
              ),

              // Language switcher dropdown on the right wrapped in Container
              Container(
                decoration: BoxDecoration(
                  color: selectedLanguage == null
                      ? Color.fromARGB(255, 246, 246, 246)
                      : Color.fromRGBO(255, 183, 3, 1), // Yellow background color when selected
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners for the container
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0), // Padding adjustment
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedLanguage,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                      });
                      // Update selected language
                    },
                    items: languageFlags.keys.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          color: selectedLanguage == value
                              ? Color.fromRGBO(255, 183, 3, 1) // Yellow background for selected item
                              : null,
                          child: Row(
                            children: [
                              Image.asset(
                                languageFlags[value]!,
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                value,
                                style: TextStyle(
                                  color: selectedLanguage == value
                                      ? Colors.white // Text color based on selected state
                                      : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    // Customize the underline of the DropdownButton
                    underline: Container(
                      height: 2,
                      color: Colors.transparent, // Transparent color to remove the default underline
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