import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,title: Text("About Me"),centerTitle: true,),
      body: const Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/v2/D5603AQHoAmi9uJWD4A/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1722998479896?e=1728518400&v=beta&t=Jh9eiUz8jlde8VR_ngVDu0DOppAfq5G-SFZB5yx6Zcw"),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "As an experienced programmer with expertise in Python, C++, web development, game development, and mobile Application Development I have a proven track record of delivering high-quality software solutions. My strong analytical and problem-solving skills enable me to quickly identify issues and develop effective solutions.\n\n I have successfully collaborated with cross-functional teams to design, develop, and implement software applications that meet business requirements and deliver exceptional user experiences.\n\n My proficiency in web development technologies such as HTML, CSS, and JavaScript, combined with my knowledge of backend frameworks such as Django, allow me to create scalable and secure web applications.\n\n In addition, my experience in game development and Mobile Application Development includes working with Unreal Engine to create engaging and immersive gaming experiences and Wroking with Flutter to create immersive and needfull applications.\n\n If you're looking for a skilled programmer who can deliver innovative software solutions, feel free to connect with me. 😉",
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
