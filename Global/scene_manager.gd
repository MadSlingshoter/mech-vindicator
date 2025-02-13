extends Node
## Manages scenes and switching of scenes.
##
## Autoload script that currently only handles switches scenes.

## The scenes in the game.
enum SceneName {
	MAIN_MENU, ## The main menu of the game.
	TEST_STAGE, ## Stage for testing things.
}

## The current scene loaded.
var curr_scene = null
## The current scene.
var scene_name : SceneName
## Flag for if the player can open the pause menu currently.
var can_pause : bool = false
## A reference in the scene for other nodes to easily access it.
var player : Player

# Called when the node enters the scene tree for the first time.
# Sets the current scene and randomizes the RNG
func _ready():
	var root = get_tree().root
	curr_scene = root.get_child(root.get_child_count() - 1) # Starting scene is the last one in the tree after the autoloaded nodes.
	randomize()

## Changes the scene
func load_new_scene(new_scene_name : SceneName) -> void:
	var path
	match new_scene_name:
		SceneName.MAIN_MENU:
			path = "res://Menus/main_menu.tscn"
		SceneName.TEST_STAGE:
			path = "res://Stages/test_stage.tscn"
	
	call_deferred("_deferred_goto_scene", path)

## Will be used instead of _deferred_goto_scene once loading screen things.
func _load_content(path: String) -> void:
	var loader = ResourceLoader.load_threaded_request(path)

# Loading a new scene needs to be in a call_deferred function
func _deferred_goto_scene(path) -> void:
	# It is now safe to remove the current scene.
	curr_scene.free()
	
	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	curr_scene = s.instantiate()
	
	# Add it to the active scene, as child of root.
	get_tree().root.add_child(curr_scene)
