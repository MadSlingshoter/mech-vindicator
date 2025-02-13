extends Node
class_name PrimaryArmamentComponent
## Base component for the player mech's primary armaments.
##
## The basic functionality for the player mech's primary armaments.

## The damage of each attack.
@export var damage: int
## How fast the armament shoots.
@export var rate_of_fire: float
## The projectile itself.
@export var projectile: Resource
## The player.
@export var player: Player

## Flag for if the player can currently shoot.
var can_shoot: bool = true

@onready var shot_timer = $ShotTimer

# Fires the primary armament. Adds the projectile to the scene.
func shoot(init_position: Vector2, init_rotation: float) -> bool:
	if can_shoot and shot_timer.is_stopped():
		var shot = projectile.instantiate()
		player.get_parent().add_child(shot)
		shot.init(init_position, init_rotation)
		shot_timer.start(rate_of_fire)
		return true
	return false
