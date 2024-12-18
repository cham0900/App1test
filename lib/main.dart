import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

// หน้าแรก (HomePage)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Image.asset('assets/logo.png', height: 120),
            const SizedBox(height: 70),
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.image, size: 80, color: Colors.green),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Log in', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Sign up!', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// หน้า LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void validateAndProceed() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Please fill in all fields."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: validateAndProceed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Log in', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// หน้า SignUpPage
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final facultyController = TextEditingController();
  final interestController = TextEditingController();

  void validateAndProceed() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        facultyController.text.isEmpty ||
        interestController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Please fill in all fields."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name')),
              const SizedBox(height: 10),
              TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name')),
              const SizedBox(height: 10),
              TextField(
                  controller: facultyController,
                  decoration: const InputDecoration(labelText: 'Faculty')),
              const SizedBox(height: 10),
              TextField(
                  controller: interestController,
                  decoration: const InputDecoration(labelText: 'Interests')),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: validateAndProceed,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade200),
                child: const Text('Sign Up', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/1.jpg', // รูปที่ 1
      'assets/1.jpg', // รูปที่ 2
      'assets/1.jpg', // รูปที่ 3
    ];

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.pink.shade200,
        actions: [
          // ไอคอนค้นหา
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // เปิดหน้าค้นหาเมื่อกด
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ชื่อ "name" และภาพด้านบน
            Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: Icon(Icons.image, color: Colors.green, size: 18),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'name',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),

            // ส่วนแสดงภาพแบบ PageView
            const SizedBox(height: 8),
            SizedBox(
              height: 180,
              child: PageView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 180,
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(imageList.length, (dotIndex) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: index == dotIndex
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // หัวข้อ Update
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Text(
                'Update',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),

            // ภาพล่างคำว่า Update (แค่ 3 ภาพ)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 3, // แสดงแค่ 3 รูป
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/1.jpg', // ภาพซ้ำ
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ไอคอนด้านล่างเหมือนในรูป
      bottomNavigationBar: BottomAppBar(
        color: Colors.red.shade900, // สีแดงเข้มเหมือนในรูป
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.folder, 'portfolio'),
            _buildNavItem(Icons.book, 'นิยาย'),
            const SizedBox(width: 40), // ช่องว่างสำหรับไอคอน Home ตรงกลาง
            _buildNavItem(Icons.edit, 'ทดลอง'),
            _buildNavItem(Icons.chat, 'เรื่องเล่า'),
          ],
        ),
      ),

      // ไอคอน Home ตรงกลาง
      // ไอคอน Home ตรงกลาง
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade900,
        onPressed: () {
           Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: const Icon(Icons.home, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  
  



  // ฟังก์ชันสำหรับสร้างไอคอนด้านล่าง
  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

// หน้าค้นหาใหม่
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.pink.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter search query',
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Search for something...',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
