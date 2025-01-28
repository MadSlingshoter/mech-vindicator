extends Node
class_name PlayerMovementComponent
## Component that handles the player's movement.
##
## This component controls the player's movment and it's bottom part. 

## The base speed of the player.
@export var base_speed: float
## Reference to the player.
@export var player: Player

## Called by the base player class to handle all movement.
func player_movement() -> void:
	# Left stick input
	var direction:= Vector2(Input.get_vector("move_left", "move_right", "move_up", "move_down"))
	
	# If no input, then stay idle. Else, walk.
	if direction.x == 0.0 and direction.y == 0.0:
		player.animations_bottom.play("idle")
		player.velocity = Vector2(0.0, 0.0)
	else:
		walk(direction)
	
	player.move_and_slide()

## The player walks in the given direction. The bottom turns to face the 
## walking direction.
func walk(direction: Vector2) -> void:
	player.animations_bottom.play("walk")
	player.animations_bottom.rotation = direction.angle()
	player.velocity = direction * base_speed
