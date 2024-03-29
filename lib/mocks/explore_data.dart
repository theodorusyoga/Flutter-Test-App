import '../model/explore_model.dart';
import '../model/explore_item_model.dart';

List<ExploreModel> exploreMocks = <ExploreModel>[
  ExploreModel(
      id: 'uuid-1',
      title: 'Discover your new favorite meal',
      description: 'Inspired by Eats you explored',
      exploreItems: <ExploreItemModel>[
        ExploreItemModel(
          id: 'uuid-example-1',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-2',
          name: 'Sate Mak Syukur Bintaro',
          description: 'Indonesian',
          location: 'Bintaro',
          imagePath: 'lib/assets/images/sate.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-3',
          name: 'Nasi Goreng Babah Rafi',
          description: 'Indonesian',
          location: 'Bintaro',
          imagePath: 'lib/assets/images/mie_goreng.jpg',
        ),
      ]),
  ExploreModel(
      id: 'uuid-2',
      title: 'Nearest COVID-19 test facilities',
      description: '',
      exploreItems: <ExploreItemModel>[
        ExploreItemModel(
          id: 'uuid-example-1',
          name: 'RSIA Bina Medika International',
          description: 'Hospital',
          location: 'Serpong',
          imagePath: 'lib/assets/images/hospital.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-2',
          name: 'RS Premiere International',
          description: 'Hospital',
          location: 'Bintaro',
          imagePath: 'lib/assets/images/hospital_2.jpg',
        ),
      ]),
  ExploreModel(
      id: 'uuid-3',
      title: '',
      description: '',
      exploreItems: <ExploreItemModel>[
        ExploreItemModel(
          id: 'uuid-example-1',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-2',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-3',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-4',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        )
      ]),
  ExploreModel(
      id: 'uuid-4',
      title: '',
      description: '',
      exploreItems: <ExploreItemModel>[
        ExploreItemModel(
          id: 'uuid-example-1',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-2',
          name: 'Sate Mak Syukur Bintaro',
          description: 'Indonesian',
          location: 'Bintaro',
          imagePath: 'lib/assets/images/sate.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-3',
          name: 'Nasi Goreng Babah Rafi',
          description: 'Indonesian',
          location: 'Bintaro',
          imagePath: 'lib/assets/images/nasi_goreng.jpg',
        ),
        ExploreItemModel(
          id: 'uuid-example-4',
          name: 'All In One - Lookal Kitchen BSD',
          description: 'Indonesian',
          location: 'Serpong',
          imagePath: 'lib/assets/images/sambal_matah.jpg',
        )
      ])
];
