extends Node

## The different player mechs.
enum PlayerMech{
	KAISER, ## The Kaiser mech.
	ARACHNIS, ## The Arachnis mech.
}

## Reference to the current player mech. Used to let other nodes to easily 
## access the player.
var player: Player
