import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/core/constants/colors.dart';
import 'package:pixabay_web/features/profile/domain/entity/profile_entity.dart';
import 'package:pixabay_web/features/profile/ui/bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String favouriteCategory = 'Nature';
  final List<String> categories = [
    'Nature',
    'Technology',
    'People',
    'Animals',
    'Travel',
    'Food',
    'Sports',
    'Arts',
    'Fashion',
    'Business'
  ];
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool fullNameInValid = false;
  bool emailInValid = false;
  bool passwordInValid = false;
  bool confirmPasswordInValid = false;
  bool categoryInValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Card(
          elevation: 3,
          surfaceTintColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          margin: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 36.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Please fill all fields to submit your profile.",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _fullNameController,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      fillColor: backgroundColor,
                      filled: true,
                      labelText: ' Enter your full name ',
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.normal),
                      prefixIcon: Icon(Icons.person_outline,
                          size: 18.0, color: Colors.grey.shade300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // borderSide: BorderSide.none
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      fillColor: backgroundColor,
                      filled: true,
                      labelText: 'Enter your email address',
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.normal),
                      prefixIcon: Icon(Icons.email_outlined,
                          size: 18.0, color: Colors.grey.shade300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // borderSide: BorderSide.none
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonFormField<String>(
                    style: const TextStyle(fontSize: 14.0),
                    decoration: InputDecoration(
                      fillColor: backgroundColor,
                      filled: true,
                      labelText: 'Select your favourite category',
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.normal),
                      prefixIcon: Icon(Icons.favorite_border,
                          size: 18.0, color: Colors.grey.shade300),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // borderSide: BorderSide.none
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 1.5),
                      ),
                    ),
                    value: favouriteCategory,
                    items: categories
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (v) => setState(
                        () => favouriteCategory = v ?? favouriteCategory),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !showPassword,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      fillColor: backgroundColor,
                      filled: true,
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.normal),
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          size: 18.0, color: Colors.grey.shade300),
                      suffixIcon: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            child: Icon(
                                showPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18.0,
                                color: Colors.grey.shade300)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // borderSide: BorderSide.none
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: !showConfirmPassword,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      fillColor: backgroundColor,
                      filled: true,
                      labelText: 'Confirm your password',
                      labelStyle: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.normal),
                      prefixIcon: Icon(Icons.lock_outline_rounded,
                          size: 18.0, color: Colors.grey.shade300),
                      suffixIcon: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                showConfirmPassword = !showConfirmPassword;
                              });
                            },
                            child: Icon(
                                showConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 18.0,
                                color: Colors.grey.shade300)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // borderSide: BorderSide.none
                        borderSide:
                            BorderSide(color: Colors.grey.shade200, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {
                      if (state is ProfileSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                "Profile submitted successfully with an ID : ${state.id}")));
                      } else if (state is ProfileFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                "An Error Occurred : ${state.errorMessage}")));
                      }
                    },
                    builder: (context, state) {
                      return Center(
                          child: state is ProfileLoading
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Submitting profile...",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey.shade400,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    const LinearProgressIndicator(),
                                  ],
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    if (_fullNameController.text
                                        .trim()
                                        .isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.orange,
                                              content: Text(
                                                  "Full Name is required")));
                                      return;
                                    } else if (_emailController.text
                                        .trim()
                                        .isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.orange,
                                              content:
                                                  Text("Email is required")));
                                      return;
                                    } else if (_passwordController.text
                                        .trim()
                                        .isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.orange,
                                              content: Text(
                                                  "Password is required")));
                                      return;
                                    } else if (_confirmPasswordController.text
                                        .trim()
                                        .isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.orange,
                                              content: Text(
                                                  "Confirm Password is required")));
                                      return;
                                    } else if (_passwordController.text
                                            .trim() !=
                                        _confirmPasswordController.text
                                            .trim()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              backgroundColor: Colors.orange,
                                              content: Text(
                                                  "Password and Confirm Password do not match")));
                                      return;
                                    }

                                    // Handle save action
                                    ProfileEntity profile = ProfileEntity(
                                      fullName: _fullNameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      favouriteCategory: favouriteCategory,
                                      password: _passwordController.text.trim(),
                                    );
                                    context.read<ProfileBloc>().add(
                                        SubmitUserInfoEvent(profile: profile));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    minimumSize: const Size(250, 45.0),
                                    // padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
                                    textStyle: const TextStyle(fontSize: 16.0),
                                  ),
                                  child: const Text("Submit Profile"),
                                ));
                    },
                  ),
                ),
                const SizedBox(height: 36.0),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
