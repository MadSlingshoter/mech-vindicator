extends Area2D
## The projectile for the Grunt enemy.
##
## Beam rifle shot that travels in a straight line. Is removed on hit.

## The projectile's speed.
var speed: float = 300.0
## The projectile's damage.
var damage: int = 10
## The projectile's travel direction.
var direction := Vector2.RIGHT
## If true, the projectile is active. Need?
var active: bool = false

## Sets the initial values for the projectile.
func init(init_position: Vector2, init_rotation: float) -> void:
	global_position = init_position
	rotation = init_rotation
	direction = direction.rotated(rotation)
	active = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta

# Removes if not on screen anymore. Should be changed so that it is removed
# when traveling outside the stage.
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if active:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	# Damage player
	if area is HurtBoxComponent:
		var attack = Attack.new()
		attack.damage = damage
		area.damage(attack)
		queue_free()
