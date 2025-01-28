extends Node
class_name PlayerShootingComponent
## Component that handles the player's armaments.
##
## This component controls the player's aiming, armaments and it's top part.

## Reference to the player.
@export var player: Player

# Primary armament point
# Primary armament 
# Secondary armament 1 point
# Secondary armament 1
# Secondary armament 2 point
# Secondary armament 2
# Defensive armament point
# Defensive armament

## Called by the base player class to handle all matters concerning aiming
## and shooting.
func player_shooting() -> void:
	# Right stick input
	var direction:= Vector2(Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down"))
	
	# If no direction is held, then the aiming is in the walking direction
	if direction.x == 0.0 and direction.y == 0.0:
		player.animations_top.rotation = player.animations_bottom.rotation
	else:
		player.animations_top.rotation = direction.angle()
	
	# Shooting stuff
