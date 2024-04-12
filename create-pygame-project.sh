if [[ $1 ]]; then
directory=$(mkdir $1)
cd $1
main_file=$(touch main.py)
run_file=$(touch run.sh)

chmod +x run.sh
echo "python main.py" >> run.sh

read -r -d '' TEXT << EOM

# Example file showing a basic pygame "game loop"
import pygame

# pygame setup
pygame.init()
screen = pygame.display.set_mode((1280, 720))
clock = pygame.time.Clock()
running = True

while running:
    # poll for events
    # pygame.QUIT event means the user clicked X to close your window
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # fill the screen with a color to wipe away anything from last frame
    screen.fill("purple")

    # RENDER YOUR GAME HERE

    # flip() the display to put your work on screen
    pygame.display.flip()

    clock.tick(60)  # limits FPS to 60

pygame.quit()
EOM

echo "$TEXT" > main.py
else
echo "Please list a project name"
fi
