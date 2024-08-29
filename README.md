# flutter_boilerplate_hng11


This Flutter boilerplate provides a solid foundation for mobile applications by integrating with our existing boilerplate APIs. The boilerplate includes essential features such as authentication, product listing, and user account settings. The UI design is consistent with our existing boilerplates, ensuring a seamless user experience.


## Features
Authentication: User sign-up, login, and secure session management.
Product Listing: Display products with categories, search functionality, and detailed product views.
User Account Settings: Manage user profile, update account information, and handle user preferences.

## Prerequisites
- [FlutterSDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio](https://visualstudio.microsoft.com/) with Flutter and Dart plugins

## Dependencies
This boilerplate uses the following dependencies to provide essential functionalities and ensure a smooth development experience:


### Core Dependencies
1. Cupertino_icons: ^1.0.6
Provides a set of iOS-style icons to be used in the application.

2. Provider: ^6.1.2
A state management solution that allows you to handle state and dependency injection in a structured and easy-to-use manner.

3. Flutter_riverpod: ^2.5.1
An advanced state management library that is an improvement over the original Provider package, offering better performance and flexibility.

4. Get_it: ^7.7.0
A service locator used to manage dependencies across the application, making it easy to access instances of classes from anywhere in the code.

5. Go_router: ^14.2.3
A routing package that simplifies navigation management, offering declarative and dynamic routing solutions.


### UI and Styling
6. Google_fonts: ^6.2.1
Allows you to easily use any of the fonts from fonts.google.com in your Flutter app.

7. Hexcolor: ^3.0.1
A utility for working with hexadecimal color codes in Flutter.

8. Flutter_screenutil: ^5.9.3
A utility for adapting screen sizes, allowing for responsive UI design across different devices.

9. Flutter_svg: ^2.0.10+1
Enables the rendering of SVG images, providing vector graphics support in your application.

10. Cached_network_image: ^3.4.0
Efficiently loads and caches images from the network, reducing bandwidth usage and improving performance.


### Networking and APIs
11. Dio: ^5.5.0+1
A powerful HTTP client that supports RESTful API calls, interceptors, and more, making network requests easy and manageable.

12. flutter_dotenv: ^5.1.0
A package for loading environment variables from a .env file, keeping sensitive data out of your codebase.


### Firebase Integration
13. Firebase_auth ^4.16.0
Provides Firebase authentication services, enabling user sign-up, login, and session management.

14. Firebase_core: ^2.24.2
A required dependency for connecting your Flutter application with Firebase.


### Utility Packages
15. One_context: ^4.0.0
Simplifies context management by providing a single context to use throughout the application.

16. Get_storage: ^2.1.1
A simple key-value storage solution for persisting data locally.

17. Intl: ^0.19.0
Provides internationalization and localization support, allowing your app to handle multiple languages and date formats.

18. Back_button_interceptor: ^7.0.3
Allows you to intercept back button presses, providing custom handling for navigation.

19. File_picker: ^8.1.1
A utility for picking files from the device’s file system.

20. Vector_graphics: any
A utility for rendering and manipulating vector graphics.


### Image Handling
21. Image_picker: ^1.1.
Enables image and video picking from the device’s gallery or camera.


### JSON Handling
22. json_annotation: any
Used to generate JSON serialization logic automatically, making it easier to handle JSON data in your app.




## Getting Started
### 1. Clone the Repository
bash
```Copy code
git clone https://github.com/Omozuas/Flutter_Boilerplate_Hng11.git
```


### 2. Install Dependencies
Run the following command to install the necessary packages:
bash
```Copy code
flutter pub get
```

### 3. Configure Environment
Create a .env file in the root directory and add your environment variables:
bash
```Copy code
API_BASE_URL=
AUTH_API_KEY=
```

### 4. Run the Application
To start the application on an emulator or a connected device, run:
bash
```Copy code
flutter run
```

### 5. Building for Release
For Android:
bash
```Copy code
flutter build apk --release
```

For iOS:
```bash

flutter build ios --release
```


## Project Structure

lib/

├── common_models/       
├── features/            
├── gen/          
├── models/                
├── services/ 

├── utils/              
└── main.dart          

## API Integration
This boilerplate is designed to integrate seamlessly with our backend APIs. The services layer (lib/services/) handles all API requests, using Dio for HTTP client functionalities. Endpoints and request parameters should be configured in the service classes.


## Theming
The UI is designed to match the style of our existing [boilerplates](https://kimiko-csharp.teams.hng.tech/). The theme can be customized by modifying the (lib/ui/utils/) directory. All colors, fonts, and styles are centralized for easy customization.

## Contribution Guidelines
Please follow the Flutter style guide for consistency. When contributing, ensure that:
Code is properly commented and documented.
Commit messages are clear and descriptive.
All new features include tests.

## Contributors
- [Damigrace1](https://github.com/Damigrace1)
- [krysnkem](https://github.com/krysnkem)
- [Omozuas](https://github.com/Omozuas)
- [andymaking](https://github.com/andymaking) 
- [Damilare-d](https://github.com/damilare-d)
- [OtonyeR](https://github.com/OtonyeR)
- [JamiuJimoh](https://github.com/JamiuJimoh)
- [JoshOkelola](https://github.com/Joshokelola)
- [@Victorhez](https://github.com/victorhez)
- [@Topzee001](https://github.com/Topzee001)
- [@JGraphics](https://github.com/jGraphics)
- [SSID98](https://github.com/SSID98)
- [dumebiii](https://github.com/dumebiii)
- [Mofolasayo](https://github.com/Mofolasayo)
- [EzeanyimHenry](https://github.com/ezeanyimhenry)
- [Fidelity](https://github.com/fidelity2851)
- [Dehbbyk](https://github.com/Dehbbyk)
- [dexterousNorthpaw](https://github.com/dexterousNorthpaw)
- [Lukas-io](https://github.com/Lukas-io)
- [Daveohi](https://github.com/Daveohi)
- [Gozzicode](https://github.com/Gozzicode)
- [Oriohac](https://github.com/oriohac)
- [Phillip4reall](https://github.com/Phillip4reall)
- [KellyTomi](https://github.com/Kellytomi)
- [fidelmak](https://github.com/fidelmak)
- [Dev-ellaij](https://github.com/Dev-ellaij)
- [michealuche01](https://github.com/michaeluche01)
- [adebola-duf](https://github.com/adebola-duf) 
- [ManifestJosh](https://github.com/ManifestJosh) 

## Screenshots





