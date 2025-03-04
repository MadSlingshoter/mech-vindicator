extends CharacterBody2D
class_name Player
## The base for the player mechs.
##
## The base that all the player mechs use. The individual components that have
## the mech's characteristics are then added.

## AnimatedSprite2D for the movement part of the mech.
@export var animations_move: AnimatedSprite2D
## AnimatedSprite2D for the weapon part of the mech.
@export var animations_shoot: AnimatedSprite2D
## Component that handles the player's movement.
@export var player_movement_component: PlayerMovementComponent
## Component that handles the player's aiming and shooting.
@export var player_shooting_component: PlayerShootingComponent
## Component that handles health.
@export var health_component: HealthComponent
## Component for the player's hurtbox
@export var hurt_box_component: HurtBoxComponent

func _ready() -> void:
	health_component.killed.connect(_on_health_killed)

func _physics_process(delta: float) -> void:
	# Movement
	player_movement_component.player_movement()
	
	# Aiming and shooting
	player_shooting_component.player_shooting(delta)


func _on_health_killed():
	queue_free()
