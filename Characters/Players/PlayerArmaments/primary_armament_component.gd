extends Node
class_name PrimaryArmamentComponent
## Base component for the player mech's primary armaments.
##
## The basic functionality for the player mech's primary armaments.

## The damage of each attack.
@export var damage: int
## How fast the armament shoots in seconds.
@export var rate_of_fire: float
## The projectile itself.
@export var projectile: Resource
## The player.
@export var player: Player

## Flag for if the player can currently shoot.
var can_shoot: bool = true
## Time counter for the firing rate.
var counter : float

func _ready() -> void:
	# Can shoot immediately
	counter = rate_of_fire

## Fires the primary armament. Adds the projectile to the scene.
func shoot(delta: float, init_position: Vector2, init_rotation: float) -> bool:
	if counter < rate_of_fire:
		counter += delta
	else:
		if can_shoot:
			var shot = projectile.instantiate()
			player.get_parent().add_child(shot)
			shot.init(init_position, init_rotation)
			counter = 0
			return true
	return false
