extends Area2D
## The primary armament projectile for the Kaiser player mech.
##
## A beam rifle shot that travels in a straight line and damages the first 
## enemy hit.

## The projectile's speed.
var speed: float = 500.0
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
	## Damage enemy
	pass # Replace with function body.
