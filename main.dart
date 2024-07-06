import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Interior Designer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final List<String> languages = [
    "English",
    "Türkçe",
    "Français",
    "Pусский",
    "Italiano",
    "Deutsch",
    "Nederlands",
    "Indonesia"
  ];
  String? _selectedLanguage;

  void _onLanguageSelected(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _next() {
    if (_selectedLanguage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GenderSelectionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Language'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(languages[index]),
                  selected: _selectedLanguage == languages[index],
                  onTap: () => _onLanguageSelected(languages[index]),
                );
              },
            ),
          ),
          if (_selectedLanguage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _next,
                child: Text('Next'),
              ),
            ),
        ],
      ),
    );
  }
}

class GenderSelectionPage extends StatefulWidget {
  @override
  _GenderSelectionPageState createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  String? _selectedGender;

  void _onGenderSelected(String? gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _continue() {
    if (_selectedGender != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeightEntryPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Gender'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Male'),
            leading: Radio<String>(
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: _onGenderSelected,
            ),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio<String>(
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: _onGenderSelected,
            ),
          ),
          Spacer(),
          if (_selectedGender != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _continue,
                child: Text('Continue'),
              ),
            ),
        ],
      ),
    );
  }
}

class HeightEntryPage extends StatefulWidget {
  @override
  _HeightEntryPageState createState() => _HeightEntryPageState();
}

class _HeightEntryPageState extends State<HeightEntryPage> {
  TextEditingController _heightController = TextEditingController();

  void _continue() {
    String height = _heightController.text.trim();
    if (height.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WeightEntryPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Height'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your height';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continue,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightEntryPage extends StatefulWidget {
  @override
  _WeightEntryPageState createState() => _WeightEntryPageState();
}

class _WeightEntryPageState extends State<WeightEntryPage> {
  TextEditingController _weightController = TextEditingController();

  void _continue() {
    String weight = _weightController.text.trim();
    if (weight.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AgeEntryPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Weight'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your weight';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continue,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class AgeEntryPage extends StatefulWidget {
  @override
  _AgeEntryPageState createState() => _AgeEntryPageState();
}

class _AgeEntryPageState extends State<AgeEntryPage> {
  TextEditingController _ageController = TextEditingController();

  void _continue() {
    String age = _ageController.text.trim();
    if (age.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExerciseListPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Age'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _continue,
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseListPage extends StatelessWidget {
  final List<String> exercises = [
    "Brisk Walking or Jogging",
    "Yard Work (mowing, raking)",
    "Dancing",
    "Biking",
    "Swimming",
    "Climbing stairs or Hills",
    "Playing tennis or Basketball"
  ];

  final Map<String, String> exerciseImages = {
    "Brisk Walking or Jogging": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlEZRCeUqjW3QIwOKLeStPxMDZq1PT9Yq4jw&s',
    "Yard Work (mowing, raking)": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjGgMFIwIURJGdf0QTL41eP2ii6F7BwkOy8g&s',
    "Dancing": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjkusCpX7FPEFAGroBokqU-PX2boGSmmY1iA&s',
    "Biking": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-2B7M65cDN--R3gptjEu3n6WaztZY-NSSAQ&s',
    "Swimming": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZgDvbdVtbw7wg62aggd_drgcHpThi3maB5g&s',
    "Climbing stairs or Hills": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKXhrEEgR_GcRgGcWNat2-oF4FtLUgdzoOlg&s',
    "Playing tennis or Basketball": 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjtor6KQjWWehpIQ5m4Q8tI0QarsrL5OskAg&s',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise List for Healthy Body'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailPage(
                    exercise: exercises[index],
                    imageUrl: exerciseImages[exercises[index]]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ExerciseDetailPage extends StatelessWidget {
  final String exercise;
  final String imageUrl;

  ExerciseDetailPage({required this.exercise, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              exercise,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.network(imageUrl),
          ],
        ),
      ),
    );
  }
}
