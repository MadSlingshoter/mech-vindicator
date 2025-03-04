extends Area2D
class_name ContactHitBoxComponent
## Component for damaging the player when they touch an enemy.
##
## Causes damage to the player when they touch it. After doing so, then
## deactivates the collisionshape for a short time.

## The CollisionShape2D for the area.
@export var collision_shape: CollisionShape2D
## The damage on contact.
@export var damage: int
## How often the contact damage is dealt.
@export var hit_frequency: float = 0.5

## Timer for how long the collision shape is deactivated after a hit.
@onready var deactive_timer = $DeactiveTimer

func _on_area_entered(area: Area2D) -> void:
	# Damage player
	if area is HurtBoxComponent:
		var attack = Attack.new()
		attack.damage = damage
		area.damage(attack)
		collision_shape.set_deferred("disabled", true)
		deactive_timer.start(hit_frequency)


func _on_deactive_timer_timeout() -> void:
	collision_shape.set_deferred("disabled", false)
