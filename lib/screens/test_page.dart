import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ssn_qos/accentColors/main_screen_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

// List<StaggeredGridTile> _cardTile = <StaggeredGridTile>[
//   StaggeredGridTile.count(
//     mainAxisCellCount: 2,
//     crossAxisCellCount: 2,
//     child: Text("hello"),
//   ),
//   StaggeredGridTile.count(
//     mainAxisCellCount: 2,
//     crossAxisCellCount: 3,
//     child: Text("hello"),
//   ),
//   StaggeredGridTile.count(
//     mainAxisCellCount: 4,
//     crossAxisCellCount: 3,
//     child: Text("hello"),
//   ),
//   StaggeredGridTile.count(
//     mainAxisCellCount: 2,
//     crossAxisCellCount: 2,
//     child: Text("hello"),
//   ),
// ];

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;

  BackGroundTile({required this.backgroundColor, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(icondata, color: Colors.white),
    );
  }
}

//List of Cards with color and icon
List<Widget> _listTile = <Widget>[
  BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
  BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit),
  BackGroundTile(backgroundColor: Colors.pink, icondata: Icons.landscape),
  BackGroundTile(backgroundColor: Colors.green, icondata: Icons.portrait),
];

class screen3 extends StatelessWidget {
  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: top_bar_color,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: ButtonBar(
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),

              children: [
                Container(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                      onPressed: null,
                      child: Image.asset(
                        'assets/images/menu_icon.png',
                      ),
                    )),
                Container(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                        onPressed: null,
                        child:
                            SvgPicture.asset('assets/images/left_top_x.svg'))),
                Container(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        onPressed: null,
                        child: Image.asset('assets/images/avatar_white.png'))),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 246, 248, 246),
                borderRadius: BorderRadius.all(Radius.circular(43.0))),
            // color: Colors.transparent,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: imageList[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}