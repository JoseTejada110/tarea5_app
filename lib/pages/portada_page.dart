import 'package:flutter/material.dart';
import 'package:tarea5_app/constants.dart';
import 'package:tarea5_app/pages/clip_detail_page.dart';
import 'package:tarea5_app/widgets/sabt_widget.dart';

const String _firstDescription =
    'James Todd Spader es un actor estadounidense. Sus papeles son reconocidos por los particulares toques excéntricos y dramáticos en sus películas.';
const String _secondDescription =
    'Megan Boone es una actriz estadounidense. Es conocida por su papel de Elizabeth Keen en la serie The Blacklist emitida por NBC.';
const String _thirdDescription =
    'Diego Klattenhoff es un actor canadiense, más conocido por interpretar a Donald Ressler en la serie The Blacklist.';
const String _fourthDescription =
    'Amir Arison es un actor estadounidense, más conocido por su papel de Aram Mojtabai en la serie de la cadena norteamericana NBC Blacklist.';

const String _firstClipDescription =
    'Raymond Reddington se entrega al FBI al inicio de la serie para empezar su función de informante, ofreciendo al FBI atrapar a los criminales más peligrosos.';
const String _secondClipDescription =
    'Elizabeth Keen conoce por primera vez a Raymond Reddington (cuando se entregó al FBI puso como condición que si querían que él hiciera de informante solo hablaría con ella) más adelante en la serie nos hace pensar que Reddington tiene un vínculo familiar con Elizabeth.';
const String _thirdClipDescription =
    'Tom Keen se prepara para darle caza a un alemán el cual tenía conexiones que él necesitaba (no recuerdo bien para que).';

class PortadaPage extends StatelessWidget {
  const PortadaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Constants.primaryColor,
            pinned: true,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              title: const SABT(
                child: Text('The Blacklist'),
              ),
              background: Image.asset(
                'assets/img/portada.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFillRemaining(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                Text(
                  'Cuando el exagente de gobierno y fugitivo Raymond "Red" Reddington se entrega al FBI, les hace una oferta que no podrán rechazar. Bajo la misteriosa condición de que sólo trabajará con la reciente graduada de Quantico, Elizabeth Keen, éste se compromete a ayudar a capturar criminales de una lista que él creó, la cual incluye a políticos, mafiosos, espías y terroristas internacionales -empezando por el terrorista, creído muerto, Ranko Zamani-. Mientras los dos persiguen a su presa, Red obliga a su aprendiz a pensar como un criminal para visualizar la situación en su totalidad.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Personajes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _ActorsHorizontalList(),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Momentos',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _FavoriteMoments(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActorsHorizontalList extends StatelessWidget {
  const _ActorsHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildActorContainer(
            context,
            'assets/img/actor1.jfif',
            'James Spader',
            _firstDescription,
          ),
          const SizedBox(
            width: 10.0,
          ),
          _buildActorContainer(
            context,
            'assets/img/actriz2.jfif',
            'Megan Boone',
            _secondDescription,
          ),
          const SizedBox(
            width: 10.0,
          ),
          _buildActorContainer(
            context,
            'assets/img/actor3.jfif',
            'Diego Klattenhoff',
            _thirdDescription,
          ),
          const SizedBox(
            width: 10.0,
          ),
          _buildActorContainer(
            context,
            'assets/img/actor4.jfif',
            'Amir Arison',
            _fourthDescription,
          ),
        ],
      ),
    );
  }

  Widget _buildActorContainer(
      BuildContext context, String image, String name, String description) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _ActorDetailDialog(
            name: name,
            description: description,
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              width: 100,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActorDetailDialog extends StatelessWidget {
  const _ActorDetailDialog({
    Key? key,
    required this.name,
    required this.description,
  }) : super(key: key);
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          IconButton(
            tooltip: 'Cerrar',
            color: Colors.white,
            splashRadius: 25,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

class _FavoriteMoments extends StatelessWidget {
  const _FavoriteMoments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildMomentContainer(
            context,
            'assets/img/clip1_image.png',
            'Reddington se entrega al FBI',
            _firstClipDescription,
            'assets/clips/clip1.mp4',
          ),
          const SizedBox(
            width: 10.0,
          ),
          _buildMomentContainer(
            context,
            'assets/img/clip2_image.png',
            'Elizabeth conoce a Reddington',
            _secondClipDescription,
            'assets/clips/clip2.mp4',
          ),
          const SizedBox(
            width: 10.0,
          ),
          _buildMomentContainer(
            context,
            'assets/img/clip3_image.png',
            'Tom se prepara para una misión',
            _thirdClipDescription,
            'assets/clips/clip3.mp4',
          ),
        ],
      ),
    );
  }

  Widget _buildMomentContainer(
    BuildContext context,
    String image,
    String name,
    String description,
    String pathToVideo,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ClipDetailPage(
              clipName: name,
              pathToVideo: pathToVideo,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              height: 100,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              width: 100,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
