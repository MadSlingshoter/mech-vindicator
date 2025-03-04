extends Area2D
class_name HurtBoxComponent
## Component that handles the player's hurtbox.
##
## This component is an area that is used by attacks to apply damage to the
## unit.

## The unit's health component.
@export var health_component : HealthComponent

## Called by attacks to deal damage to the character.
## Returns true if damage has been done.
func damage(attack : Attack) -> bool:
	return health_component.damage(attack.damage)
