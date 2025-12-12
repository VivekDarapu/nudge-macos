# Nudge macOS

A sleek macOS utility app that brings dynamic notch simulation capabilities to your MacBook Air M4 2025, similar to Nooknotch. Customize your notch with dynamic notifications, status indicators, and system information displays.

## Features

- **Dynamic Notch Simulation**: Displays a beautiful notch-inspired interface at the top of your screen
- **Customizable Widgets**: Add system status indicators, clock, weather, and more
- **Notification Center**: Integrated notification panel that respects macOS design language
- **System Integration**: Deep integration with macOS services for seamless experience
- **Performance Optimized**: Lightweight and efficient, minimal CPU/memory impact
- **Themeable Interface**: Support for light and dark modes with custom color schemes

## Requirements

- macOS 13.0 or later
- MacBook Air M4 2025 (or compatible Apple Silicon Mac)
- Swift 5.9+
- Xcode 15.0+

## Installation

### Build from Source

```bash
git clone https://github.com/VivekDarapu/nudge-macos.git
cd nudge-macos
xcodebuild -scheme nudge-macos -configuration Release
```

### Using Xcode

1. Open `nudge-macos.xcodeproj` in Xcode
2. Select the target scheme
3. Build (Cmd+B) and Run (Cmd+R)

## Project Structure

```
nudge-macos/
├── Sources/
│   ├── App/
│   │   └── NudgeApp.swift
│   ├── Views/
│   │   ├── NotchView.swift
│   │   ├── WidgetView.swift
│   │   └── SettingsView.swift
│   ├── Models/
│   │   ├── Widget.swift
│   │   └── Configuration.swift
│   └── Utilities/
│       └── SystemMonitor.swift
├── Resources/
│   └── Assets.xcassets
└── Tests/
```

## Development

### Building

```bash
swift build
```

### Running Tests

```bash
swift test
```

### Code Style

This project follows Swift API Design Guidelines. Please ensure your code is properly formatted before submitting pull requests.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by Nooknotch
- Built with Swift and SwiftUI
- Designed for MacBook Air M4 2025

## Support

If you encounter any issues or have feature requests, please open an issue on GitHub.

---

**Status**: Active Development 🚀
