import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'dart:math';

import 'package:my_app/presentation/pages/videocall/call_page.dart';
import 'package:my_app/presentation/pages/videocall/videocall.dart';

class Message {
  final String text;
  final bool isMe;
  final DateTime timestamp;
  final String? imagePath;

  Message({
    required this.text,
    required this.isMe,
    required this.timestamp,
    this.imagePath,
  });
}

class ChatTheme {
  final String name;
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  ChatTheme({
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
  });
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  bool _isBlocked = false;
  bool _isTyping = false;
  Timer? _typingTimer;
  int _selectedThemeIndex = 0;
  bool _showFunModel = false;
  Timer? _funModelTimer;
  String? _customWallpaper;

  final List<ChatTheme> _themes = [
    ChatTheme(
      name: 'Dark Ocean',
      primaryColor: const Color(0xFF4CAF50),
      secondaryColor: const Color(0xFF21262D),
      backgroundColor: Colors.black,
    ),
    ChatTheme(
      name: 'Sunset Vibes',
      primaryColor: const Color(0xFFFF6B35),
      secondaryColor: const Color(0xFF2D1B2E),
      backgroundColor: const Color(0xFF1A1A1A),
    ),
    ChatTheme(
      name: 'Purple Dream',
      primaryColor: const Color(0xFF9C27B0),
      secondaryColor: const Color(0xFF1A1A2E),
      backgroundColor: const Color(0xFF16213E),
    ),
    ChatTheme(
      name: 'Forest Green',
      primaryColor: const Color(0xFF2E7D32),
      secondaryColor: const Color(0xFF1B5E20),
      backgroundColor: const Color(0xFF0D1B0D),
    ),
    ChatTheme(
      name: 'Neon City',
      primaryColor: const Color(0xFF00BCD4),
      secondaryColor: const Color(0xFF263238),
      backgroundColor: const Color(0xFF121212),
    ),
  ];



  // Remove dummy messages - start with empty list
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _messageController.removeListener(_onTextChanged);
    _messageController.dispose();
    _typingTimer?.cancel();
    _funModelTimer?.cancel();
    super.dispose();
  }

  void _onTextChanged() {
    if (_messageController.text.isNotEmpty && !_isTyping) {
      setState(() {
        _isTyping = true;
      });
    }

    // Reset the timer
    _typingTimer?.cancel();
    _typingTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isTyping = false;
        });
      }
    });
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(
          Message(
            text: _messageController.text.trim(),
            isMe: true,
            timestamp: DateTime.now(),
          ),
        );
        _isTyping = false;
      });
      _messageController.clear();
      _typingTimer?.cancel();
      _scrollToBottom();
      _triggerFunModel();
    }
  }

  void _triggerFunModel() {
    if (Random().nextBool()) {
      setState(() {
        _showFunModel = true;
      });
      
      _funModelTimer?.cancel();
      _funModelTimer = Timer(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _showFunModel = false;
          });
        }
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _messages.add(
          Message(
            text: "",
            isMe: true,
            timestamp: DateTime.now(),
            imagePath: image.path,
          ),
        );
      });
      _scrollToBottom();
    }
  }

  Future<void> _pickWallpaper() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _customWallpaper = image.path;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wallpaper updated!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _showContactDetails() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _themes[_selectedThemeIndex].secondaryColor,
        title: const Text(
          'Contact Details',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: _themes[_selectedThemeIndex].backgroundColor,
              radius: 40,
              child: ClipOval(
                child: Image.network(
                  'https://img.freepik.com/premium-vector/man-personal-trainer-icon-flat-illustration-man-personal-trainer-vector-icon-web-design_98396-37283.jpg',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 40,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name: Personal Trainer',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Phone: +1 234 567 8900',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Email: trainer@gym.com',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Status: Online',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showMediaGallery() {
    final mediaMessages = _messages.where((m) => m.imagePath != null).toList();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _themes[_selectedThemeIndex].secondaryColor,
        title: const Text(
          'Media Gallery',
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: mediaMessages.isEmpty
              ? const Center(
                  child: Text(
                    'No media shared yet',
                    style: TextStyle(color: Colors.white54),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: mediaMessages.length,
                  itemBuilder: (context, index) {
                    final message = mediaMessages[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(message.imagePath!),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _themes[_selectedThemeIndex].secondaryColor,
        title: const Text(
          'Choose Theme',
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: Column(
            children: [
              // Theme selection
              Expanded(
                child: ListView.builder(
                  itemCount: _themes.length,
                  itemBuilder: (context, index) {
                    final theme = _themes[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.primaryColor,
                        radius: 12,
                      ),
                      title: Text(
                        theme.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: _selectedThemeIndex == index
                          ? const Icon(Icons.check, color: Colors.green)
                          : null,
                      onTap: () {
                        setState(() {
                          _selectedThemeIndex = index;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              const Divider(color: Colors.white24),
              // Wallpaper selection
              ListTile(
                leading: const Icon(Icons.wallpaper, color: Colors.white70),
                title: const Text(
                  'Set Custom Wallpaper',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickWallpaper();
                },
              ),
              if (_customWallpaper != null)
                ListTile(
                  leading: const Icon(Icons.clear, color: Colors.white70),
                  title: const Text(
                    'Remove Wallpaper',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      _customWallpaper = null;
                    });
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _blockUser() {
    setState(() {
      _isBlocked = !_isBlocked;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isBlocked ? 'User blocked' : 'User unblocked'),
        backgroundColor: _isBlocked ? Colors.red : Colors.green,
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final hour = timestamp.hour;
    final minute = timestamp.minute;
    final period = hour >= 12 ? 'pm' : 'am';
    final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
  }

  Widget _buildTextDivider(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: Colors.white24,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(
            child: Divider(
              color: Colors.white24,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }



  void _showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = _themes[_selectedThemeIndex];
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentTheme.backgroundColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: currentTheme.secondaryColor,
            child: ClipOval(
              child: Image.network(
                'https://img.freepik.com/premium-vector/man-personal-trainer-icon-flat-illustration-man-personal-trainer-vector-icon-web-design_98396-37283.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    color: Colors.white70,
                    size: 24,
                  );
                },
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trainer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              _isTyping ? 'Typing...' : 'Online',
              style: TextStyle(
                color: _isTyping ? Colors.green : Colors.white60,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white70),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Call feature not implemented')),
              );
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.videocam, color: Colors.white70),
          //   // onPressed: () {
          //   //  Navigator.push(context, MaterialPageRoute(builder: (context) => VideocallScreen()));
              
          //   // },
          // ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white70),
            color: currentTheme.secondaryColor,
            onSelected: (value) {
              switch (value) {
                case 'View contact':
                  _showContactDetails();
                  break;
                case 'Media, links, and docs':
                  _showMediaGallery();
                  break;
                case 'Themes':
                  _showThemeDialog();
                  break;
                case 'Block':
                  _blockUser();
                  break;
                default:
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$value selected')),
                  );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'View contact',
                child:
                    Text('View contact', style: TextStyle(color: Colors.white)),
              ),
              const PopupMenuItem(
                value: 'Media, links, and docs',
                child: Text('Media, links, and docs',
                    style: TextStyle(color: Colors.white)),
              ),
              const PopupMenuItem(
                value: 'Themes',
                child: Text('Themes', style: TextStyle(color: Colors.white)),
              ),
              const PopupMenuItem(
                value: 'Mute notifications',
                child: Text('Mute notifications',
                    style: TextStyle(color: Colors.white)),
              ),
              PopupMenuItem(
                value: 'Block',
                child: Text(_isBlocked ? 'Unblock' : 'Block',
                    style: TextStyle(
                        color: _isBlocked ? Colors.green : Colors.red)),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background wallpaper
          if (_customWallpaper != null)
            Positioned.fill(
              child: Image.file(
                File(_customWallpaper!),
                fit: BoxFit.cover,
              ),
            ),
          // Gradient overlay for better text readability
          if (_customWallpaper != null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      currentTheme.backgroundColor.withOpacity(0.7),
                      currentTheme.backgroundColor.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
          // Chat content
          Column(
            children: [
              // Date separator with dividers (only show if there are messages)
              if (_messages.isNotEmpty) _buildTextDivider('Today'),

              // Messages list
              Expanded(
                child: _messages.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 80,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Start a conversation',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: message.isMe
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (!message.isMe) ...[
                                  CircleAvatar(
                                    backgroundColor: currentTheme.secondaryColor,
                                    radius: 16,
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://img.freepik.com/premium-vector/man-personal-trainer-icon-flat-illustration-man-personal-trainer-vector-icon-web-design_98396-37283.jpg',
                                        width: 32,
                                        height: 32,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.person,
                                            color: Colors.white70,
                                            size: 16,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: message.isMe
                                        ? CrossAxisAlignment.end
                                        : CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                        ),
                                        decoration: BoxDecoration(
                                          color: message.isMe
                                              ? currentTheme.primaryColor
                                              : currentTheme.secondaryColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: const Radius.circular(18),
                                            topRight: const Radius.circular(18),
                                            bottomLeft: message.isMe
                                                ? const Radius.circular(18)
                                                : const Radius.circular(4),
                                            bottomRight: message.isMe
                                                ? const Radius.circular(4)
                                                : const Radius.circular(18),
                                          ),
                                        ),
                                        child: message.imagePath != null
                                            ? GestureDetector(
                                                onTap: () => _showImageDialog(
                                                    message.imagePath!),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                    child: Image.file(
                                                      File(message.imagePath!),
                                                      width: 250,
                                                      height: 200,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 12,
                                                ),
                                                child: Text(
                                                  message.text,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        _formatTime(message.timestamp),
                                        style: const TextStyle(
                                          color: Colors.white38,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (message.isMe) const SizedBox(width: 8),
                              ],
                            ),
                          );
                        },
                      ),
              ),

              Container(
                padding: const EdgeInsets.all(16),
                child: _isBlocked
                    ? Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red),
                        ),
                        child: const Center(
                          child: Text(
                            'You have blocked this contact',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white70,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: _pickImage,
                            child: const Icon(
                              Icons.image,
                              color: Colors.white70,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: TextField(
                                controller: _messageController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(color: Colors.white54),
                                  border: InputBorder.none,
                                ),
                                onSubmitted: (_) => _sendMessage(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: _sendMessage,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: currentTheme.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 16),
            ],
          ),
          // Fun model overlay
          // _buildFunModel(),
        ],
      ),
    );
  }
}
