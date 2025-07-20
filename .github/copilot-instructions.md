# Copilot Instructions for my_blog Flutter Project

## Project Overview
- This is a Flutter app with a modular structure under `lib/`.
- Main entry point: `lib/main.dart`.
- UI screens are in `lib/view/` (e.g., `register_intro.dart`, `my_cat.dart`).
- Constants and resources: `lib/const/`, `lib/gen/`, and `assets/`.
- Data models and mock data: `lib/models/`.

## Key Patterns & Conventions
- **Navigation:** Uses Flutter's Navigator for screen transitions (e.g., `pushReplacement`).
- **Bottom Sheets:** Shown via `showModalBottomSheet`, often with custom heights and rounded corners.
- **State Management:** Uses `StatefulWidget` for local state (e.g., tag selection in `my_cat.dart`).
- **Theming:** Text styles and colors are accessed via `Theme.of(context).textTheme` and custom color constants.
- **Assets:** Images and SVGs are loaded from `assets/` using generated code in `lib/gen/assets.gen.dart`.
- **Localization:** Strings are centralized in `lib/const/my_strings.dart`.

## Developer Workflows
- **Build:** Use `flutter run` or your IDE's Flutter integration.
- **Test:** Place widget tests in `test/` (e.g., `widget_test.dart`). Run with `flutter test`.
- **Hot Reload:** Supported for rapid UI iteration.
- **Android Back Gesture:** For Android 13+, ensure `android:enableOnBackInvokedCallback="true"` is set in `AndroidManifest.xml`.

## Project-Specific Notes
- **Custom Widgets:** Reusable UI components are in `lib/my_componnent.dart` and `lib/view/`.
- **Tag Selection:** Tag logic in `my_cat.dart` uses a `selectedTags` list and `setState` for updates.
- **Modal Context:** When using `showModalBottomSheet`, pass `MediaQuery` data from the parent context to avoid context errors.
- **SVG Support:** Requires `flutter_svg` package.

## Example: Showing a Modal Bottom Sheet
```dart
showModalBottomSheet(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,
  builder: (context) {
    return Container(
      height: size.height / 2,
      // ...
    );
  },
);
```

## Key Files/Directories
- `lib/main.dart`: App entry point
- `lib/view/`: UI screens
- `lib/const/`: Constants (colors, strings)
- `lib/models/`: Data models
- `lib/gen/`: Generated asset code
- `assets/`: Images, fonts, icons

---
If you add new patterns or workflows, update this file to help future AI agents and developers.
