# FloatyNavBar

FloatyNavBar is a customizable floating navigation bar for Flutter applications. It provides a sleek and interactive way to navigate between tabs while offering an optional action button for additional functionality.

![FloatyNavBar](https://github.com/Mustafa7Ibrahim/floaty_nav_bar/blob/main/assets/example.gif?raw=true)

## Features

- Customizable tab appearance and behavior
- Optional floating action button for each tab
- Smooth animations and transitions
- Support for various shapes (Circle, Rectangle, Squircle)
- Easy integration with existing Flutter projects

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  floaty_nav_bar: ^latest_version
```

Then run:

```
flutter pub get
```

## Usage

Here's a basic example of how to use FloatyNavBar:

```dart
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Selected tab: $_selectedIndex'),
      ),
      bottomNavigationBar: FloatyNavBar(
        selectedTab: _selectedIndex,
        tabs: [
          FloatyTab(
            isSelected: _selectedIndex == 0,
            title: 'Home',
            icon: Icon(Icons.home),
            onTap: () => setState(() => _selectedIndex = 0),
          ),
          FloatyTab(
            isSelected: _selectedIndex == 1,
            title: 'Search',
            icon: Icon(Icons.search),
            onTap: () => setState(() => _selectedIndex = 1),
            floatyActionButton: FloatyActionButton(
              icon: Icon(Icons.add),
              onTap: () {
                // Add action for search tab
              },
            ),
          ),
          FloatyTab(
            isSelected: _selectedIndex == 2,
            title: 'Profile',
            icon: Icon(Icons.person),
            onTap: () => setState(() => _selectedIndex = 2),
          ),
        ],
      ),
    );
  }
}
```

## Customization

FloatyNavBar offers various customization options:

### Tab Customization

You can customize each tab using the `FloatyTab` class:

```dart
FloatyTab(
  isSelected: bool,
  title: String,
  icon: Widget,
  onTap: VoidCallback,
  titleStyle: TextStyle?,
  floatyActionButton: FloatyActionButton?,
  margin: EdgeInsetsGeometry,
  selectedColor: Color?,
  unselectedColor: Color?,
)
```

### Floating Action Button

Each tab can have an associated floating action button:

```dart
FloatyActionButton(
  icon: Widget,
  onTap: VoidCallback,
  size: double?,
  backgroundColor: Color?,
  foregroundColor: Color?,
  elevation: double?,
)
```

### Navigation Bar Shape

You can choose from different shapes for your navigation bar:

```dart
FloatyNavBar(
  // ...
  shape: CircleShape(), // or RectangleShape() or SquircleShape()
)
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE]([LICENSE](https://github.com/Mustafa7Ibrahim/floaty_nav_bar/blob/main/LICENSE)) file for details.