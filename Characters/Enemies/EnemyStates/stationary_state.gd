extends State
## Enemy state for standing still.

## How close to move to the player before switching states.
@export var max_length_to_player: float
## The state to switch to after moving.
@export var after_stationary_state: State

## Called when the state is entered.
func enter() -> void:
	super()
	enemy.velocity = Vector2.ZERO

## Called in the enemy's _physics_process function. What the enemy does when in
## the state.
func process_physics(delta: float) -> State:
	if Global.player != null: # need a player to do anything
		# Find the player's position and the displacement
		var player_position := Global.player.global_position
		var displacement_to_player := player_position - enemy.global_position
		# Rotate the weapon part to face the player.
		animations_shoot.rotation = displacement_to_player.angle()

		# If outside a certain distance to the player, switch state
		if displacement_to_player.length() > max_length_to_player:
			return after_stationary_state
	
	return null
