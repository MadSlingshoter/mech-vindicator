extends Node
class_name State
## Base node for states.
##
## Inherited by all other states. Used by enemies as the player does not need
## a state machine.

## The movement speed of the enemy.
@export var speed: float = 100
## If true, the enemy can shoot weapon 1 during this state
@export var can_shoot1: bool = false
## If true, the enemy can shoot weapon 2 during this state
@export var can_shoot2: bool = false
## The name of the animation to play for the movement part of the mech.
@export var animation_move_name : String = "idle"
## The name of the animation to play for the weapon part of the mech.
@export var animation_shoot_name : String = "idle"

## The parent enemy.
var enemy: Enemy
## AnimatedSprite2D for the movement part of the mech.
var animations_move: AnimatedSprite2D
## AnimatedSprite2D for the weapon part of the mech.
var animations_shoot: AnimatedSprite2D

## Called when the state is entered.
func enter() -> void:
	animations_move.play(animation_move_name)
	animations_shoot.play(animation_shoot_name)
	enemy.can_shoot1 = can_shoot1
	enemy.can_shoot2 = can_shoot2

## Called when the state is exitted.
func exit() -> void:
	pass

## Called in the enemy's _physics_process function. What the enemy does when in
## the state.
func process_physics(delta: float) -> State:
	return null
