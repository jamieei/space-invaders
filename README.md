# Godot Space Invaders

## Scenes

```mermaid
---
title: Screen Flow
---
stateDiagram-v2
    Title : Title Screen
    Game : Game Screen
    
    [*] --> Title
    Title --> Game : Play
    
    state Game {
        state Dead <<choice>>
        state PlayAgain <<choice>>
        [*] --> Level
        Level --> Level : Cleared
        Level --> Dead : Died
        Dead --> Level : extra_lives > 0
        Dead --> GameOver : extra_lives == 0
        GameOver --> PlayAgain
        PlayAgain --> Level : play again
    }
```

- [ ] Title screen
- [ ] Player / laser base
- [ ] Aliens (3)
- [ ] UFO
- [ ] Bunkers
- [ ] HUD

## References

### Screenshots

- https://www.pixelatedarcade.com/games/space-invaders/screenshots

### Gameplay

- http://www.freespaceinvaders.org
- [Space Invaders 1978 - Arcade Gameplay](https://youtu.be/MU4psw3ccUI?si=fx07xLHI2ABPWQK2)

### Other

- https://en.wikipedia.org/wiki/Space_Invaders
- https://engineering.purdue.edu/OOSD/F2009/Assignments/IPA/invader.html
- https://www.computerarcheology.com/Arcade/SpaceInvaders/
- https://www.goto10retro.com/p/revisiting-space-invaders
