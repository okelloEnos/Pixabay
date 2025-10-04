import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_web/core/widgets/custom_text.dart';
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
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Full Name", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 4.0),
            TextField(controller: _fullNameController,),
            const SizedBox(height: 16.0),
            const Text("Email", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 4.0),
            TextField(controller: _emailController,),
            const SizedBox(height: 16.0),
            const Text("Favourite Category", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 4.0),
            DropdownButton<String>(
              value: favouriteCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  favouriteCategory = newValue!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text("Password", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 4.0),
            TextField(controller: _passwordController, obscureText: true,),
            const SizedBox(height: 16.0),
            const Text("Confirm Password", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 4.0),
            TextField(
              controller: _confirmPasswordController, obscureText: true,),
            const SizedBox(height: 24.0),
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
               if(state is ProfileSuccess){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Profile submitted successfully : ${state.id}"))
                );
               } else if(state is ProfileFailure){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${state.errorMessage}"))
                );
               }
              },
              builder: (context, state) {
                return
                  state is ProfileLoading ? const CircularProgressIndicator() :
                  ElevatedButton(
                  onPressed: () {
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
                  child: const Text("Save Changes"),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
