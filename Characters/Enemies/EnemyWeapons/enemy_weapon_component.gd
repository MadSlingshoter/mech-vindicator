extends Node
class_name EnemyWeaponComponent
## Base node for enemy weapons.
##
## The basic functionality for the enemy mech's weapons. Can be inherited for 
## more specific behaviors.

## The damage of each attack.
@export var damage: int
## How fast the weapon shoots in seconds.
@export var rate_of_fire: float
## The projectile itself.
@export var projectile: Resource
## The parent enemy.
@export var enemy: Enemy

## Time counter for the firing rate
var counter : float = 0

## Fires the enemy's weapon. Adds the projectile to the scene.
func shoot(delta: float, init_position: Vector2, init_rotation: float) -> bool:
	if counter < rate_of_fire:
		counter += delta
	else:
		var shot = projectile.instantiate()
		enemy.get_parent().add_child(shot)
		shot.init(init_position, init_rotation)
		counter = 0
		return true
	return false
