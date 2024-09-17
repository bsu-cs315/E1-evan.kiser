## Exercise 1 - 2D Physics-Based Gameplay
- CS 315 - Game Programming - 2D Physics-Based Gameplay

### Description
This is a game where the player's goal is to launch a ball at a flag.

  #### Controls
  - W / Up Arrow Key decreases the angle at which the ball is launched
  - S / Down Arrow Key increases the angle at which the ball is launched
  - A / Left Arrow  Key decreases the power at which the ball is launched
  - D / Right Arrow  Key increases the power at which the ball is launched
  - Space will launch the Ball
  - A message will display when you hit the flag with the ball
  - After 8 seconds, you will be sent back to the title screen
  - If you run out of balls after 8 seconds a message will pop up saying you lost
  - After 8 seconds, you will be sent back to the title screen

### Licenses
- I used assets from [Kenney's Physic Assets](https://www.kenney.nl/assets/physics-assets) licensed under [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)
- I used assets from [Kenney's Top-Down Tanks Assets](https://www.kenney.nl/assets/top-down-tanks) licensed under [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)
- I generated the sound effects used in the game

### Activity Report
- Controls: The controls for the game are listed
- Graphics: The projectile, cannon, target, background, and ground all have graphics attached to them
- Sound: The cannon emits a sound when fired using a .wav file
- Projectiles: The user is limited to a number of projectiles and can only fire when the previous projectile is not active
- Core Loop: The game starts with a title screen, transitions on player command to a gameplay screen, then returns to the title screen at the end of the game
- Pop: The title screen includes an animated element using AnimationPlayer
- Style: Your project complies with our style guide's recommendations
- Clean: Generate neither warnings nor errors at runtime
- Licenses: The license is provided above
- Version Control Management: I used GitBash and Git for my version control, created a Repository, added a README file, and released a Release in Github.
- Release Management: I have released the project on GitHub using semantic versioning.
- Report: I completed all of the essential.
