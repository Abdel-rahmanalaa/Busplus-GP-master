import 'package:flutter/material.dart';

class PassengerMyLocationScreen extends StatelessWidget {
  const PassengerMyLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Locations'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            /* const Padding(
            padding: EdgeInsets.only(left: 120, right: 120),
            child: Text(
              "My Locations",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                InkWell(
                  splashColor: Colors.teal,
                  onTap: () {},
                  child: Image.asset("assets/images/home.png",
                    width: 180,
                    height: 180,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  splashColor: Colors.teal,
                  onTap: () {},
                  child: Image.asset("assets/images/work.png",
                    width: 180,
                    height: 180,
                  ),
                ),
              ],

            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                InkWell(
                  splashColor: Colors.teal,
                  onTap: () {},
                  child: Image.asset("assets/images/gym.png",
                    width: 180,
                    height: 180,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  splashColor: Colors.teal,
                  onTap: () {},
                  child: Image.asset("assets/images/school.png",
                    width: 180,
                    height: 180,
                  ),
                ),
              ],
            ),
            /*const SizedBox(
            height: 150,
          ),*/
            /*Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(

              splashColor: Colors.teal,
              onTap: (){
                navigateBack(context, const NavigationDrawerWidget());
              },
              child: Image.asset("assets/images/Back.png",
                alignment: Alignment.bottomLeft,
                width: 70,
                height: 60,
              ),
            ),
          ),*/
          ],
        ),
      ),
    );
  }
}
