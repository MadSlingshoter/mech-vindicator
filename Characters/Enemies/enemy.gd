extends CharacterBody2D
class_name Enemy
## Base for all enemies.
##
## To be inherited by the enemies.

## AnimatedSprite2D for the movement part of the mech.
@export var animations_move: AnimatedSprite2D
## AnimatedSprite2D for the weapon part of the mech.
@export var animations_shoot: AnimatedSprite2D
## Component that handles health.
@export var health_component: HealthComponent
## Component for the enemies's hurtbox
@export var hurt_box_component: HurtBoxComponent
# Contact hitbox
## Enemy state manager component for the enemy's states.
@export var enemy_state_manager: EnemyStateManager
## Enemy shooting component for the enemy's weapons.
@export var enemy_shooting_component: EnemyShootingComponent

var can_shoot1: bool = false
var can_shoot2: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_state_manager.init(self, animations_move, animations_shoot)
	health_component.killed.connect(_on_health_killed)

func _physics_process(delta: float) -> void:
	enemy_state_manager.process_physics(delta)
	enemy_shooting_component.enemy_shooting(delta)
	
	move_and_slide()



func _on_health_killed():
	queue_free()
