extends CharacterBody2D
class_name Player
## The base for the player mechs.
##
## The base that all the player mechs use. The individual components that have
## the mech's characteristics are then added.

## AnimatedSprite2D for the bottom part of the mech.
@export var animations_bottom: AnimatedSprite2D
## AnimatedSprite2D for the top part of the mech.
@export var animations_top: AnimatedSprite2D
## Component that handles the player's movement.
@export var player_movement_component: PlayerMovementComponent
## Component that handles the player's aiming and shooting.
@export var player_shooting_component: PlayerShootingComponent
## Component that handles health.
@export var health_component: HealthComponent

# HurtBox component


func _physics_process(delta: float) -> void:
	# Movement
	player_movement_component.player_movement()
	
	# Aiming and shooting
	player_shooting_component.player_shooting()
