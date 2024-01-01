import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/profile_update_controller.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUpdateController>(
      init: ProfileUpdateController(),
      builder: (profileupdatecontroller) {
        return Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20
            ),
            title: const Text("Profile Update"),
          ),
          body: ModalProgressHUD(
            inAsyncCall: profileupdatecontroller.loading,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Name", style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          //  const Text("Please don't use Dr. before your first name!", style: TextStyle(
                          //   fontWeight: FontWeight.normal,
                          //   color: Colors.red,
                          //   fontSize: 12,
                          
                          // ),),
                          const SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.nameController,
                            onChanged: (value){
                   profileupdatecontroller.myProfile.name = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              filled: true,
                              suffixIcon: const Icon(Icons.drive_file_rename_outline),
                              fillColor: Colors.grey.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                            ),
                          ),
                          const SizedBox(height: 20,),

                        
                    



                          const Text("Phone", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.phoneController,
                            onChanged: (value){
                   profileupdatecontroller.myProfile.mobile = value;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(

                                hintText: 'Enter your phone number',
                                filled: true,
                                suffixIcon: const Icon(Icons.phone),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          const SizedBox(height: 20,),


                          const Text("Email", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 10,),
                          TextField(
                            controller: profileupdatecontroller.emailController,
                            onChanged: (value){
                   profileupdatecontroller.myProfile.email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: 'Enter your email',
                                filled: true,
                                suffixIcon: const Icon(Icons.email),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          const SizedBox(height: 20,),

                          const Text("Address", style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 10,),
                          TextField(

                            controller: profileupdatecontroller.addressController,
                            onChanged: (value){
                   profileupdatecontroller.myProfile.address = value;
                            },

                            decoration: InputDecoration(
                                hintText: 'Enter your address',
                                filled: true,
                                suffixIcon: const Icon(Icons.location_on),
                                fillColor: Colors.grey.withOpacity(0.1),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          const SizedBox(height: 20,),
                      

                          
                          

                         
                         
                          Row(
                            children: [
                              const Text("Profile Image : ", style: TextStyle(fontWeight: FontWeight.bold),),
                              ElevatedButton(onPressed: (){
                                profileupdatecontroller.chooseImage(context, true);
                              }, child: const Text("Select Image"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
                              const SizedBox(width: 10,),
                              if(profileupdatecontroller.profileImage!=null)
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: FileImage(File(profileupdatecontroller.profileImage!.path)),
                                    radius: 40,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: IconButton(onPressed: (){
                                            profileupdatecontroller.deleteProfileImage();

                                          }, icon: const Icon(Icons.delete_forever, color: Colors.white,)),

                                        )
                                      ],
                                    ),
                                  ),
                                )

                            ],
                          ),


                        
                     
                          const SizedBox(height: 20,),
                         Container(
                           width: double.infinity,
                           child: ElevatedButton(onPressed: (){
                             profileupdatecontroller.updateProfile();
 Get.find<ProfileUpdateController>().updateProfile();
                             //by hanif
                              // DoctorHomeScreenController.instance
                              //   .fetchProfile();
                           }, child: const Text("Update"), style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),),
                         )
                        ],
                      ),
                    ),


                  ),
                )
              ],
            ),
          ),

        );
      }
    );
  }
}
