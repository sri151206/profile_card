import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Varanasi Sri Madhura - Profile',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          brightness: Brightness.light,
        ),
      ),
      home: const ProfileCardScreen(),
    );
  }
}

class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});

  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF2E7D32); // Green for buttons as requested
    const vibrantGreen = Color(0xFF10B981);
    const vibrantBlue = Color(0xFF0288D1);
    const cardBorderColor = Color(0xFFE9ECEF);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF4511E), Color(0xFFFB8C00)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  // --- TOP PROFILE CARD ---
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: cardBorderColor, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        // Cover Banner
                        Container(
                          height: 90,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF7043), Color(0xFFFFB74D)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),

                        // Avatar overlapping Banner
                        Transform.translate(
                          offset: const Offset(0, -45),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Name
                              const Text(
                                'Varanasi Sri Madhura',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF212529),
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 4),

                              // Subtitle
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'B.Tech Student • MS Excel • Python • Frontend Developer',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF6C757D),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Divider & Stats
                        Transform.translate(
                          offset: const Offset(0, -30),
                          child: Column(
                            children: [
                              const Divider(height: 1, color: Color(0xFFE9ECEF)),
                              const SizedBox(height: 16),

                              // Stats Row: 130 Posts | 2.2K Followers | 100 Following
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildStatItem('130', 'Posts', const Color(0xFFD81B60)),
                                  Container(height: 30, width: 1, color: Colors.grey.shade300),
                                  _buildStatItem('2.2K', 'Followers', primaryGreen),
                                  Container(height: 30, width: 1, color: Colors.grey.shade300),
                                  _buildStatItem('100', 'Following', vibrantBlue),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Follow & Message Buttons (GREEN BUTTONS AS REQUESTED)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            isFollowing = !isFollowing;
                                          });
                                        },
                                        icon: Icon(
                                          isFollowing ? Icons.check : Icons.person_add_alt_1_rounded,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        label: Text(
                                          isFollowing ? 'Following' : 'Follow',
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryGreen,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.chat_bubble_outline_rounded,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        label: const Text(
                                          'Message',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryGreen,
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- ABOUT ME SECTION ---
                  _buildSectionCard(
                    title: 'About Me',
                    icon: Icons.person_pin_rounded,
                    iconColor: const Color(0xFFD81B60),
                    child: const Text(
                      'Passionate to learn about full stack development, python, and also empowering my skills in AI engineer',
                      style: TextStyle(
                        fontSize: 14.5,
                        height: 1.5,
                        color: Color(0xFF495057),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- SKILLS SECTION ---
                  _buildSectionCard(
                    title: 'Skills',
                    icon: Icons.code_rounded,
                    iconColor: vibrantGreen,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        _SkillChip(
                          label: 'MS Excel',
                          icon: Icons.table_chart_rounded,
                          color: Color(0xFF2E7D32),
                        ),
                        _SkillChip(
                          label: 'Frontend Developer',
                          icon: Icons.web_rounded,
                          color: Color(0xFF0288D1),
                        ),
                        _SkillChip(
                          label: 'Python',
                          icon: Icons.terminal_rounded,
                          color: Color(0xFF00897B),
                        ),
                        _SkillChip(
                          label: 'Java',
                          icon: Icons.coffee_rounded,
                          color: Color(0xFF1565C0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- CONTACT ME SECTION ---
                  _buildSectionCard(
                    title: 'Contact Me',
                    icon: Icons.contact_mail_rounded,
                    iconColor: vibrantBlue,
                    child: Column(
                      children: const [
                        _ContactTile(
                          icon: Icons.email_rounded,
                          iconColor: Color(0xFF2E7D32),
                          title: 'Email',
                          value: 'srimadhuravaranasi@gmail.com',
                        ),
                        SizedBox(height: 10),
                        _ContactTile(
                          icon: Icons.location_on_rounded,
                          iconColor: Color(0xFF0288D1),
                          title: 'Location',
                          value: 'Andhra Pradesh, India',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildStatItem(String value, String label, Color valueColor) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6C757D),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  static Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9ECEF), width: 1),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212529),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const _SkillChip({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  const _ContactTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFE9ECEF),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 2),
                SelectableText(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212529),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
