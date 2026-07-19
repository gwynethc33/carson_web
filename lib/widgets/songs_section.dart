import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carson_web/widgets/responsive_scale.dart';


class SongsSection extends StatelessWidget {
  const SongsSection({super.key});

  Future<void> openSpotify(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception("Could not open Spotify link");
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    final songs = [
      const SongInfo(
        name: "Song One",
        artist: "Artist One",
        spotifyLink: "https://open.spotify.com/track/YOUR_FIRST_LINK",
      ),
      const SongInfo(
        name: "Song Two",
        artist: "Artist Two",
        spotifyLink: "https://open.spotify.com/track/YOUR_SECOND_LINK",
      ),
      const SongInfo(
        name: "Song Three",
        artist: "Artist Three",
        spotifyLink: "https://open.spotify.com/track/YOUR_THIRD_LINK",
      ),
    ];

    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 32 * r,
        vertical: 45 * r,
      ),
      child: Column(
        children: [
          Text(
            "OUR SONGS...",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 34 * r,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              letterSpacing: 3,
              fontFamily: "DancingScript",
            ),
          ),

          SizedBox(height: 38 * r),

          isMobile
              ? Column(
                  children: songs.map((song) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 36 * r),
                      child: VinylSongCard(
                        song: song,
                        onTap: () => openSpotify(song.spotifyLink),
                      ),
                    );
                  }).toList(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: songs.map((song) {
                    return Expanded(
                      child: VinylSongCard(
                        song: song,
                        onTap: () => openSpotify(song.spotifyLink),
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}

class VinylSongCard extends StatefulWidget {
  final SongInfo song;
  final VoidCallback onTap;

  const VinylSongCard({
    super.key,
    required this.song,
    required this.onTap,
  });

  @override
  State<VinylSongCard> createState() => _VinylSongCardState();
}

class _VinylSongCardState extends State<VinylSongCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final r = Responsive.scale(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: isHovered ? 1.06 : 1,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/vinyl.png",
                    width: 190 * r,
                    height: 190 * r,
                    fit: BoxFit.contain,
                  ),
                ],
              ),

              SizedBox(height: 18 * r),

              Text(
                widget.song.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18 * r,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 4 * r),

              Text(
                widget.song.artist,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14 * r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SongInfo {
  final String name;
  final String artist;
  final String spotifyLink;

  const SongInfo({
    required this.name,
    required this.artist,
    required this.spotifyLink,
  });
}