extends Node2D
## Temporary script until other things are done

@onready var player: Player = $Kaiser

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## this should be done by the player spawner
	Global.player = player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
