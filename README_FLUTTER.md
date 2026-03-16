# Student Guidance Platform - Flutter Frontend

A premium Flutter mobile application for Student Guidance and Opportunity Platform.

## Features

✨ **Splash & Onboarding Screens**
- Beautiful animated splash screen
- Interactive onboarding with smooth animations
- Quick navigation to login/signup

🔐 **Authentication**
- Clean login screen with validation
- Registration with password confirmation
- Form validation and error handling

📱 **Dashboard**
- Personalized welcome message
- 3 premium gradient cards:
  - Passed-out Students (Alumni Network)
  - Current Studying Students (Opportunities)
  - Competitive Exams (Exam Preparation)
- Quick statistics overview

👔 **Passed-out Students Module**
- Alumni success stories with detailed profiles
- Search and filter by department
- Skills showcase with ratings
- Interactive bottom sheets for detailed views

🎯 **Current Students Module**
- Internship and workshop opportunities
- Filter by opportunity type
- Favorite functionality
- Detailed opportunity information
- Deadline tracking

📚 **Competitive Exams Module**
- List of upcoming competitive exams
- Mock tests with difficulty levels
- Exam registration information
- Success tips and preparation resources
- Student statistics

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # App configuration and routes
├── core/
│   ├── theme/
│   │   └── app_theme.dart   # Theme configuration
│   ├── constants/
│   │   ├── app_strings.dart # App strings
│   │   └── app_dimensions.dart # Dimension constants
│   └── utils/
│       ├── app_extensions.dart # Extension methods
│       └── mock_data_provider.dart # Mock data
├── widgets/
│   ├── custom_cards.dart
│   ├── custom_buttons.dart
│   ├── custom_app_bar.dart
│   ├── custom_text_field.dart
│   ├── filter_chips.dart
│   ├── passed_out_student_card.dart
│   ├── opportunity_card.dart
│   └── exam_card.dart
├── models/
│   ├── user_model.dart
│   ├── passed_out_student_model.dart
│   ├── current_student_model.dart
│   └── exam_model.dart
└── modules/
    ├── auth/
    │   └── screens/
    │       ├── splash_screen.dart
    │       ├── onboarding_screen.dart
    │       ├── login_screen.dart
    │       └── signup_screen.dart
    ├── dashboard/
    │   └── dashboard_screen.dart
    ├── passed_out/
    │   └── passed_out_students_screen.dart
    ├── current_student/
    │   └── current_student_screen.dart
    └── competitive_exams/
        └── competitive_exams_screen.dart
```

## Design System

### Colors
- **Primary**: `#6366F1` (Indigo)
- **Primary Dark**: `#4F46E5`
- **Secondary**: `#10B981` (Green)
- **Accent**: `#F59E0B` (Amber)
- **Error**: `#EF4444` (Red)

### Typography
- **Font**: Poppins (via Google Fonts)
- **Responsive sizing**: 12px - 32px

### Components
- **Rounded corners**: 8px - 24px radius
- **Shadows**: Subtle, elevation-based
- **Spacing**: 8px - 32px padding/margins

## Features Implemented

### ✅ Premium UI
- Gradient cards with elegant colors
- Smooth page transitions
- Custom app bars with icons
- Professional form fields
- Beautiful bottom sheets
- Responsive layouts

### ✅ Navigation
- Route-based navigation
- Named routes for all screens
- Smooth screen transitions

### ✅ Data Management
- Mock data provider with complete sample data
- Model classes for all entities
- Search and filtering capabilities

### ✅ Interactivity
- Filter chips for easy filtering
- Search bars on all list screens
- Favorite/bookmark functionality
- Bottom sheet details views
- Tab navigation for exams

### ✅ Error Handling
- Form validation
- Empty state handling
- User-friendly error messages

## Dependencies

```yaml
flutter:
  sdk: flutter

cupertino_icons: ^1.0.2
google_fonts: ^6.0.0
smooth_page_indicator: ^1.1.0
intl: ^0.19.0
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / Xcode (for emulators)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd student_guidance_platform
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build APK
```bash
flutter build apk --release
```

### Build Web
```bash
flutter build web
```

## App Flow

1. **Splash Screen** → Shows animated logo (3 seconds)
2. **Onboarding Screen** → 3-page carousel with features
3. **Login/Signup Screen** → Authentication (mocked, no backend)
4. **Dashboard** → Home with 3 premium cards
5. **Module Screens** → Detail pages for each module

## UI Highlights

- 🎨 **Gradient Cards**: Beautiful gradient backgrounds with shadows
- 📱 **Responsive Design**: Works on all screen sizes
- ⚡ **Smooth Animations**: Page transitions and loading effects
- 🔍 **Search & Filter**: Find what you need quickly
- 💫 **Interactive Elements**: Buttons, chips, and sheets

## Mock Data Included

- ✅ 5 Passed-out Student Profiles
- ✅ 5 Current Student Profiles
- ✅ 5 Opportunities (Internships, Workshops)
- ✅ 5 Competitive Exams
- ✅ 4 Mock Tests

## Future Enhancements

- Backend API integration
- Real authentication
- Database integration
- Push notifications
- User profiles and settings
- Booking/Application system
- Progress tracking
- Analytics dashboard

## Note

This is a **Frontend-Only** implementation. All data is mocked and no API integration has been done. Perfect for UI/UX design, prototyping, and demonstration purposes.

## License

This project is licensed under the MIT License.

---

**Built with ❤️ using Flutter**
