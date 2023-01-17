// A file for notes and thoughts throughout the project (includes both review and new concepts)
// STATE MANAGEMENT
// There is temporary and permanent state management
// MaterialPageROute: widget used to render UI by replacing screen
// (Navigator.push and Navigator.pop assist in controlling screen stack)
// STATE contains the widgets state and build, and when the state changes, 
// setState() is called and the widget is rebuilt
// ACCESS WIDGET PROPERTIES using 'widget.<property>'
// Along with showDialog(), here's another cool func I didn't know existed: 
// ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('message')));

// For constructor syntax, see selector.dart (a lot of examples are used there)
// One example of null check syntax: var result = _contact?.email ?? ""

// Alignment and positioning is also something I struggle w/
// MainAxisAlignment: runs ALONG the flow of the widget (e.g. for a row would be horizontal)
// CrossAxisAlignment: runs perpendicular to the flow of the widget
// Expanded: takes up remaining space of a row or column (has flex 1-4 w/ 4 meaning
// takes up 100%, 1 meaning takes up 25%)
// Align: for aligning widgets
// Positioned: alternative to align
// Stack: allows you to STACK elements ON TOP of each other
// Ultimately, Container, Row, Column, and Stack are your alignment tools tho
// FittedBox can be a useful tool for controlling where you want objects to be

// Use MediaQuery.of() to get screen size (for dynamic image width and stuff)
// Actually, use SizedBox for relative sizing

// For more list comprehension tips: see below
// https://pythonisrad.medium.com/list-comprehensions-in-dart-a57d3a06b703

// SYNTAX
// ??= means assign ONLY if var is null
// "$var" is string interpolation (use ${var.property} if there's a property)
// x ?? '' means if null, set to right side value
// x ? y : z (if x is true, return y, else return z)
// jsonMap.entries.map((entry) => ) for iterating over entries in a json map
// for (Widget widget in myList) widget
// {...mapName} (and ... in general) is the syntax for CLONING (e.g. copying a list or map)
// .. is the syntax for evaluating code IN A SPECIFIED ORDER (e.g. evaluate this first, then this)
// .. also works for navigating back one directory for imports (e.g. import '../../../domain/entities/user.dart'), 
// and . works for indicating the current working directory
// _ in front of an object indicates encapsulation/the object will ONLY be available in the dart file it is defined in
// A class can take CUSTOM TYPING in dart; a great example can be seen below
/* 
class MyClass<T> {
  T value;
  MyClass(this.value);
}

main() {
  var mcInt = MyClass<int>(5);
  var mcString = MyClass<String>('foo');
  var mcStringError = MyClass<String>(5); // causes error because `5` is an invalid value when `T` is `String`
}
*/
// Also, I learned what a singleton is: A singleton is a way to ensure that a class only has ONE 
// instance and that a global value of that instance is provided (useful!)
// Another thing about classes; I've seen 3 class keywords. They are: 
// extends: uses inheritance to alter the behavior of a class
// implements: defines a set of methods available on an object
// with: the mixin keyword
// Another thing about classes is the static keyword; by initializing a var as static, 
// it can be directly accessed as a property through using the class name wo/ creating an instance
// Also getters can be used to access variables that aren't necessarily class properties
// from a class instance

// I also learned about keys. For starters, there IS a way to easily combine 
// list iteration with map keys (iterating over a map can be a bit of a pain), 
// and that has to do with the use of VALUE KEYS for each item.

// Provider is for optimally passing around widgets (because the state often needs 
// to be accessed in different parts of the widget tree). When combined w/ StreamingSharedPreferences
// (https://github.com/roughike/streaming_shared_preferences) it's a powerful combination
// PROVIDER
/*
Broken down into 3 major parts: 
1. ChangeNotifier: a flutter class that can be extended to provide
change notifications (notifyListeners()) to its listeners
2. ChangeNotifierProvider (or MultiProvider if you want to provide to multiple classes)
provides an instance of ChangeNotifier to its descendants (so make sure to put it 
above all of the descendants that are using provider)
3. Consumer<modelType> actually rebuilds portions of the tree, so make sure not to
put it too high, otherwise you might rebuild large portions of the tree. 
Provider.of<modelType>(context, listen: false) can be used for optimization if you don't
really need the data in the model.
*/
// STREAMINGSHAREDPREFERENCES


// NEW VOCAB AND IDEAS
// Domain layer: the optional layer that sits between the frontend (UI) and backend (data). Typically encapsulates business logic w/ no UI code.
// Business logic: the functionality in an app and how data can change based on the "logic" of the business
// Test-Driven Development: writing test cases first and then coding around those desired test cases
// You typically want to seperate business logic and presentation; e.g. you 
// don't want that much logic in your widget/UI classes
// Consistency is important for ANY app; for documentation, testing, understanding, etc 
// (stick w/ one state management solution, or at least have a good reason for using multiple!)
// Other business logic princples include DRY + minimal changes (isolate repetitive code) 
// and KISS (+ consistency)
// Tests: ideally logic is isolated and there are logic tests and UI tests. 
// By seperating tests in this way, you don't have to perform time-costing UI testing
// EVERY TIME
// MVC (Model-View-Controller) architecture: user interacts w/ a view, view alerts controller, controller updates model, model alerts view 
// "YAGNI": You Aren't Gonna Need It

// The PRINCIPLES OF CLEAN ARCHITECTURE (https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html):
/*
- A discussion of system architecture. 
- The main goal of clean architecture is to divide a system into layers (business vs UI)
- Clean architectures have 5 KEY THINGS:
1. Independent of Frameworks (no reliance on an external library or feature-ridden software)
2. Testable (business rules can be tested without reliance on any external element; e.g. UI or Database)
3. Independent of UI (UI can change wo/ the business logic changing)
4. Independent of database (database provider can be easily changed)
5. Independent of any external agency (your code doesn't care at all about the outside world)
- The Dependency Rule: source code dependencies can only point INWARDS
Looking at the image: basically anything in an outer circle should not impact anything in an inner circle
- Entities (center of the circle/1st layer) encapsulate ENTERPRISE-WISE business rules. They can be objects with methods, 
data structures, functions, etc, as long as they can be used by different applications in the enterprise.
If you are writing a single application than entities are the most general and high-level rules, 
the ones unlikely to change when something external changes.
- Use cases (2nd layer) contains application specific business rules, controlling the flow 
of data to and from entites to facilitate their enterprise wide business rules.
Changes in this layer should not affect the entities 
and this layer should not be affected by changes to externalities 
such as the database or UI. Changes to the operation of the application
impacts use cases.
- Interface adapters (3rd layer) convert data from the format 
most convenient for use cases and entities to the the format most 
convenient for some external agency (e.g. a database).
- Note that each layer has its own form of data, and conversion to that layers form 
should happen in the OUTER layer rather than the inner layer (so the inner layer can 
be isolated from external data)
- Frameworks and drivers (4th layer). This is where all the details go. The web is a 
deetail. The database is a detail. If these things are outside, they can do little harm.
- You MAY NEED MORE THAN FOUR circles, but the DEPENDENCY RULE will always apply. 
As you move inwards the level of abstraction increases and vice versa as you move outwards.
- Crossing boundaries (how to transition from one circle to another) is often done using 
the Dependency Inversion Principle; relationships would oppose flow of control at certain
points across the boundary. However, this violates the dependency rule, so we have the 
Use Case call an interface in the inner circle and have the presenter in the outer circle 
implement it. This creates source code dependencies that oppose the flow of control 
but conform to The Dependency Rule.
- ISOLATED AND SIMPLE DATA STRUCTURES (no Entities or Database rows; that would be cheating)
are passed across the boundaries. When data is passed it is always in the form most convenient
for the inner circle.
- By seperating software into layers and conforming to The Dependency Rule, you will 
create a system that is intrinsically testable, scalable, and updatable (parts can be easily replaced).
*/

// CLEAN ARCHITECTURE (but a flutter example): https://medium.com/ruangguru/an-introduction-to-flutter-clean-architecture-ae00154001b0
/* 
- Seperation of concerns: a system of isolation similar to what's discussed above. 
Some key principles include: 
- Do one thing: A function should do just one thing and do it well.
- Single Responsibility Principle: A given method/class/component should have a single reason to change.
- Dependency Injection: As much as possible, class dependency should be provided by objects outside of the class.
(what dependency injection basically means to me is the constant passing of data; this also represents
how the level of abstraction increases as you move inwards, and the dependency flow outward of how inward layers
don't have access to outward layers but outward layers have access to inward layers)
- Polymorphism is typically leveraged to preserve dependency rule, and is one of the 3 rules of OOP:
- Encapsulation: Used to hide the values or state of structured data inside a class
- Inheritance: Basing an object or class on an object or other class
- Polymorphism: the provision of a single interface to entities of different types; essentially safe pointers
- 3 Common layers (+ extras): 
- Feature (pages, state management, widgets)
- Domain (use cases, entities, repositories/abstract classes implemented in outer layers)
- Data (repository implementation, models, data sources, mappers)
- + Resources (assets and configs)
- + Sharedlib (reusable components and libs)
*/

// ABSTRACT CLASSES
/*
(https://www.geeksforgeeks.org/abstract-classes-in-dart/)
- An abstract class is a class that contains method(s) WITHOUT IMPLEMENTION. 
- They must be declared abstract and can't be initialized.
- @override is the decorator that you can use to override an abstract method.
- Abstract classes are basically your superclasses that get extended and implemented
by subclasses.
*/

// FLUTTER_CLEAN_ARCHITECTURE (https://pub.dev/packages/flutter_clean_architecture)
// This is a helper package for implementing clean architecture in an app (the training 
// wheels, so to speak). I'm not sure if I want to use it, but it COULD give me some guidance.

// MYSELF AS A CODER
// I have a bad habit of overcomplicating things; oftentimes this comes from 
// a lack of THOROUGH planning. THOROUGH psuedocode (where you work out the ENTIRE app
// and research your tools beforehand) is really important to ensure that you have 
// ALL your bases covered (testing, logic (and logic isolation), proper and effective UI, etc)
// I also have a bad habit of scrolling through code (search engines, Google, etc)
// and attempting to implement things wo/ really understanding them.
// I need to optimize my research time along w/ my programming time because there
// ARE other things I want to do; I refuse to condemn myself to a life of mediocre programming