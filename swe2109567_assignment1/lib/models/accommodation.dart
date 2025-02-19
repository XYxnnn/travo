class Accommodation {
  String name;
  String imagePath;
  int distance;
  String category;
  double rating;
  int price;
  String address;
  String description;
  bool like;
  bool recommendation;

  Accommodation({
    required this.name,
    required this.imagePath,
    required this.distance,
    required this.category,
    required this.rating,
    required this.price,
    required this.address,
    required this.description,
    required this.like,
    required this.recommendation
  });

  static List <Accommodation> myAccommodations = [
    Accommodation(
        name: 'Hilton Kuala Lumpur',
        imagePath: 'assets/images/hilton.jpg',
        distance: 10,
        category: 'Hotel',
        rating: 5.0,
        price: 270,
        address: '3, Jalan Stesen Sentral, Kuala Lumpur',
        description: 'In the heart of Kuala Lumpur, Hilton Kuala Lumpur is within a 5-minute drive of Central Market and Merdeka Square. '
            'This 5-star hotel is 2.7 mi (4.3 km) from Mid Valley Megamall and 3 mi (4.8 km) from Berjaya Times Square. ',
        like: true,
        recommendation: true
    ),

    Accommodation(
        name: 'Dorsett Residence',
        imagePath: 'assets/images/dorsett.jpg',
        distance: 5,
        category: 'Apartment',
        rating: 5.0,
        price: 245,
        address: '172, Jalan Imbi, Kuala Lumpur',
        description: 'Located in Kuala Lumpur (Bukit Bintang), Dorsett Residences Bukit Bintang at Dorsett Kuala Lumpur is within a 15-minute walk of Pavilion Kuala Lumpur and Berjaya Times Square. '
            'This upscale aparthotel is 2.7 km from Petronas Twin Towers and 2.3 km from KLCC Park. ',
        like: false,
      recommendation: true
    ),

    Accommodation(
        name: 'CitizenM Kuala Lumpur',
        imagePath: 'assets/images/citizenm.png',
        distance: 7,
        category: 'Apartment',
        rating: 4.0,
        price: 170,
        address: '128, Jln Pudu, Bukit Bintang, Kuala Lumpur',
        description: 'A stay at citizenM Kuala Lumpur Bukit Bintang places you in the heart of Kuala Lumpur, within a 15-minute walk of Berjaya Times Square and Jalan Alor. '
            'This hotel is 0.8 km from Petaling Street and 2.4 km from Pavilion Kuala Lumpur. ',
        like: false,
        recommendation: false
    ),

    Accommodation(
        name: 'Seri Pacific Hotel KL',
        imagePath: 'assets/images/seri.png',
        distance: 52,
        category: 'Hotel',
        rating: 4.0,
        price: 315,
        address: 'Jalan Putra, Chow Kit, 50350 Kuala Lumpur',
        description: 'Connected to World Trade Centre Kuala Lumpur, this hotel boasts an outdoor pool and a spa with sauna and hot tub. It also houses a gym and 3 dining options. '
            'Featuring a modern décor, luxurious rooms at Seri Pacific Hotel are fitted with wooden flooring. ',
        like: false,
        recommendation: false
    ),

    Accommodation(
        name: 'Sunway Putra Hotel KL',
        imagePath: 'assets/images/sunway.png',
        distance: 37,
        category: 'Hotel',
        rating: 4.5,
        price: 309,
        address: 'Putra Place, Jalan Putra, Kuala Lumpur',
        description: 'Sunway Putra Hotel Kuala Lumpur is located opposite the World Trade Centre Kuala Lumpur, nestled within the Diamond Triangle, one of Kuala Lumpur’s most known districts with local and trendy cafes and bars, bustling markets and landmarks. ',
        like: false,
        recommendation: true
    ),

    Accommodation(
        name: 'Scarletz Suites KLCC',
        imagePath: 'assets/images/scarletz.png',
        distance: 38,
        category: 'Apartment',
        rating: 3.0,
        price: 273,
        address: 'Jalan Yap Kwan Seng, Kuala Lumpur',
        description: 'Situated in Kuala Lumpur, less than 1 km from Petronas Twin Towers and 1.3 km from the centre, Scarletz Suites KLCC, Travelet features air-conditioned accommodation with free WiFi, and a rooftop pool. A hot tub and a car rental service are available for guests. ',
        like: false,
        recommendation: false
    ),

    Accommodation(
        name: 'Santa Grand Signature',
        imagePath: 'assets/images/santa.png',
        distance: 52,
        category: 'Hotel',
        rating: 4.0,
        price: 283,
        address: 'Menara Santa Jalan Ampang, Kuala Lumpur',
        description: 'Set in Kuala Lumpur, 1.6 km from Petronas Twin Towers, Santa Grand Signature Kuala Lumpur offers accommodation with an outdoor swimming pool, private parking, a fitness centre and a restaurant. The property is within 2.4 km of the city centre. ',
        like: false,
        recommendation: true
    ),

    Accommodation(
        name: 'Grand Millennium KL',
        imagePath: 'assets/images/grand.png',
        distance: 35,
        category: 'Hotel',
        rating: 5.0,
        price: 716,
        address: 'Menara Santa Jalan Ampang, Kuala Lumpur',
        description: 'Situated opposite Fahrenheit, Grand Millennium Kuala Lumpur is located along Bintang Walk beside Pavilion Shopping Mall. Offering free WiFi access, it also has a health club with a spa, air-conditioned squash courts and 4 dining options. ',
        like: true,
        recommendation: true
    )
  ];

  static List <Accommodation> getAccommodations() {
    List <Accommodation> allAccommodation = [];

    allAccommodation = Accommodation.myAccommodations;

    List <Accommodation> accommodation = [];
    for (Accommodation a in allAccommodation) {
      accommodation.add(a);
    }

    return accommodation;
  }

  static List <Accommodation> getAccommodationsByDistance() {
    List <Accommodation> allRAccommodation = [];
    allRAccommodation = Accommodation.getAccommodations();

    List <Accommodation> sorted = allRAccommodation;

    sorted.sort((a, b) => a.distance.compareTo(b.distance));

    return sorted;
  }

  static List <Accommodation> getAccommodationsByRating() {
    List <Accommodation> allRAccommodation = [];
    allRAccommodation = Accommodation.getAccommodations();

    List <Accommodation> sorted = allRAccommodation;

    sorted.sort((a, b) {
      if (a.rating > b.rating) {
        return -1;
      }
      else if (a.rating < b.rating) {
        return 1;
      }
      else {
        return 0;
      }
    });

    return sorted;
  }

  static List <Accommodation> getLikedAccommodations() {
    List <Accommodation> allAccommodation = [];

    allAccommodation = Accommodation.myAccommodations;

    List <Accommodation> liked = [];
    for (Accommodation a in allAccommodation) {
      if (a.like == true) {
        liked.add(a);
      }
    }

    return liked;
  }

  static List <Accommodation> getRecommendationAccommodations() {
    List <Accommodation> allAccommodation = [];

    allAccommodation = Accommodation.myAccommodations;

    List <Accommodation> recommendation = [];
    for (Accommodation a in allAccommodation) {
      if (a.recommendation == true) {
        recommendation.add(a);
      }
    }

    return recommendation;
  }

  static List <Accommodation> getTopAccommodation() {
    List <Accommodation> allRAccommodation = [];
    allRAccommodation = Accommodation.getRecommendationAccommodations();

    List <Accommodation> topAccommodation = [];

    int index = 0;
    for (Accommodation a in allRAccommodation) {
      if (index < 2) {
        topAccommodation.add(a);
        index++;
      }
    }
    return topAccommodation;
  }
}