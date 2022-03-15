import 'package:flutter/material.dart';
import 'package:flutter_project_main/login_page.dart';

import 'database.dart';

GlobalKey<FormState> key = GlobalKey<FormState>();
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Map data = {
  'buy': [
    {
      'title': '2 BHK Flat for Sale Global Lifestyle, in Hinjewadi',
      'desc':
          'Global Lifestyle is a well planned development spread over 2 acres designed with a perspective to keep you amidst green ambience for healthy living. Located in the heart of IT corridor at Hinjawadi, easily accessible from Mumbai Pune Expressway, this project boast 2BHK apartments in Ground + 17 storey building with breathtaking views of the landscape & surroundings.Sample flat ready.50% Construction completed.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h0_w320/2018/07/18/Project-Photo-1-Global-Lifestyle-Pune-5092844_1200_1200_0_320.jpg',
      'price': '₹61.3 Lac',
      'area': '691 sqft',
    },
    {
      'title': '5 BHK Flat for Sale Gateway Towers, in Amanora Park Town',
      'desc':
          'Brilliant architecture, spectacular designs, marvellous finesse all these are yet a notch lower than what defines Gateway Towers at Amanora. Enwrapped in the Swarovski glamour, these edifices host 2 and 5 bedroom luxury apartments in Hadapsar, Punes burgeoning east. Gateway Towers, two 45 storey high rises, is also Punes tallest ever.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h0_w320/2021/03/11/Project-Photo-31-Gateway-Towers-Pune-5031075_603_877_0_320.JPG',
      'area': '4887 sqft',
      'price': '₹6.56 Cr',
    },
    {
      'title': '2 BHK Flat for Sale Rahul Arcus, in Baner',
      'desc':
          'Fired by the desire to create thoughtfully designed homes that value innovation, Rahul Constructions latest property in Pune - Arcus incorporates contemporary designs, lifestyle features and community amenities that appeal to everyone.Situated right next to Mumbai-Bengaluru Highway, Rahul Arcus is well-connected to schools, colleges, tech parks, restaurants, malls, banks and hotels. It offers a childrens play area, gym, landscaped gardens and a host of other extravagant amenities. With its earthquake-resistant framed structure, top-quality paint and woodwork, generator backup, premium quality modular switches, etc. It is quite literally, a dream seen with open eyes. Step into the Arcus of LifeHomes come with Fans, Tubelights, Exhaust fan, Water Boilers and Water purifier.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h0_w320/2020/06/01/Project-Photo-43-Rahul-Arcus-Pune-5118283_720_1280_0_320.jpg',
      'area': '932 sqft',
      'price': '₹1.04 Cr',
    },
    {
      'title': '2 BHK Flat for Sale Dreamland Allure, in Wagholi',
      'desc':
          'Allure provides for ample space for common areas and amenities. The design allows for free flow without interference. The movement of vehicles are separate from walking areas, leaving away the fumes and noise of the vehicles. A grand entrance gate with security cabin and well paved entrance avenue with landscaping to welcome you.These exquisite homes come with lavish amenities and features that make your life the best it can be.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h0_w320/2021/07/07/Project-Photo-39-Dreamland-Allure-Pune-5086772_600_800_0_320.jpg',
      'area': '759 sqft',
      'price': '₹44.5 Lac',
    },
    {
      'title': '1 BHK Flat for Sale Oxy Desire, in Wagholi',
      'desc':
          'An Elevation that provides a Beautiful Green View All building at Oxy Desire have been sufficiently elevated to provide each apartment an abundant supply of fresh air, bright sunlight and charming view of the lush green neighboring surroundings. Also the layout of the premises and exterior design of the buildings complement each other thus making the project an aesthetic landmark.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h0_w320/2018/10/22/Project-Photo-52-Oxy-Desire-Pune-5072120_617_1024_0_320.jpg',
      'area': '462 sqft',
      'price': '₹26 Lac',
    },
    {
      'title': '1 BHK Flat for Sale Shriyans, in Punawale, Pimpri Chinchwad',
      'desc':
          'A CREATION LIKE NO OTHERPunawale is the hot new destination outside Pune. And Shriyans is your door to a life of scenic luxury at this exciting location.Integra Realty and Silveroak Buildcon bring you spacious 2 & 3 BHK residences that are set amidst picturesque Bali-style landscaping so your home is truly a world apart. Forest-theme walkways, soothing river views, cool unpolluted breeze, resort - like swimming pool, clubhouse, meditation centre... youll feel youre on a luxury vacation that never ends.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/Project-Photo-12-Silveroak-Shriyans-Pune-5031658_494_924_310_462.jpg',
      'area': '492 sqft',
      'price': '₹36.4 Lac',
    },
    {
      'title': '1 BHK Flat for Sale Radhe Krishna, in Viman Nagar',
      'desc':
          'Radhe Krishna is conveniently situated in the Viman Nagar, Pune and is a project that is well planned. The prices of this meticulously planned Radhe Krishna project lie in the range of Rs. 55. 0 Lac - 1. 65 Cr. It covers an area of 4 Acre that is well-maintained. A total of 40 are present in the project',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/2022/02/21/Project-Photo-17-Radhe-Krishna-Pune-5298959_1200_1600_310_462.jpg',
      'area': '568 sqft',
      'price': '₹67 Lac',
    },
    {
      'title': '2 BHK Flat for Sale Little Earth, in Ravet, Pimpri Chinchwad',
      'desc':
          'Take your best foot ahead through a Gateway of PuneLittle Earth is a dignified Gateway of Pune, which take pleasure in tranquility of PCMC, also corroborate the cosmic connectivity with Pune. A new earth which has everything you dream for. Now every moment will realize you that you have entered at Luxurious and cutting edge project that is unlike any other you have seen.Fulfilling all your ambitions is the sole motive of living here at Little Earth. With Hinjewadi IT park, Tathawade IT park, Baner and many more business hubs around, you get everything that will help you to achieve your ambitions. From shopping malls to restaurants, from hotels to entertainment arenas around, Little Earth offers you optimum freedom to experience jubilant living. So move into the fruitful place and express yourself to the fullest',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/2020/12/07/Project-Photo-10-Little-Earth-Pune-5082354_600_800_310_462.jpg',
      'area': '429 sqft',
      'price': '₹42.2 Lac',
    },
    {
      'title': '2 BHK Flat for Sale Aryavat, in Ravet, Pimpri Chinchwad',
      'desc':
          '1, 1.5 & 2 BHK Residences @ RavetAryavat literally means the rising sun. The rising Sun brings with it light life and positivity. The Project Aryavat breathes into its residents the vibes of a vibrant lifestyle giving each one the aura of positive living Making each home resound with a joyous life, peace and positivity translating into success',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/2021/10/12/Project-Photo-21-Aryavat-Pune-5148319_1500_2000_310_462.jpg',
      'area': '622 sqft',
      'price': '₹51.5 Lac',
    },
    {
      'title': '3 BHK Flat for Sale Trinity Greens, in Wakad',
      'desc':
          'Rajmata Realty has launched its premium housing project, Trinity Greens, in Wakad, Pune. The project offers 2, 3 BHK Apartment from 0 sqft in PCMC. Among the many luxurious amenities that the project hosts are Baby Pool, Aggregate area of recreational Open Space, Closed Car Parking, Fire Protection And Fire Safety Requirements, Solid Waste Management And Disposal etc',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/2019/07/11/Project-Photo-3-Trinity-Greens-Pune-5124863_600_800_310_462.jpg',
      'area': '782 sqft',
      'price': '₹76.5 Lac',
    },
    {
      'title': '3 BHK Flat for Sale Emirus, in Laxman Nagar-Baner, Baner',
      'desc':
          'G M Kenjale Emirus in Baner, Pune by GM Kenjale Group and Kundan Spaces is a residential project.The project offers Apartment with perfect combination of contemporary architecture and features to provide comfortable living.The Apartment are of the following configurations 3BHK and 4BHKThe size of the Apartment ranges in between 163.0 Sq. mt and 292.18 Sq. mt',
      'image':
          'https://img.staticmb.com/mbphoto/property/cropped_images/2021/Nov/25/Photo_h180_w240/58170369_2_creenshot_7(2)_180_240.jpg',
      'area': '1818 sqft',
      'price': '₹3.40 Cr',
    },
  ],

  'rent': [
    {
      'title': '3 BHK Apartment for Rent in Panchshil Towers, Kharadi',
      'desc':
          '3 BHK, Multistorey Apartment is available for Rent in Kharadi, Pune for 65,000',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/2020/02/12/Project-Photo-13-Panchshil-Towers-Pune-5019803_962_1920_310_462.jpg',
      'price': '₹65,000',
      'area': '1661 sqft',
    },
    {
      'title': '1 BHK Apartment for Rent in Adreno Towers, Amanora Park Town',
      'desc':
          'The property has basic furnishings as Geyser, Kitchen trolley, gas pipeline, Lights and fan.',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h0_w320/Project-Photo-28-Adreno-Towers-Pune-5083674_506_800_0_320.jpg',
      'price': '₹18,000',
      'area': '585 sqft',
    },
    {
      'title': '2 BHK Apartment for Rent in Rohan Abhilasha, Wagholi',
      'desc':
          '2 BHK, Multistorey Apartment is available for Rent in Wagholi, Pune for 14,499',
      'image':
          'https://img.staticmb.com/mbimages/project/Photo_h310_w462/Project-Photo-68-Rohan-Abhilasha-Pune-5070314_600_800_310_462.jpg',
      'price': '₹14,499',
      'area': '805 sqft',
    },
    {
      'title': '2 BHK Apartment for Rent in Hadapsar',
      'desc': '2bhk flat for rent',
      'image':
          'https://img.staticmb.com/mbphoto/property/cropped_images/2022/Jan/13/Photo_h180_w240/58959593_10_PropertyImage648-2643824758276_180_240.jpg',
      'price': '₹15,000',
      'area': '740 sqft',
    },
    {
      'title': '2 BHK Apartment for Rent in The Cliff Garden, Hinjewadi',
      'desc':
          '2 BHK Flat is available for rent in The cliff garden, phase 3 , Hinjewadi.For more discussion and visit kindly contact with us.',
      'image':
          'https://img.staticmb.com/mbphoto/property/cropped_images/2022/Feb/24/Photo_h180_w240/47535339_2_PropertyImage680-9798767615447_180_240.jpg',
      'price': '₹15,000',
      'area': '610 sqft',
    },
    {
      'title': '1 BHK Apartment for Rent in 48 East Park, Hadapsar',
      'desc':
          '1bhk specious brand new flat for rent in 48 East Park Society, Kale Padal, Hadapsar, Pune.',
      'image':
          'https://img.staticmb.com/mbphoto/property/cropped_images/2022/Jan/06/Photo_h180_w240/58755807_3_PropertyImage784-5740750003552_180_240.jpg',
      'price': '₹9,500',
      'area': '423 sqft',
    },
    {
      'title':
          '1 BHK Apartment for Rent in Kalpataru Serenity, Manjri, Manjri Budr',
      'desc':
          'Rent Is including Society Maintenance . NO DISGUSTING TRAFFIC ; Situated in reputed, very serene, peaceful Society.Immediate connectivity to all the prime locations including Magarpatta City , Amanora Mall, Sp infocity,Quadra etc.It is associated with natural surroundings & wellaerated room.NO WATER PROBLEMS Clean, isolated drinking water is available. All basic needs of fittingsLike Corton Rod , tube lights are done in all room.All daily needed stuffs are available in malls n shops located Near to society.',
      'image':
          'https://img.staticmb.com/mbphoto/property/cropped_images/2022/Jan/13/Photo_h180_w240/58955769_6_PropertyImage872-6534307047364_180_240.jpg',
      'price': '₹10,500',
      'area': '450 sqft',
    },
  ],
};

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print('-----${MyDatabase.data}');
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Drawer(
          backgroundColor: navyblue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              drawerItem(label: "Settings"),
              drawerItem(label: "Help"),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: navyblue,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu_rounded),
            color: Colors.white,
          ),
          title: const Text(
            "GharDekho.com",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 15),
          //     child: GestureDetector(
          //       child: const CircleAvatar(
          //         backgroundColor: Colors.white,
          //         radius: 22,
          //         child: CircleAvatar(
          //           radius: 20,
          //           backgroundImage: AssetImage("asset/user.png"),
          //         ),
          //       ),
          //       onTap: () {},
          //     ),
          //   ),
          // ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("asset/bg2.jpg"), fit: BoxFit.fitHeight, opacity: 0.3),
          ),
          child: TabBarView(controller: tabController, children: [
            Center(
              child: ListView.builder(
                  itemCount: data['buy'].length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: navyblue,
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${data['buy'][index]['image']}'),
                              radius: 26.5,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "${data['buy'][index]['title']} (${data['buy'][index]['area']})",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // subtitle: Padding(
                          //   padding: const EdgeInsets.all(5),
                          //   child: Text(
                          //     "${data['buy'][index]['desc']}",
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 10,
                          //     ),
                          //     maxLines: 2,
                          //     textWidthBasis: TextWidthBasis.parent,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "${data['buy'][index]['price']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
            Center(
              child: ListView.builder(
                itemCount: data['rent'].length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: navyblue,
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage('${data['rent'][index]['image']}'),
                              radius: 26.5,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: Text(
                              "${data['rent'][index]['title']} (${data['rent'][index]['area']})",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // subtitle: Padding(
                          //   padding: const EdgeInsets.all(5),
                          //   child: Text(
                          //     "${data['rent'][index]['desc']}",
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 10,
                          //     ),
                          //     maxLines: 2,
                          //     textWidthBasis: TextWidthBasis.parent,
                          //     overflow: TextOverflow.ellipsis,
                          //   ),
                          // ),
                          trailing: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "${data['rent'][index]['price']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: MyDatabase.data.length,
                        itemBuilder: (context, index) =>
                            ListTile(
                              tileColor: navyblue,
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(MyDatabase.data[index]['image']),
                                  radius: 26.5,
                                ),
                              ),
                              title: textStyle(label: MyDatabase.data[index]['title']),
                              trailing: textStyle(label: MyDatabase.data[index]['price']),
                            ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          elevation: 10,
                          backgroundColor: navyblue,
                          child: const Icon(Icons.add, color: Colors.white,size: 30),
                          onPressed: () {
                            Navigator.pushNamed(context, 'third');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: Container(
          color: navyblue,
          child: TabBar(
            unselectedLabelColor: Colors.white54,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: [
              textStyle(
                label: "BUY",
              ),
              textStyle(
                label: "RENT",
              ),
              textStyle(
                label: "SELL",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerItem({String label = ''}) {
  return (Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MaterialButton(
        onPressed: () {},
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  ));
}

Widget textStyle({String label = ''}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: (Text(
      label,
      style: const TextStyle(
        fontSize: 20,
      ),
    )),
  );
}
