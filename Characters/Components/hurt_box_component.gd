extends Area2D
class_name HurtBoxComponent
## Component that handles the player's hurtbox.
##
## This component is an area that is used by attacks to apply damage to the
## unit. The default values are set up for enemies as there are more of them.

## Signals that the unit has been hit by an attack.
signal damage_taken(attack : Attack)

## The unit's health component.
@export var health_component : HealthComponent

## Called by attacks to deal damage to the character.
## Will call the Health node's damage function. The bool return is mainly used for attacks that are
## destroyed only if the enemy is not killed.
func damage(attack : Attack) -> bool:
	emit_signal("damage_taken", attack)
	return health_component.damage(attack.damage)
