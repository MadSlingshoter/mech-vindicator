extends Node
class_name EnemyShootingComponent
## Component that handles the enemy's armaments.
##
## 

## Reference to the enemy.
@export var enemy: Enemy
## The origin point of the enemy's first weapon.
@export var origin_point1: Node2D
## The component for the enemy's first weapon.
@export var enemy_weapon_component1: EnemyWeaponComponent
## The origin point of the enemy's second weapon.
@export var origin_point2: Node2D
## The component for the enemy's second weapon.
@export var enemy_weapon_component2: EnemyWeaponComponent

## Called by the base enemy class to handle all matters concerning aiming
## and shooting.
func enemy_shooting(delta: float) -> void:
	# Shooting stuff
	if enemy_weapon_component1 != null and origin_point1 != null and enemy.can_shoot1:
		enemy_weapon_component1.shoot(delta, origin_point1.global_position, enemy.animations_shoot.rotation)
	if enemy_weapon_component2 != null and origin_point2 != null and enemy.can_shoot2:
		enemy_weapon_component2.shoot(delta, origin_point2.global_position, enemy.animations_shoot.rotation)
