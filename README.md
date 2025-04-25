# CarryAutoResponder

## Overview
CarryAutoResponder is a lightweight World of Warcraft addon that automatically responds to whispers when you're in a dungeon or raid instance. It's particularly useful for players who offer carry services and need to manage client communications while actively engaged in gameplay.

## Features
- Automatically detects when you're in a dungeon or raid instance
- Sends customizable auto-responses to whispers
- Prevents spam by limiting responses to once per player every 5 minutes
- Simple slash commands for configuration
- Minimal performance impact

## Installation
1. Download the addon
2. Extract the CarryAutoResponder folder to your WoW AddOns directory:
   `World of Warcraft\_retail_\Interface\AddOns\`
3. Restart World of Warcraft or reload your UI

## Usage
The addon is enabled by default after installation. Use the following slash commands to configure it:

- `/car on` - Enable auto-responses
- `/car off` - Disable auto-responses
- `/car message [text]` - Set a custom auto-response message
- `/car status` - Check current settings

## Example
Set a custom message:
```
/car message Thanks for your interest in our carry services! I'm currently in a run. Please wait and I'll respond when finished. For immediate assistance, contact my partner Powercarry-Stormrage.
```

## Default Message
The default message is:
```
Thanks for your interest in our carry services! I'm currently in a dungeon/raid run. Please wait and I'll get back to you as soon as possible. For immediate booking, you can message my partner at [PARTNER_NAME].
```

## Customization
You can directly edit the Lua file to change:
- Default message text
- Cooldown between responses (default: 5 minutes)
- Color of addon messages in chat

## Known Issues
- The addon only functions within instances (dungeons/raids)
- The auto-reply won't send if the player has you ignored

## License
MIT License

Copyright (c) 2025 Koldar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Contributing
Contributions are welcome! Feel free to submit pull requests or create issues for bugs and feature requests.

## Version History
- 1.0.0: Initial release
  - Basic auto-response functionality
  - Slash commands for configuration

## Acknowledgments
- Inspired by the needs of the WoW boosting community
- Thanks to the World of Warcraft addon development community for documentation and examples
