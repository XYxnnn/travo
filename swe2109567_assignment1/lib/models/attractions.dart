class Attractions {
  String name;
  String imagePath;
  int distance;
  String comment;
  String category;
  String address;
  String description;
  bool like;
  bool recommendation;

  Attractions({
    required this.name,
    required this.imagePath,
    required this.distance,
    required this.comment,
    required this.category,
    required this.address,
    required this.description,
    required this.like,
    required this.recommendation
  });

  static List<Attractions> myAttraction = [
    Attractions(
        name: 'Petronas Towers',
        imagePath: 'assets/images/twintower.jpg',
        distance: 36,
        comment: '"The best attraction in KL!!!!!"',
        category: 'Landmark',
        address: 'PETRONAS Twin Towers, Kuala Lumpur',
        description: 'PETRONAS Twin Towers are the tallest twin towers in the world, and its status has remained unchallenged since 1996. We welcome you to Malaysia’s proudest icon and architectural wonder, lined with an endless shopping and touring experience.',
        like: true,
        recommendation: true
    ),

    Attractions(
        name: 'Pavilion Kuala Lumpur',
        imagePath: 'assets/images/pavilion.jpg',
        distance: 35,
        comment: '"Award-winning shopping mall"',
        category: 'Shopping',
        address: '168 Jalan Bukit Bintang, Kuala Lumpur',
        description: 'Pavilion Kuala Lumpur, also known as Pavilion KL, is a shopping centre situated in the Bukit Bintang district in Kuala Lumpur, Malaysia.',
        like: true,
        recommendation: true
    ),

    Attractions(
        name: 'Kuala Lumpur Tower',
        imagePath: 'assets/images/kltower.png',
        distance: 34,
        comment: '"Breathtaking views of the city"',
        category: 'Landmark',
        address: '2 Jalan Punchak, Off, Jalan P. Ramlee, KL',
        description: 'The Kuala Lumpur Tower, colloquially referred to as KL Tower, is a 6-storey, 421-metre-tall telecommunication tower in Kuala Lumpur, Malaysia. '
            'It is the seventh-tallest tower in the world. It features an antenna which increases its height to 421 metres.',
        like: false,
        recommendation: false
    ),

    Attractions(
        name: 'KLCC Park                  ',
        imagePath: 'assets/images/klccpark.png',
        distance: 37,
        comment: '"Great musical fountain show!"',
        category: 'Nature',
        address: 'LotNo.241, Suria, Kuala Lumpur City Centre',
        description: 'The KLCC Park is an urban park in Kuala Lumpur City Centre. '
            'The park has been designed to provide greenery to Petronas Twin Towers and the areas surrounding it.',
        like: false,
        recommendation: true
    ),

    Attractions(
        name: 'Petaling Street',
        imagePath: 'assets/images/petaling.png',
        distance: 33,
        comment: '"A must-visit for experience!"',
        category: 'Amusement',
        address: 'Jalan Petaling, City Centre, Kuala Lumpur',
        description: 'Petaling Street in Kuala Lumpur is a bustling and vibrant hub of Chinatown. '
            'It is a sensory delight with street food, stalls, and a wide range of goods.',
        like: true,
        recommendation: true
    ),

    Attractions(
        name: 'Camp5 Climbing Gym',
        imagePath: 'assets/images/camp5.png',
        distance: 45,
        comment: '"Nice experience!!!"',
        category: 'Exercise',
        address: 'KL Eco City, 3, Jalan Bangsar, Kuala Lumpur',
        description: 'Camp5 is the Largest Climbing Gym in Asia, located only 20min from downtown KL, 1 Utama Shopping Center. Housed in a 20m high glass tower, climbers enjoy panorama views with full air conditioning. Shower and lockers are available. Refuel at the Camp5 Cafe.',

        like: false,
        recommendation: false
    ),

    Attractions(
        name: 'Batu Caves',
        imagePath: 'assets/images/batucave.png',
        distance: 45,
        comment: '"Highly recommended!!!!!"',
        category: 'Nature',
        address: 'Gombak, 68100 Batu Caves, Selangor',
        description: 'Petaling Street in Kuala Lumpur is a bustling and vibrant hub of Chinatown. '
            'It is a sensory delight with street food, stalls, and a wide range of goods.',
        like: true,
        recommendation: true
    ),

    Attractions(
        name: 'SuperPark Malaysia',
        imagePath: 'assets/images/superpark.png',
        distance: 45,
        comment: '"Friendly place!"',
        category: 'Exercise',
        address: 'Shopping Mall, Kampung Baru, KL',
        description: 'The SuperPark is bursting at the seams with an array of family activities for every age and every taste.'
            'The SuperPark experience is one of unstoppable fun!',
        like: false,
        recommendation: false
    ),
  ];

  static List <Attractions> getAttractions() {
    List <Attractions> allAttraction = [];
    allAttraction = Attractions.myAttraction;

    List <Attractions> attraction = [];
    for (Attractions a in allAttraction) {
      attraction.add(a);
    }
    return attraction;
  }

  static List <Attractions> getAttractionsByCategory(String category) {
    List <Attractions> allAttraction = [];
    allAttraction = Attractions.getAttractions();

    List <Attractions> attraction = [];
    for (Attractions a in allAttraction) {
      if (a.category == category) {
        attraction.add(a);
      }
    }
    return attraction;
  }

  static List <Attractions> getAttractionsByDistance() {
    List <Attractions> allRAttraction = [];
    allRAttraction = Attractions.getAttractions();

    List <Attractions> sorted = allRAttraction;

    sorted.sort((a, b) => a.distance.compareTo(b.distance));

    return sorted;
  }

  static List <Attractions> getLikedAttractions() {
    List <Attractions> allAttractions = [];

    allAttractions = Attractions.myAttraction;

    List <Attractions> liked = [];
    for (Attractions a in allAttractions) {
      if (a.like == true) {
        liked.add(a);
      }
    }

    return liked;
  }

  static List <Attractions> getRecommendationAttractions() {
    List <Attractions> allAttractions = [];

    allAttractions = Attractions.myAttraction;

    List <Attractions> recommendation = [];
    for (Attractions a in allAttractions) {
      if (a.recommendation == true) {
        recommendation.add(a);
      }
    }

    return recommendation;
  }

  static List <Attractions> getTopAttractions() {
    List <Attractions> allRAttraction = [];
    allRAttraction = Attractions.getRecommendationAttractions();

    List <Attractions> topAttraction = [];

    int index = 0;
    for (Attractions a in allRAttraction) {
      if (index < 2) {
        topAttraction.add(a);
        index++;
      }
    }
    return topAttraction;
  }
}
