# Kasih

A small 2D game project built with [LÖVE](https://love2d.org/), a framework for creating games in Lua.

## About

Kasih is a base framework for making games faster using object-oriented programming principles. It aims to simplify game development by providing reusable, extensible components:

- **Class System** - A lightweight OOP foundation that allows easy inheritance and extension of game objects
- **Entity System** - Pool-based entity management for efficient object tracking and lifecycle management
- **Sprite System** - Animation-ready sprites with frame-based state management
- **Scene Management** - Organized scene system for managing different game states
- **SpriteSheet Support** - Efficient sprite sheet handling for optimized rendering
- **Timer System** - Pool-based timer management for scheduling delayed and recurring callbacks

## Getting Started

### Requirements

- [LÖVE 11.0](https://love2d.org/) or higher
- Lua 5.1+

### Running the Game

```bash
love .
```

Or double-click `main.lua` if you have LÖVE associated with `.lua` files.

## Project Structure

```
kasih/
├── assets/          # Game assets (sprites, fonts, icons)
├── entities/        # Entity definitions (player, enemies, etc.)
├── lib/             # Core library code (Entity, Sprite, Scene, etc.)
├── scenes/          # Game scenes (Title, Level, Menu, etc.)
├── main.lua         # Entry point
├── conf.lua         # LÖVE configuration
└── README.md        # This file
```

## Credits

### Assets & Resources

- **Monogram Font** - [DataGoblin](https://datagoblin.itch.io/monogram)
  - Pixel art font used for UI text

### Framework

- **LÖVE 2D** - [love2d.org](https://love2d.org/)
  - Game framework and development environment
