# Another Different Way To Play
> I'll rewrite this once I'm done w/ the whole refactoring, this is just a temporary placeholder, so take it with a grain of salt
## Why another?
Well, my original code was a bit of a mess, and I had been trying to learn flutter so I figured a refactoring was in order. 
## What was changed?
I completely redid the GUI, rewrote the main execution loops for the programs themselves, and added some new functionality, from tournaments to dynamic player selection to a new program, FC/Filtered Controls
## Future plans?
I refactored this program because I wanted to streamline it so I could use it to start my gaming YouTube career (lol), ofgameimportance. However, I plan on continuing to refactor it in the future as I learn more about programming and designing software with flutter. I think a lot of the code is unnecessarily complicated and could be simplified or abstracted for application in other situations.
### A rewrite of a rewrite
Here's what I plan to do to optimize and simplify my code
- Break down what each screen means/represents
- Find repetitive sections
- Simplify the widgets to be as adaptive and yet supportive of precision as possible
- Basically documenting my widgets
- I also need to fix my overuse of the "bang" (!) operator, there's no point in something being null if it isn't handled correctly (I have LOTS of null safety errors). Overall, it should only be used when you KNOW that something WON'T be null (inline if statements are HUGE here)
- Overall just cut down on as many problems as I can
#### TextWidget
- A widget for text used throughout my app
- Properties 
    - required: String text
    - Color? color = Colors.black
    - String? fontFamily = "Kaushan"
    - double? fontSize = 60
    - TextAlign? textAlign = TextAlign.center
    - int? numLines = 1
- Variables
    - None
- Notable: uses AutoSizeText widget
- Overall, this is a great widget with a simplistic yet easily scalable design, and is largely what I'm after
#### ImageSelector
- A type of selector that contains an image as well
- Properties
    - required: String backgroundImagePath
    - required: String title
    - required: String route
    - Color? backgroundColor = Colors.white
    - Color? textColor = Colors.black
    - double? textWidth = 200
    - String? description
- Variables
    - bool hovered = false
- This is a convenience button widget, although setting the textWidth for the descriptions requires some experimentation which, from my experience, cannot be avoided (besides with a default value that is functional most (BUT NOT ALL) of the time).
#### Selector
- A simple elipsis button with a filled background color
- Properties
    - required: String title
    - required: String route
    - required: Color? backgroundColor
    - required: OutlinedBorder? shape
    - Color? textColor = Colors.black
    - double? textWidth = 200
    - String? description
- Variables
    - bool hovered = false
- This is another convenience widget, essentially functioning as an alternative to ImageSelector widgets
#### Program
- Properties
    - required: String title
    - required: String description
    - required: Widget settings
    - bool isProgram = true
- This is just a layout/convenience widget, useful to cut down on repetitive code and ensure consistent design. It has the isProgram boolean, which, if true, handles point calculations and storage writes (with the abbreviation used to represent the program encased by parenthesis at the end of the title String)
#### CheckboxWidget
- Properties
    - required: bool state
    - required: Function(bool value updateStorage
    - Color backgroundColor = Colors.white
    - String title = ''
    - Color tileColor = Colors.black
    - bool? hasPopup
    - Widget? dialog
- The CheckboxWidget is a bit more complex of a convenience widget, combining a couple other widgets, from GestureDetectors to DialogWidgets, in the process. This means that (depending on the hasPopup bool) it handles dialog functionality as well.
#### DialogWidget
- Properties
    - required Function(String encoded) updateStorage
    - required Map<String, dynamic> jsonMap
    - required Function(void Function()) setState
    - Map<String, dynamic> Function(
    String title,
    List<double>? numbers,
    bool? checkboxState,
    bool isEnabled,
  )? toJson
    - String? title
    - bool create = false
    - ChecboxWidget? checkboxSelector
    - SliderWidget? sliderSelector
    - TextInputWidget? numberSelector
- The DialogWidget provides a way to attach dynamic dialogues with varied options to other widgets. This is useful when low on screen space. A custom toJson function can allow you to control how you want your data to be stored.
#### SliderWidget
- Properties
    - required Function(double value) updateStorage
    - double value
    - Color color
    - Color inactiveColor
    - bool inactive
    - String label
- Another convenience widget, a lot of the definable properties are related to theme. For more customizability, you'll want to stick with using the flutter-provided SliderTheme widget.
#### TextInputWidget
- Properties
    - required: Function() updateStorage
    - required: String label
    - TextEditingController? controller = TextEditingController
    - int maxLength = 10
    - bool obscureText = false
    - double fontSize = 14
    - List<TextInputFormatter> filter = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
- Variables
    - TextEditingController controller
- A convenience widget for text/number inputs involving/necessitating keyboard typing.
#### DropdownWidget
- Properties
    - required: Map<String, dynamic> jsonMap
    - required: Function(String? string) updateStorage
    - required Widget Function(MapEntry<String, dynamic>, Function(String? string)) toWidget
    - Widget Function(MapEntry<String, dynamic>, Function(String? string)) toCheckboxWidget (required if multiselect functionality is enabled)
    - bool multiselect
    - String hintText = "'Just drop down, it'll be fine!'"
- Variables
    - List<DropdownMenuItem<Object>> items
    - Object? currentItem
- A custom dropdown widget mainly for multiselection convenience, structured with functions like toWidget and maps like jsonMap to automate some of the iterative steps. As of right now, a little bit convoluted for just creating a simple dropdown, I would probably recommend the provided DropdownButton widget standalone.

#### PlayerCard
- Properties
    - required: File photo
    - required: String name
    - required: Function(String path) updatePhoto
    - double? cardHeight;
    - double? cardWidth;
    - String? team
- A display card widget for player selection. 
- TODO: cutting this widget and adding its functionality to that of CheckboxWidget. This involves rewriting some widgets, for example the toJson function of the dialogWidget. I also probably need to better understand/rework the written json functionality (REREAD).