import 'package:flutter/material.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  bool classCalendarEnabled = false;
  bool callReminderEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010A04),
      appBar: AppBar(
        backgroundColor: const Color(0xff010A04),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Mishal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Image
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/profile/profileAvathr.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Premium Card
              Container(
                height: 135,
                padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7FFA88), Color(0xFF2A662E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(
                      10), // Rounded corners for a smoother look
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 22,
                                width: 73,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Popular',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            const Spacer(),
                              const Text(
                                'Connect Premium',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Text(
                                'And get unlimited training',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/profile/Frame 24.png',
                          width: 175,
                          height: 132,
                          
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Settings List
              _buildSettingItem(
                icon: Icons.edit,
                title: 'Edit Profile',
                onTap: () {
                  // Handle edit profile
                },
              ),
              _buildSettingItem(
                icon: Icons.notifications_outlined,
                title: 'Notification Preference',
                onTap: () {
                  // Handle notification settings
                },
              ),
              _buildSettingItemWithSwitch(
                icon: Icons.calendar_today,
                title: 'Class Calendar',
                value: classCalendarEnabled,
                onChanged: (value) {
                  setState(() {
                    classCalendarEnabled = value;
                  });
                },
              ),
              _buildSettingItemWithSwitch(
                icon: Icons.phone,
                title: 'Call Reminder',
                value: callReminderEnabled,
                onChanged: (value) {
                  setState(() {
                    callReminderEnabled = value;
                  });
                },
              ),
              _buildSettingItem(
                icon: Icons.payment,
                title: 'Payments',
                onTap: () {
                  // Handle payments
                },
              ),
              _buildSettingItem(
                icon: Icons.card_giftcard,
                title: 'Referral, Voucher & Gift Cards',
                onTap: () {
                  // Handle referrals and vouchers
                },
              ),
              _buildSettingItem(
                icon: Icons.support_agent,
                title: 'Support',
                onTap: () {
                  // Handle support
                },
              ),
              _buildSettingItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xff161816),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItemWithSwitch({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFF161816),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Transform.scale(
                scale:
                    0.7, // Adjust this value to match your desired dimensions
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: const Color(0xFF347A39),
                  activeTrackColor: const Color(0xFF7FFA88),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(0xff161816),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
