extends State
## Enemy state for moving in a straight line towards the player.

# TODO emum for different behaviors

## How close to move to the player before switching states.
@export var min_length_to_player: float
## The state to switch to after moving.
@export var after_move_state: State

var displacement_test: float

## Called in the enemy's _physics_process function. What the enemy does when in
## the state.
func process_physics(delta: float) -> State:
	if Global.player != null: # need a player to do anything
		# Find the player's position and the displacement
		var player_position := Global.player.global_position
		var displacement_to_player := player_position - enemy.global_position
		# Rotate to face the player.
		animations_move.rotation = displacement_to_player.angle()
		animations_shoot.rotation = displacement_to_player.angle()
		# Move towards the player.
		enemy.velocity = displacement_to_player.normalized() * speed
		
		displacement_test = displacement_to_player.length()
		
		# If within a certain distance to the player, switch state
		if displacement_to_player.length() < min_length_to_player:
			return after_move_state
	
	return null
