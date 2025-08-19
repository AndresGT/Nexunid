import 'dart:ui';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 📱 Feed
              Expanded(
                flex: 2,
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    _buildPost(
                      context,
                      userName: "AndresGT",
                      userHandle: "@andres_dev",
                      userAvatar: "https://i.pravatar.cc/150?img=3",
                      timeAgo: "2h",
                      postText:
                          "Explorando un nuevo diseño moderno ✨🔥\n¿Qué opinan?",
                      postImage:
                          "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?w=800",
                      likes: 240,
                      comments: 54,
                      shares: 12,
                    ),
                    const SizedBox(height: 20),
                    _buildPost(
                      context,
                      userName: "María López",
                      userHandle: "@marialpz",
                      userAvatar: "https://i.pravatar.cc/150?img=5",
                      timeAgo: "5h",
                      postText:
                          "Un café ☕ con buen diseño es la mejor inspiración.",
                      postImage:
                          "https://images.unsplash.com/photo-1506765515384-028b60a970df?w=800",
                      likes: 180,
                      comments: 34,
                      shares: 7,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 24),

              // 📊 Columna derecha
              Expanded(
                flex: 1,
                child: ListView(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  children: [
                    _glassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "🔥 Tendencias",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          _TrendItem("#Flutter", "25.3K posts"),
                          _TrendItem("#UIUX", "14.1K posts"),
                          _TrendItem("#Design2025", "8.4K posts"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _glassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "👥 Personas sugeridas",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 16),
                          _SuggestedUser(
                            "Carlos Díaz",
                            "@carlitodev",
                            "https://i.pravatar.cc/150?img=12",
                          ),
                          _SuggestedUser(
                            "Laura Pérez",
                            "@lauracode",
                            "https://i.pravatar.cc/150?img=15",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorScheme.primary, colorScheme.tertiary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  // 📱 Post moderno con glassmorphism
  Widget _buildPost(
    BuildContext context, {
    required String userName,
    required String userHandle,
    required String userAvatar,
    required String timeAgo,
    required String postText,
    required String postImage,
    required int likes,
    required int comments,
    required int shares,
  }) {
    return _glassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(backgroundImage: NetworkImage(userAvatar)),
            title: Text(
              userName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              "$userHandle • $timeAgo",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            trailing: Icon(Icons.more_horiz, color: Colors.grey[600]),
          ),
          if (postText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                postText,
                style: const TextStyle(fontSize: 15, height: 1.4),
              ),
            ),
          if (postImage.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(postImage, fit: BoxFit.cover, height: 240),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _reaction(Icons.favorite_border, "$likes"),
                _reaction(Icons.mode_comment_outlined, "$comments"),
                _reaction(Icons.share_outlined, "$shares"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🌫️ Glassmorphism card con degradado
  static Widget _glassCard({required Widget child}) {
    return Builder(
      builder: (context) {
        final brightness = Theme.of(context).brightness;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: brightness == Brightness.dark
                      ? [
                          Colors.white.withOpacity(0.06),
                          Colors.white.withOpacity(0.02),
                        ]
                      : [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.2),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }

  Widget _reaction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }
}

class _TrendItem extends StatelessWidget {
  final String hashtag;
  final String posts;
  const _TrendItem(this.hashtag, this.posts);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hashtag, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(posts, style: TextStyle(color: Colors.grey[500], fontSize: 13)),
        ],
      ),
    );
  }
}

class _SuggestedUser extends StatelessWidget {
  final String name;
  final String handle;
  final String avatar;
  const _SuggestedUser(this.name, this.handle, this.avatar);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(backgroundImage: NetworkImage(avatar)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        handle,
        style: TextStyle(color: Colors.grey[600], fontSize: 13),
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        ),
        child: const Text("Seguir"),
      ),
    );
  }
}
