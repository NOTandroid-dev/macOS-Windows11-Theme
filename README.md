# macOS Windows 11 Theme

A small, open-source project for giving macOS a Windows 11-inspired look using a curated set of wallpapers, accent colors, Dock tweaks, and icon templates.

This project does not install Windows or modify the underlying operating system. It is a style pack for macOS users who want a cleaner, more Windows-like desktop experience.

## What this project includes

- Windows 11-inspired wallpaper asset
- Start button / app icon SVG templates
- macOS Dock customization script
- Menu bar and Finder tweaks
- Setup instructions for a Windows 11 aesthetic on a Mac

## Why use it

- Gives your Mac a cleaner, more modern desktop
- Useful for developers and creators who want a hybrid workflow
- Easy to customize and extend

## Repository structure

```text
.
├── README.md
├── .gitignore
├── docs/
│   └── SETUP.md
├── scripts/
│   ├── install-theme.sh
│   └── uninstall-theme.sh
├── assets/
│   ├── wallpapers/
│   │   └── windows11-aurora.svg
│   └── icons/
│       ├── start-button.svg
│       └── folder-win11.svg
└── theme/
    └── sample-theme.json
```

## Quick start

1. Open Terminal.
2. Clone the repo.
3. Run the installer script:

```bash
chmod +x scripts/install-theme.sh
./scripts/install-theme.sh
```

4. Restart the Dock if needed.
5. Change your wallpaper and app icons manually if you want a more custom style.

## Included theme behavior

The installer script applies a set of lighter, Windows-inspired preferences:

- sets a Windows-like wallpaper
- enables a more minimal Dock
- reduces transparency for a flatter look
- sets a clean, simplified Finder appearance
- keeps the theme easy to undo with the uninstall script

## Important note

This is a cosmetic theme pack. It is designed to make macOS feel more like Windows 11 in appearance, but it does not convert macOS into Windows or change the system kernel.

## Customization ideas

- Replace the wallpaper with your favorite Windows 11 image.
- Use your own icon pack for Dock and Finder.
- Change the accent color in the script to match your preferred Windows palette.
- Build a companion app or menu-based installer later.

## Contribution

Contributions are welcome.

You can:

- add more wallpapers
- create a better icon pack
- improve the script
- write better installation documentation

## License

MIT
