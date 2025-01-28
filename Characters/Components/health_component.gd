extends Node
class_name HealthComponent
## Component that handles the unit's health and health related things.
##
## This component is attached to any unit that has a health and can take
## damage.

## Signals that the unit's health has been damaged and what the new current
## health is.
signal health_damaged(curr_health)
## Signals that the unit's health has been healed and what the new current 
## health is.
signal health_healed(curr_health)
## Signals that the unit has run out of health.
signal killed()

## The maximum health of the unit.
@export var max_health: int

## The current health of the unit.
var curr_health: int
## If the unit can take damage or get healed. False for wave transitions 
## and cutscenes.
var can_interact : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curr_health = max_health

## Called to apply damage to the unit. The bool return is mainly used for 
## attacks that are destroyed only if the enemy is not killed.
func damage(value) -> bool:
	# Take no damage during wave transitions and cutscenes.
	if can_interact:
		var prev_health = curr_health
		curr_health = clamp(curr_health - value, 0, max_health)
		
		# If damage is taken
		if curr_health != prev_health:
			emit_signal("health_damaged", curr_health)
			
			# If lose all health.
			if curr_health <= 0:
				emit_signal("killed")
			return true
	return false

## Called to apply healing to the unit.
func heal(value):
	# Cannot be healed during room transitions and cutscenes.
	if can_interact:
		var prev_health = curr_health
		curr_health = clamp(curr_health + value, 0, max_health)
		
		# If healed
		if curr_health != prev_health:
			emit_signal("health_healed", curr_health)
