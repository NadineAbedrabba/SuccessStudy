import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/userInfos.dart';
import 'package:flutter_application_1/rest/profile.dart';
import 'package:flutter_application_1/widgets/custom_app_bar_2.dart';
import 'package:flutter_application_1/widgets/espace_etudiant_widgets.dart';
import 'package:flutter_application_1/widgets/footer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<void> _profileFuture;
  late ProfileModel? _profile;
  @override
  void initState() {
    super.initState();
    _profileFuture = _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    _profile = await ProfileApi.getProfileDetails();
    print(_profile);
    // Call setState if you want to update the UI with the fetched data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0), // Adjust height as needed
        child: CustomAppBar2(), // Use your CustomAppBar here
      ),
         drawer: CustomDrawer(),
      body: FutureBuilder(
          future: _profileFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasError)
              // If an error occurred
              return Text('Error: ${snapshot.error}');
            return DefaultTabController(
              length: 3, // Number of tabs
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Color(0xFFFFB703),
                    labelColor: Color(0xFFFFB703),
                    indicatorWeight: 3.0,
                    tabs: [
                      Tab(icon: Icon(Icons.person)),
                      Tab(icon: Icon(Icons.drafts)),
                      Tab(icon: Icon(Icons.security)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ProfileTab(
                          profile: _profile!,
                        ),
                        Documents(),
                        Security(profile: _profile!),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({
    super.key,
    required this.profile,
  });
  final ProfileModel profile;
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  late Future<void> _profileFuture;
  bool _obscureText = true; // Boolean to manage password visibility
  Country? selectedCountry;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _emailController.text = widget.profile.email;
    _firstNameController.text = widget.profile.firstName;
    _lastNameController.text = widget.profile.lastName;
    _countryController.text = widget.profile.pays;
    _phoneController.text = widget.profile.tel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFB703),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 20),
            // Image.asset("assets/images/add-image.png"),
            Stack(
              children: [
                // Circle background with border and icon in the center
                Container(
                    width: 122,
                    height: 122,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFFFB703), // Border color (yellow)
                        width: 2.0,
                      ),
                      color: Color(0xFFF2F2F2), // Very light grey background
                    ),
                    child: Image(
                      image: AssetImage("assets/images/graduated.png"),
                    )),
                // Edit icon positioned at the bottom right
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 37,
                    width: 37,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color:
                          Colors.white, // White background for the small circle
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFFFB703), // Border color (yellow)
                        width: 2.0,
                      ),
                    ),
                    child: Icon(
                      Icons.edit, // Edit icon
                      size: 20.0,
                      color: Color(0xFFFFB703), // Icon color (yellow)
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomTextInputField(
              controller: _lastNameController,
              label: 'Nom',
              icon: Icons.person,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextInputField(
              controller: _firstNameController,
              label: 'Prénom',
              icon: Icons.person,
              inputType: TextInputType.text,
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
            SizedBox(height: 20),
            CountryPickerField(
              controller: _countryController,
              countryLabel: 'Pays',
              initialValue: widget.profile!.pays,
            ),
            SizedBox(height: 20),
            NiveauField(),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  final _newProfile = ProfileModel(
                      id: widget.profile!.id,
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      pays: _countryController.text,
                      tel: _phoneController.text);
                  if (_newProfile != widget.profile) {
                    if (await ProfileApi.updateProfile(
                        widget.profile!.id!, _newProfile)) {
                      // Show a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Update successful'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      // Show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Update failed!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFB703),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Modifier les informations',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Documents extends StatelessWidget {
  const Documents({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Documents'),
      ),
    );
  }
}

class Security extends StatefulWidget {
  const Security({super.key, required this.profile});
  final ProfileModel profile;
  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Sécurité',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFFB703),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Changer mot de passe',
                style: TextStyle(
                  color: Color(0xFF219EBC),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 20),
            PasswordInputField(
              controller: _passwordController,
              passwordLabel: 'Entrez votre ancien mot de passe',
            ),
            SizedBox(height: 20),
            PasswordInputField(
              controller: _newPasswordController,
              passwordLabel: 'Entrez votre nouveau mot de passe',
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () async {
                  if (await ProfileApi.updateProfilePassword(
                      widget.profile!.id!,
                      _passwordController.text,
                      _newPasswordController.text)) {
                    // Show a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Update successful'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    // Show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Update failed!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFB703),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Changer mot de passe',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
