#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // Run every frame.
    // delta is the time that has elapsed since the last time this was run. Usually 1/60.
    timeSinceObstacle += delta;
    if (timeSinceObstacle > 2.0f) {
        // Add a new obstacle.
        [self addObstacle];
        
        // Reset the timer.
        timeSinceObstacle = 0.0f;
    }
    
}

// put new methods here
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    // This will be called every time the player touches the screen.
    [character flap];
}

@end
