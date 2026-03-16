# 🚀 Quick Start Guide - Student Guidance Platform

## Installation

```bash
# 1. Get dependencies
flutter pub get

# 2. Run the app
flutter run

# 3. Press 'r' to hot reload during development
# 4. Press 'R' for hot restart
```

## Project Overview

```
📱 App Structure:
┌─────────────────────────────────────┐
│      Splash Screen (3 sec)           │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│    Onboarding (3 pages)              │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│   Login / Signup                     │
└────────────────┬────────────────────┘
                 ↓
┌─────────────────────────────────────┐
│   Dashboard (Home with 3 Cards)      │
├─────────────────────────────────────┤
│ ┌─────────┐ ┌──────────┐ ┌────────┐ │
│ │Passed   │ │Current   │ │Exams   │ │
│ │Out      │ │Student   │ │        │ │
│ │Students │ │Opps      │ │        │ │
│ └────┬────┘ └────┬─────┘ └───┬────┘ │
└──────┼───────────┼────────────┼──────┘
       ↓           ↓            ↓
    Alumni     Internships   Exam Prep
```

## File Structure at a Glance

```
lib/
├── main.dart                 ← Entry point
├── app.dart                  ← Routes & config
├── core/
│   ├── theme/               ← Colors, fonts, styles
│   ├── constants/           ← Strings, dimensions
│   └── utils/               ← Helpers, mock data
├── widgets/                 ← Reusable UI components
├── models/                  ← Data classes
└── modules/                 ← Feature screens
    ├── auth/               ← Login, signup, onboarding
    ├── dashboard/          ← Home screen
    ├── passed_out/         ← Alumni
    ├── current_student/    ← Opportunities
    └── competitive_exams/  ← Exams
```

## Key Routes

| Route | Screen | Purpose |
|-------|--------|---------|
| `/` | SplashScreen | Initial loading |
| `/onboarding` | OnboardingScreen | Feature introduction |
| `/login` | LoginScreen | User authentication |
| `/signup` | SignupScreen | Account creation |
| `/dashboard` | DashboardScreen | Main hub (3 cards) |
| `/passed_out` | PassedOutStudentsScreen | Alumni network |
| `/current_student` | CurrentStudentScreen | Job opportunities |
| `/competitive_exams` | CompetitiveExamsScreen | Exam preparation |

## Common Tasks

### ✏️ Add a New Screen

1. Create file in `lib/modules/feature/screens/your_screen.dart`
2. Create StatelessWidget or StatefulWidget
3. Add route to `lib/app.dart`:
   ```dart
   '/your_route': (context) => YourScreen(),
   ```
4. Navigate using:
   ```dart
   Navigator.pushNamed(context, '/your_route');
   ```

### 🎨 Customize Colors

Edit `lib/core/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF6366F1);  // Change this
```

### 📝 Add Mock Data

Edit `lib/core/utils/mock_data_provider.dart`:
```dart
static List<YourModel> getYourData() {
  return [
    YourModel(/* data */),
  ];
}
```

### 📜 Update Strings

Edit `lib/core/constants/app_strings.dart`:
```dart
static const String yourString = 'Your text here';
```

### 🎯 Change Dimensions

Edit `lib/core/constants/app_dimensions.dart`:
```dart
static const double yourDimension = 16.0;
```

## Useful Widgets

### Building a Card UI
```dart
PremiumCard(
  child: Column(
    children: [
      Text('Title'),
      SizedBox(height: 16),
      Text('Content'),
    ],
  ),
)
```

### Building a Button
```dart
GradientButton(
  label: 'Click Me',
  onPressed: () {
    print('Button pressed');
  },
)
```

### Building a Form Field
```dart
CustomTextField(
  label: 'Email',
  hint: 'you@example.com',
  validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
)
```

### Building a List with Search
```dart
SearchBar(
  onChanged: (query) {
    setState(() {
      filteredList = list.where((item) 
        => item.name.contains(query)).toList();
    });
  },
)

ListView.builder(
  itemCount: filteredList.length,
  itemBuilder: (context, index) => ListTile(
    title: Text(filteredList[index].name),
  ),
)
```

## Navigation Examples

### Push (Go to screen)
```dart
Navigator.pushNamed(context, '/dashboard');
```

### Push Replacement (Replace current screen)
```dart
Navigator.pushReplacementNamed(context, '/login');
```

### Pop (Go back)
```dart
Navigator.pop(context);
```

### Pop Until (Go back to specific screen)
```dart
Navigator.popUntil(context, ModalRoute.withName('/dashboard'));
```

## State Management

### Local State (StatefulWidget)
```dart
bool isSelected = false;

setState(() {
  isSelected = !isSelected;  // Update state
});
```

### Filtering Lists
```dart
List<Item> filtered = items.where((item) 
  => item.name.contains(query)).toList();
```

## Form Validation

### Email Validation
```dart
if (!email.isValidEmail()) {
  return 'Invalid email';  // From extension in app_extensions.dart
}
```

### Password Validation
```dart
if (password.length < 6) {
  return 'Minimum 6 characters';
}
```

### Match Fields
```dart
if (password != confirmPassword) {
  return 'Passwords must match';
}
```

## Hot Tips 🔥

1. **Use Extensions**: `16.0.h` creates `SizedBox(height: 16)`
2. **Use Constants**: Never use magic numbers
3. **Use Null-Safety**: Always check nullable values
4. **Reuse Widgets**: Create components in `widgets/`
5. **Mock Before Backend**: Keep mock data ready
6. **Test Navigation**: Ensure all routes work
7. **Check Responsive**: Test on different screen sizes
8. **Use Padding**: Don't hardcode spacing

## Debugging

### Print Statements
```dart
print('Debug: $variable');
```

### Hot Reload
Press `r` in terminal while app is running

### Hot Restart
Press `R` in terminal to restart app

### Check Errors
Look at the console for error messages

## Testing Your Changes

```bash
# Run the app
flutter run

# Run specific screen by modifying main.dart
// Testing different routes
home: DashboardScreen(),  // Replace temporarily

# Build APK
flutter build apk --release
```

## Common Issues & Fixes

### ❌ `package not found`
```bash
flutter pub get
flutter clean
flutter pub get
```

### ❌ Yellow/Red warning bars
Usually safe, but check console. Use:
```bash
flutter analyze
```

### ❌ App freezes
Check for infinite loops or heavy computations in build methods

### ❌ Widget not updating
Wrap changes in `setState()`

## Before Going to Production

- [ ] All routes tested
- [ ] No console errors
- [ ] Responsive on all devices
- [ ] Forms validate correctly
- [ ] No hardcoded strings (use constants)
- [ ] Images optimized
- [ ] Removed debug prints
- [ ] Code formatted: `flutter format lib/`
- [ ] Tests passing: `flutter test`
- [ ] Build successful: `flutter build apk --release`

## Useful Commands

```bash
flutter pub get              # Download dependencies
flutter pub upgrade          # Upgrade dependencies
flutter clean                # Clean build
flutter format lib/          # Format code
flutter analyze              # Check for issues
flutter test                 # Run tests
flutter devices              # List connected devices
flutter run -v               # Verbose output
flutter build apk --release  # Build Android APK
flutter build ios --release  # Build iOS
flutter build web --release  # Build Web
```

## Need Help?

1. Check `PROJECT_SUMMARY.md` for detailed docs
2. Look at similar screens for patterns
3. Check `core/utils/app_extensions.dart` for helpers
4. Use `core/constants/` for strings and dimensions
5. Study widget examples in `widgets/`

---

**Good luck! Happy coding! 🎉**
