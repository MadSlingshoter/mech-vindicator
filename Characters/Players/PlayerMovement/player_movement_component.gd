extends Node
class_name PlayerMovementComponent
## Component that handles the player's movement.
##
## This component controls the player's movement and it's animations. 

## The base speed of the player.
@export var base_speed: float
## Reference to the player.
@export var player: Player

## True if the player is currently moving.
var is_moving: bool = false

## Called by the base player class to handle all movement.
func player_movement() -> void:
	# Left stick input
	var direction:= Vector2(Input.get_vector("move_left", "move_right", "move_up", "move_down"))
	
	# If no input, then stay idle. Else, walk.
	if direction.x == 0.0 and direction.y == 0.0:
		player.animations_move.play("idle")
		player.velocity = Vector2(0.0, 0.0)
		is_moving = false
	else:
		walk(direction)
		is_moving = true
	
	player.move_and_slide()

## The player walks in the given direction. The bottom turns to face the 
## walking direction.
func walk(direction: Vector2) -> void:
	player.animations_move.play("walk")
	player.animations_move.rotation = direction.angle()
	player.velocity = direction * base_speed
