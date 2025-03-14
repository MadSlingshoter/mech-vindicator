extends Node
class_name PlayerShootingComponent
## Component that handles the player's armaments.
##
## This component controls the player's aiming, armaments and it's top part.

## Reference to the player.
@export var player: Player

## The origin point of the primary origin projectiles.
@export var primary_origin_point: Node2D
## The primary armament component for the mech.
@export var primary_armament_component: PrimaryArmamentComponent
# Secondary armament 1 point
# Secondary armament 1
# Secondary armament 2 point
# Secondary armament 2
# Defensive armament point
# Defensive armament

## Called by the base player class to handle all matters concerning aiming
## and shooting.
func player_shooting(delta: float) -> void:
	# Right stick input
	var direction:= Vector2(Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down"))
	
	# If no direction is held, then the aiming is in the walking direction
	if direction.x == 0.0 and direction.y == 0.0 and player.player_movement_component.is_moving:
		player.animations_shoot.rotation = player.animations_move.rotation
	elif direction.x != 0.0 or direction.y != 0.0:
		player.animations_shoot.rotation = direction.angle()
	
	# Shooting stuff
	if Input.is_action_pressed("primary"):
		primary_armament_component.shoot(delta, primary_origin_point.global_position, player.animations_shoot.rotation)
		
