extends Node
class_name EnemyStateManager
## Manages the states of the enemies.
##
## Changes the states. Can also override to specific states.

## The state that the enemy starts in.
@export var starting_state: State
# death state
# stunned state

## The state that is currently being used.
var current_state: State

## Initializes the manager.
func init(enemy: Enemy, animations_move: AnimatedSprite2D, animations_shoot: AnimatedSprite2D) -> void:
	for child in get_children():
		child.enemy = enemy
		child.animations_move = animations_move
		child.animations_shoot = animations_shoot
	
	change_state(starting_state)

## Changes the current state. Calls the exit function of the previous state and
## the enter function of the new state.
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

## TODO Called when the enemy is destroyed. 
func death() -> void:
	pass

## TODO Called when the enemy is stunned. 
func stun() -> void:
	pass

## Process the current state. If the state returns a new state, then change to
## that state.
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
