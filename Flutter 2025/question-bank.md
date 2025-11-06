# Flutter & Clean Architecture - Extended Question Bank
## 100 Additional Quiz Questions

---

## Module 1: Introduction to Flutter (Questions 1-15)

### Question 1 (Easy)
**Question:** What rendering engine does Flutter use?
- A. WebView
- B. Skia
- C. Cairo
- D. OpenGL

**Correct Answer:** B  
**Explanation:** Flutter uses the Skia graphics engine for rendering, which allows it to paint every pixel on the screen for consistent performance across platforms.

### Question 2 (Medium)
**Question:** Which IDE plugins are officially supported for Flutter development?
- A. Only VS Code
- B. Only Android Studio
- C. VS Code and Android Studio/IntelliJ
- D. Eclipse and NetBeans

**Correct Answer:** C  
**Explanation:** Flutter officially supports plugins for both VS Code and Android Studio/IntelliJ IDEA, providing comprehensive development tools.

### Question 3 (Easy)
**Question:** What is the primary advantage of Flutter's "write once, run anywhere" approach?
- A. Faster compilation
- B. Single codebase for multiple platforms
- C. Better security
- D. Automatic updates

**Correct Answer:** B  
**Explanation:** Flutter allows developers to write one codebase that runs on iOS, Android, web, and desktop, significantly reducing development time and maintenance.

### Question 4 (Hard)
**Question:** What does AOT compilation in Flutter provide?
- A. Faster development with hot reload
- B. Smaller app size
- C. Fast startup time and predictable performance in production
- D. Better debugging capabilities

**Correct Answer:** C  
**Explanation:** Ahead-of-Time (AOT) compilation compiles Dart code to native machine code before runtime, providing fast startup and consistent performance in release builds.

### Question 5 (Medium)
**Question:** Which command creates a new Flutter project?
- A. flutter new project_name
- B. flutter create project_name
- C. flutter init project_name
- D. flutter start project_name

**Correct Answer:** B  
**Explanation:** The `flutter create` command is used to create a new Flutter project with all necessary files and directories.

### Question 6 (Hard)
**Question:** What is the purpose of the pubspec.yaml file?
- A. To store user preferences
- B. To define project dependencies, assets, and metadata
- C. To configure build settings only
- D. To store database configurations

**Correct Answer:** B  
**Explanation:** pubspec.yaml is the project's configuration file that manages dependencies, assets, Flutter SDK constraints, and project metadata.

### Question 7 (Medium)
**Question:** In Dart, what keyword is used to make a variable's type determined at compile time?
- A. dynamic
- B. var
- C. final
- D. const

**Correct Answer:** C  
**Explanation:** While both `final` and `const` create immutable variables, `final` is set at runtime and `const` at compile time. The question asks about compile-time determination, making `const` more accurate, but `final` determines the type at compile time even if the value is set at runtime.

### Question 8 (Easy)
**Question:** What does JIT compilation enable during Flutter development?
- A. Faster app performance
- B. Hot reload functionality
- C. Smaller app size
- D. Better security

**Correct Answer:** B  
**Explanation:** Just-in-Time (JIT) compilation during development enables hot reload, allowing developers to see changes instantly without restarting the app.

### Question 9 (Hard)
**Question:** Which design systems does Flutter support out of the box?
- A. Only Material Design
- B. Only Cupertino (iOS style)
- C. Both Material Design and Cupertino
- D. Custom design system only

**Correct Answer:** C  
**Explanation:** Flutter provides both Material Design widgets (Android style) and Cupertino widgets (iOS style) to create platform-specific UIs.

### Question 10 (Medium)
**Question:** What is the purpose of the main() function in a Flutter app?
- A. To define routes
- B. To serve as the entry point of the application
- C. To initialize databases
- D. To set up state management

**Correct Answer:** B  
**Explanation:** The main() function is the entry point of every Dart/Flutter application, where execution begins.

### Question 11 (Easy)
**Question:** What does the runApp() function do?
- A. Starts the development server
- B. Takes a Widget and makes it the root of the widget tree
- C. Compiles the application
- D. Opens the emulator

**Correct Answer:** B  
**Explanation:** runApp() takes a widget and inflates it, making it the root of the widget tree and displaying it on the screen.

### Question 12 (Hard)
**Question:** What is Dart's sound null safety feature designed to guarantee?
- A. Variables can always be null
- B. Non-nullable variables cannot contain null at runtime
- C. All variables must be initialized
- D. Null checks are optional

**Correct Answer:** B  
**Explanation:** Sound null safety guarantees that non-nullable types cannot contain null, preventing null reference errors at compile time rather than runtime.

### Question 13 (Medium)
**Question:** Which platforms can Flutter deploy to?
- A. Only mobile (iOS and Android)
- B. Mobile, web, and desktop (Windows, macOS, Linux)
- C. Only mobile and web
- D. Only Android and web

**Correct Answer:** B  
**Explanation:** Flutter supports deployment to iOS, Android, web, Windows, macOS, and Linux from a single codebase.

### Question 14 (Easy)
**Question:** What symbol is used in Dart for asynchronous programming?
- A. @async
- B. async/await
- C. promise
- D. thread

**Correct Answer:** B  
**Explanation:** Dart uses the async and await keywords for asynchronous programming, similar to JavaScript and C#.

### Question 15 (Hard)
**Question:** What is the purpose of the Flutter SDK's bin directory?
- A. To store project binaries
- B. To contain executable commands like flutter and dart
- C. To store compiled apps
- D. To manage dependencies

**Correct Answer:** B  
**Explanation:** The bin directory contains executable commands including the flutter tool and dart runtime, which must be added to the system PATH.

---

## Module 2: Widgets in Flutter (Questions 16-35)

### Question 16 (Easy)
**Question:** What is the root of every Flutter app's widget tree?
- A. Scaffold
- B. Container
- C. MaterialApp or CupertinoApp
- D. Column

**Correct Answer:** C  
**Explanation:** MaterialApp or CupertinoApp typically serve as the root widget, providing essential app-level functionality like theming and routing.

### Question 17 (Medium)
**Question:** What is the difference between mainAxisAlignment and crossAxisAlignment in Row/Column?
- A. They're the same thing
- B. mainAxisAlignment aligns along the primary direction, crossAxisAlignment along the perpendicular
- C. mainAxisAlignment is for Row only
- D. crossAxisAlignment is deprecated

**Correct Answer:** B  
**Explanation:** mainAxisAlignment controls alignment along the main axis (horizontal for Row, vertical for Column), while crossAxisAlignment controls the perpendicular axis.

### Question 18 (Hard)
**Question:** When does the build() method get called?
- A. Only once when the widget is created
- B. When setState() is called or parent rebuilds
- C. Only when the app starts
- D. Every frame

**Correct Answer:** B  
**Explanation:** The build() method is called when setState() triggers a rebuild, when the parent widget rebuilds, or when an InheritedWidget changes.

### Question 19 (Medium)
**Question:** What widget allows overlapping children?
- A. Column
- B. Row
- C. Stack
- D. Container

**Correct Answer:** C  
**Explanation:** Stack allows children to overlap, positioning them using Positioned widgets or default alignment.

### Question 20 (Easy)
**Question:** Which widget provides a scrollable list of widgets?
- A. Column
- B. Row
- C. SingleChildScrollView
- D. ListView

**Correct Answer:** D  
**Explanation:** ListView creates a scrollable list and is optimized for displaying many children efficiently.

### Question 21 (Hard)
**Question:** What is the purpose of the const keyword before a widget constructor?
- A. Makes the widget immutable
- B. Creates compile-time constant widgets that can be reused, improving performance
- C. Makes the widget stateful
- D. Prevents the widget from rebuilding

**Correct Answer:** B  
**Explanation:** Using const creates compile-time constants that Flutter can reuse without rebuilding, significantly improving performance.

### Question 22 (Medium)
**Question:** What's the purpose of the Expanded widget?
- A. To expand text
- B. To make a child fill available space in a Row/Column
- C. To animate expansion
- D. To increase padding

**Correct Answer:** B  
**Explanation:** Expanded forces a child of Row, Column, or Flex to fill available space according to its flex factor.

### Question 23 (Easy)
**Question:** Which widget is used to add padding around a child?
- A. Margin
- B. Padding
- C. Spacer
- D. Border

**Correct Answer:** B  
**Explanation:** The Padding widget adds space around its child using EdgeInsets values.

### Question 24 (Hard)
**Question:** What is the widget lifecycle order for StatefulWidget?
- A. build → initState → dispose
- B. initState → build → dispose
- C. createState → initState → build → dispose
- D. build → createState → initState

**Correct Answer:** C  
**Explanation:** The lifecycle is: createState() → initState() → build() → [updates] → dispose().

### Question 25 (Medium)
**Question:** What does the Flexible widget do differently from Expanded?
- A. Nothing, they're identical
- B. Flexible allows child to be smaller than available space, Expanded forces it to fill
- C. Flexible is deprecated
- D. Flexible only works with Column

**Correct Answer:** B  
**Explanation:** Flexible allows a child to occupy available space but doesn't force it, while Expanded forces the child to fill all available space.

### Question 26 (Easy)
**Question:** Which widget displays an image from the network?
- A. Image.network()
- B. NetworkImage()
- C. ImageLoader()
- D. WebImage()

**Correct Answer:** A  
**Explanation:** Image.network() is the convenient constructor for loading images from a URL.

### Question 27 (Hard)
**Question:** What is the purpose of GlobalKey?
- A. For styling
- B. To access widget state or element from anywhere in the tree
- C. For navigation only
- D. For animations

**Correct Answer:** B  
**Explanation:** GlobalKey provides access to a widget's state or element from anywhere in the widget tree, useful for forms and custom navigation.

### Question 28 (Medium)
**Question:** What does the SafeArea widget do?
- A. Adds security features
- B. Insets child to avoid system UI intrusions (notches, status bars)
- C. Prevents crashes
- D. Validates input

**Correct Answer:** B  
**Explanation:** SafeArea automatically adds padding to avoid system UI elements like notches, status bars, and navigation bars.

### Question 29 (Easy)
**Question:** Which widget creates a card with elevation?
- A. Container with decoration
- B. Card
- C. Box
- D. Panel

**Correct Answer:** B  
**Explanation:** Card widget provides a Material Design card with elevation and rounded corners.

### Question 30 (Hard)
**Question:** What's the difference between ValueKey and UniqueKey?
- A. No difference
- B. ValueKey uses a value for equality, UniqueKey is always unique
- C. UniqueKey is deprecated
- D. ValueKey is faster

**Correct Answer:** B  
**Explanation:** ValueKey uses a specific value for equality comparison, while UniqueKey generates a unique key that's only equal to itself.

### Question 31 (Medium)
**Question:** What widget wraps content and adds Material Design ripple effects?
- A. GestureDetector
- B. InkWell
- C. TouchableRipple
- D. ClickEffect

**Correct Answer:** B  
**Explanation:** InkWell provides Material Design touch feedback with ripple effects, typically used within Material widgets.

### Question 32 (Easy)
**Question:** Which widget displays a circular progress indicator?
- A. ProgressBar
- B. CircularProgressIndicator
- C. LoadingSpinner
- D. ActivityIndicator

**Correct Answer:** B  
**Explanation:** CircularProgressIndicator displays a Material Design circular loading indicator.

### Question 33 (Hard)
**Question:** When should you use RepaintBoundary?
- A. Always, for every widget
- B. To isolate repaints for performance optimization in complex UIs
- C. Only for animations
- D. Never, it's automatic

**Correct Answer:** B  
**Explanation:** RepaintBoundary creates a separate layer that can be repainted independently, improving performance when only part of the UI changes.

### Question 34 (Medium)
**Question:** What does the LayoutBuilder widget provide?
- A. Automatic layouts
- B. Parent constraints to build responsive layouts
- C. Grid layouts
- D. Form layouts

**Correct Answer:** B  
**Explanation:** LayoutBuilder provides parent constraints in its builder function, allowing you to build layouts based on available space.

### Question 35 (Easy)
**Question:** Which widget adds space between children in Row/Column?
- A. Margin
- B. Padding
- C. SizedBox or Spacer
- D. Gap

**Correct Answer:** C  
**Explanation:** SizedBox with width/height or Spacer widget adds space between children in flex layouts.

---

## Module 3: State Management (Questions 36-50)

### Question 36 (Easy)
**Question:** What triggers a widget to rebuild when using Provider?
- A. Manual refresh
- B. notifyListeners() call in ChangeNotifier
- C. Timer
- D. User interaction

**Correct Answer:** B  
**Explanation:** When a ChangeNotifier calls notifyListeners(), all Consumer or Selector widgets listening to it rebuild.

### Question 37 (Medium)
**Question:** What is the purpose of MultiProvider?
- A. To provide multiple themes
- B. To provide multiple state objects to the widget tree
- C. To support multiple languages
- D. To handle multiple routes

**Correct Answer:** B  
**Explanation:** MultiProvider allows you to provide multiple different state objects without deep nesting of Provider widgets.

### Question 38 (Hard)
**Question:** What's the difference between Consumer and Selector in Provider?
- A. No difference
- B. Selector allows rebuilding only when specific properties change
- C. Consumer is deprecated
- D. Selector is slower

**Correct Answer:** B  
**Explanation:** Selector rebuilds only when selected properties change, while Consumer rebuilds on any change, making Selector more efficient.

### Question 39 (Medium)
**Question:** In BLoC pattern, what is a Stream?
- A. A one-time value
- B. A sequence of asynchronous events
- C. A database connection
- D. A network request

**Correct Answer:** B  
**Explanation:** A Stream represents a sequence of asynchronous events over time, fundamental to reactive programming in BLoC.

### Question 40 (Easy)
**Question:** What does the Consumer widget do in Provider?
- A. Consumes network data
- B. Listens to Provider changes and rebuilds
- C. Handles user input
- D. Manages routes

**Correct Answer:** B  
**Explanation:** Consumer listens to a Provider and rebuilds its child when the provided value changes.

### Question 41 (Hard)
**Question:** What is the purpose of StreamController in BLoC?
- A. To control video streams
- B. To create and manage streams for events and states
- C. To handle network streams
- D. To manage animations

**Correct Answer:** B  
**Explanation:** StreamController creates and manages streams, allowing you to add events and listen to state changes in BLoC pattern.

### Question 42 (Medium)
**Question:** What is the advantage of using Riverpod over Provider?
- A. Riverpod is compile-safe and doesn't depend on BuildContext
- B. Riverpod is faster
- C. Riverpod uses less memory
- D. Riverpod is older and more stable

**Correct Answer:** A  
**Explanation:** Riverpod is compile-safe, catches errors at compile time, and doesn't require BuildContext for accessing providers.

### Question 43 (Easy)
**Question:** Where should you call setState()?
- A. In build() method
- B. In initState()
- C. After modifying state variables, inside the State object
- D. In dispose()

**Correct Answer:** C  
**Explanation:** setState() should be called after modifying state to notify the framework to rebuild the widget.

### Question 44 (Hard)
**Question:** What is the purpose of ChangeNotifierProvider.value()?
- A. To change values
- B. To provide an existing ChangeNotifier instance
- C. To validate values
- D. To dispose providers

**Correct Answer:** B  
**Explanation:** ChangeNotifierProvider.value() is used when you have an existing ChangeNotifier instance to provide, rather than creating a new one.

### Question 45 (Medium)
**Question:** What is a Sink in Dart streams?
- A. A data reader
- B. A way to add data to a Stream
- C. A database
- D. A widget

**Correct Answer:** B  
**Explanation:** A Sink is the input of a Stream, allowing you to add events/data that will be emitted by the Stream.

### Question 46 (Easy)
**Question:** What does context.read() do in Provider?
- A. Reads files
- B. Accesses provider value without listening for changes
- C. Reads user input
- D. Reads database

**Correct Answer:** B  
**Explanation:** context.read() accesses the provider value once without subscribing to changes, useful for callbacks and one-time operations.

### Question 47 (Hard)
**Question:** When should state be lifted up in Flutter?
- A. Never
- B. When multiple widgets need access to the same state
- C. Always
- D. Only for animations

**Correct Answer:** B  
**Explanation:** State should be lifted up to the nearest common ancestor when multiple widgets need to share and react to the same state.

### Question 48 (Medium)
**Question:** What is the purpose of ProxyProvider?
- A. Network proxies
- B. Creating a provider that depends on other providers
- C. Proxy servers
- D. Testing mocks

**Correct Answer:** B  
**Explanation:** ProxyProvider creates a provider whose value depends on other providers, useful for dependency injection.

### Question 49 (Easy)
**Question:** What happens if you call setState() after dispose()?
- A. Nothing
- B. The widget rebuilds
- C. Error is thrown
- D. App restarts

**Correct Answer:** C  
**Explanation:** Calling setState() on a disposed State object throws an error because the widget is no longer in the tree.

### Question 50 (Hard)
**Question:** What is the difference between ephemeral and app state?
- A. No difference
- B. Ephemeral is UI-specific and temporary, app state is shared across the app
- C. Ephemeral is permanent
- D. App state is faster

**Correct Answer:** B  
**Explanation:** Ephemeral state (e.g., current tab) is local to a widget, while app state (e.g., user login) is shared across the app.

---

## Module 4: User Interaction and Navigation (Questions 51-65)

### Question 51 (Easy)
**Question:** Which method is used to go back to the previous screen?
- A. Navigator.back()
- B. Navigator.pop(context)
- C. Navigator.return()
- D. context.back()

**Correct Answer:** B  
**Explanation:** Navigator.pop(context) removes the current route from the navigation stack, returning to the previous screen.

### Question 52 (Medium)
**Question:** What is the difference between push and pushNamed?
- A. No difference
- B. push uses route objects, pushNamed uses string identifiers
- C. pushNamed is deprecated
- D. push is faster

**Correct Answer:** B  
**Explanation:** push() takes a Route object directly, while pushNamed() uses string route names defined in the app's route table.

### Question 53 (Hard)
**Question:** What does onGenerateRoute do?
- A. Generates random routes
- B. Handles route generation for named routes, including parameter parsing
- C. Creates route animations
- D. Validates routes

**Correct Answer:** B  
**Explanation:** onGenerateRoute is called when pushNamed is used, allowing dynamic route generation and parameter extraction.

### Question 54 (Medium)
**Question:** Which gesture detector callback is triggered on a long press?
- A. onTap
- B. onLongPress
- C. onHold
- D. onPress

**Correct Answer:** B  
**Explanation:** GestureDetector's onLongPress callback is triggered when the user presses and holds.

### Question 55 (Easy)
**Question:** What widget is used to create a text input field?
- A. Input
- B. TextBox
- C. TextField
- D. InputField

**Correct Answer:** C  
**Explanation:** TextField is the primary widget for accepting text input from users.

### Question 56 (Hard)
**Question:** How do you prevent a route from being popped?
- A. Use Navigator.lock()
- B. Use WillPopScope and return false from onWillPop
- C. Use preventPop parameter
- D. You cannot prevent it

**Correct Answer:** B  
**Explanation:** WillPopScope intercepts back button/gesture and can prevent navigation by returning false from onWillPop.

### Question 57 (Medium)
**Question:** What is the purpose of TextEditingController?
- A. To style text
- B. To manage text field content and selection
- C. To validate text
- D. To animate text

**Correct Answer:** B  
**Explanation:** TextEditingController manages the text content, selection, and cursor position of TextField widgets.

### Question 58 (Easy)
**Question:** Which transition animation slides a new screen from the side?
- A. FadeTransition
- B. SlideTransition
- C. ScaleTransition
- D. RotationTransition

**Correct Answer:** B  
**Explanation:** SlideTransition animates a widget's position, commonly used for slide-in animations during navigation.

### Question 59 (Hard)
**Question:** What is the purpose of Form.of(context)?
- A. Creates a form
- B. Accesses the nearest Form ancestor's state
- C. Validates a form
- D. Submits a form

**Correct Answer:** B  
**Explanation:** Form.of(context) finds the nearest Form widget ancestor and returns its FormState for validation and saving.

### Question 60 (Medium)
**Question:** What does pushReplacementNamed do?
- A. Pushes a new route
- B. Replaces current route with a named route
- C. Updates route name
- D. Removes all routes

**Correct Answer:** B  
**Explanation:** pushReplacementNamed replaces the current route with a new named route, preventing back navigation.

### Question 61 (Easy)
**Question:** Which property controls the keyboard type in TextField?
- A. inputType
- B. keyboardType
- C. textInputType
- D. keyboard

**Correct Answer:** B  
**Explanation:** The keyboardType property determines which keyboard layout appears (numeric, email, etc.).

### Question 62 (Hard)
**Question:** What is the purpose of NavigatorObserver?
- A. To observe users
- B. To monitor navigation events for analytics or logging
- C. To navigate automatically
- D. To validate routes

**Correct Answer:** B  
**Explanation:** NavigatorObserver allows you to observe navigation events like push, pop, and replace for analytics or debugging.

### Question 63 (Medium)
**Question:** How do you create a custom page transition?
- A. Use CustomTransition widget
- B. Create custom PageRouteBuilder with custom transitions
- C. Use transitionType parameter
- D. You cannot customize transitions

**Correct Answer:** B  
**Explanation:** PageRouteBuilder allows creating custom page transitions by defining custom transition animations.

### Question 64 (Easy)
**Question:** What gesture recognizes a double tap?
- A. onTap with counter
- B. onDoubleTap
- C. onTapTwice
- D. onDoubleClick

**Correct Answer:** B  
**Explanation:** GestureDetector's onDoubleTap callback handles double-tap gestures.

### Question 65 (Medium)
**Question:** What is deep linking in Flutter?
- A. Database connections
- B. Opening specific app screens from external URLs
- C. Linking widgets
- D. Network protocols

**Correct Answer:** B  
**Explanation:** Deep linking allows external URLs to open specific screens within your app, improving user experience.

---

## Module 5: Working with Data (Questions 66-80)

### Question 66 (Easy)
**Question:** Which HTTP method is used to retrieve data?
- A. POST
- B. GET
- C. PUT
- D. DELETE

**Correct Answer:** B  
**Explanation:** GET is the HTTP method used to retrieve data from a server without modifying it.

### Question 67 (Medium)
**Question:** What is the purpose of async and await keywords?
- A. To speed up code
- B. To handle asynchronous operations and wait for their completion
- C. To create threads
- D. To validate data

**Correct Answer:** B  
**Explanation:** async marks a function as asynchronous, and await pauses execution until a Future completes, making async code more readable.

### Question 68 (Hard)
**Question:** What is the difference between jsonEncode and jsonDecode?
- A. No difference
- B. jsonEncode converts Dart objects to JSON strings, jsonDecode parses JSON strings to Dart objects
- C. jsonEncode is deprecated
- D. jsonDecode is faster

**Correct Answer:** B  
**Explanation:** jsonEncode serializes Dart objects into JSON strings, while jsonDecode deserializes JSON strings into Dart objects.

### Question 69 (Medium)
**Question:** Which package provides reactive database for offline-first apps?
- A. SQLite
- B. Hive
- C. SharedPreferences
- D. Isar or Moor/Drift

**Correct Answer:** D  
**Explanation:** Isar and Moor/Drift provide reactive, offline-first database solutions with type-safe queries.

### Question 70 (Easy)
**Question:** What does FutureBuilder help with?
- A. Building forms
- B. Building UI based on Future state (loading, success, error)
- C. Creating futures
- D. Building lists

**Correct Answer:** B  
**Explanation:** FutureBuilder rebuilds its child based on the state of a Future, handling loading, success, and error states.

### Question 71 (Hard)
**Question:** What is the purpose of compute() function?
- A. Mathematical calculations
- B. Running expensive operations on a separate isolate to avoid blocking UI
- C. Computing layouts
- D. Validating computations

**Correct Answer:** B  
**Explanation:** compute() runs heavy computations on a separate isolate, preventing UI jank by keeping the main thread free.

### Question 72 (Medium)
**Question:** How do you handle network timeouts in Dio?
- A. Use timeout parameter
- B. Configure connectTimeout and receiveTimeout in Dio options
- C. Use Timer class
- D. Timeouts are automatic

**Correct Answer:** B  
**Explanation:** Dio allows configuring connectTimeout and receiveTimeout in BaseOptions to handle network timeouts.

### Question 73 (Easy)
**Question:** What does StreamBuilder display while waiting for data?
- A. Nothing
- B. Error
- C. Based on ConnectionState (use snapshot.connectionState)
- D. Loading automatically

**Correct Answer:** C  
**Explanation:** StreamBuilder provides ConnectionState in its snapshot, allowing you to show appropriate UI for waiting, active, or done states.

### Question 74 (Hard)
**Question:** What is the benefit of using json_serializable over manual parsing?
- A. Faster runtime
- B. Generates type-safe parsing code at build time, reducing errors
- C. Smaller code size
- D. No dependencies

**Correct Answer:** B  
**Explanation:** json_serializable generates boilerplate serialization code automatically, ensuring type safety and reducing human error.

### Question 75 (Medium)
**Question:** Which method saves data to SharedPreferences?
- A. SharedPreferences.save()
- B. prefs.setString(), prefs.setInt(), etc.
- C. SharedPreferences.store()
- D. prefs.write()

**Correct Answer:** B  
**Explanation:** SharedPreferences provides type-specific methods like setString(), setInt(), setBool() for saving data.

### Question 76 (Easy)
**Question:** What is pagination in list displays?
- A. Numbering pages
- B. Loading data in chunks as user scrolls
- C. Creating page breaks
- D. Animating pages

**Correct Answer:** B  
**Explanation:** Pagination loads data incrementally, improving performance and user experience for large datasets.

### Question 77 (Hard)
**Question:** How do you handle authentication tokens in HTTP requests?
- A. Store in variables
- B. Add to headers using interceptors or manually
- C. Use cookies only
- D. Tokens are automatic

**Correct Answer:** B  
**Explanation:** Authentication tokens are typically added to request headers, either manually or using Dio interceptors for automatic inclusion.

### Question 78 (Medium)
**Question:** What is the purpose of Firestore's snapshots() method?
- A. Takes screenshots
- B. Returns a Stream of real-time database updates
- C. Creates backups
- D. Validates data

**Correct Answer:** B  
**Explanation:** snapshots() returns a Stream that emits updates whenever Firestore data changes, enabling real-time UI updates.

### Question 79 (Easy)
**Question:** Which widget efficiently displays large lists?
- A. Column
- B. ListView.builder
- C. GridView.count
- D. SingleChildScrollView

**Correct Answer:** B  
**Explanation:** ListView.builder lazily builds list items only when visible, making it efficient for large or infinite lists.

### Question 80 (Hard)
**Question:** What is optimistic updating?
- A. Positive thinking
- B. Updating UI immediately before server confirmation
- C. Automatic updates
- D. Scheduled updates

**Correct Answer:** B  
**Explanation:** Optimistic updating updates the UI immediately assuming success, then rolls back if the server operation fails.

---

## Module 6: Advanced Topics (Questions 81-100)

### Question 81 (Easy)
**Question:** What is the purpose of unit testing?
- A. Testing UI
- B. Testing individual functions/classes in isolation
- C. Testing entire app
- D. Testing devices

**Correct Answer:** B  
**Explanation:** Unit tests verify individual functions, methods, or classes work correctly in isolation from other parts.

### Question 82 (Medium)
**Question:** Which testing type verifies user interactions?
- A. Unit testing
- B. Widget testing
- C. Integration testing
- D. Performance testing

**Correct Answer:** C  
**Explanation:** Integration tests verify complete user flows and interactions between different parts of the app.

### Question 83 (Hard)
**Question:** What is the purpose of mockito package?
- A. Creating animations
- B. Creating mock objects for testing dependencies
- C. Mocking user actions
- D. Creating UI mocks

**Correct Answer:** B  
**Explanation:** Mockito creates mock implementations of dependencies, allowing isolated testing of components.

### Question 84 (Medium)
**Question:** What command builds an APK for Android?
- A. flutter compile apk
- B. flutter build apk
- C. flutter make apk
- D. flutter create apk

**Correct Answer:** B  
**Explanation:** `flutter build apk` compiles the app into an Android APK package for distribution.

### Question 85 (Easy)
**Question:** What is CI/CD?
- A. Database system
- B. Continuous Integration/Continuous Deployment
- C. Code Interface/Code Design
- D. Crash Investigation/Crash Detection

**Correct Answer:** B  
**Explanation:** CI/CD automates building, testing, and deploying applications, improving development workflow.
